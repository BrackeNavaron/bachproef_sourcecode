package com.example.bachelorproef

import com.example.bachelorproef.R
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.test.core.app.ActivityScenario
import androidx.test.espresso.Espresso.*
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.matcher.ViewMatchers.*
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.platform.app.InstrumentationRegistry
import com.example.bachelorproef.runner.TestApp
import com.example.bachelorproef.ui.activity.MainActivity
import com.example.bachelorproef.viewmodel.ListViewModel
import com.example.bachelorproef.viewmodel.SharedViewModel
import com.example.bachelorproef.viewmodel.ShowcaseViewModel
import org.hamcrest.CoreMatchers.allOf
import org.hamcrest.CoreMatchers.instanceOf
import org.junit.Test
import org.junit.runner.RunWith
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module
import org.koin.test.KoinTest


@RunWith(AndroidJUnit4::class)
class ExampleIntegrationTest : KoinTest {
    val ctx = InstrumentationRegistry.getInstrumentation().targetContext
    val app = ctx.applicationContext as TestApp

    @Test
    fun someTest(){
        //Do mocking here and then put the mocks in the modules

        val module = module {
            viewModel {
                ShowcaseViewModel(get())
            }
            viewModel {
                ListViewModel()
            }
            viewModel {
                SharedViewModel()
            }
        }

        app.loadModules(module){
            //Launch an activity Scenario that starts MainActivity
            ActivityScenario.launch(MainActivity::class.java)

            //Main Activity is now on screen, do the test

            //Tap Menu
            openActionBarOverflowOrOptionsMenu(ctx)

            //Tap Item 3
            onView(withId(R.id.three)).perform(click())

            //find title text, should be updated to the new string
            onView(
                allOf(
                    instanceOf(TextView::class.java),
                    withParent(withId(R.id.toolbar))
                )
            ).check(matches(withText(app.getString(R.string.three))))

            //Navigate to new destination (list page)
            onView(
                allOf(
                    instanceOf(CardView::class.java),
                    withChild(allOf(
                        instanceOf(TextView::class.java),
                        withText(app.getString(R.string.choice_lists))
                    ))
                )
            ).perform(click())

            //Check if the list page updated the toolbar
            onView(
                allOf(
                    instanceOf(TextView::class.java),
                    withParent(withId(R.id.toolbar))
                )
            ).check(matches(withText(app.getString(R.string.choice_lists))))

            //Navigate back to showcase grid
            pressBack()
            //check if the title is the first value again, since we don't store it anywhere
            onView(
                allOf(
                    instanceOf(TextView::class.java),
                    withParent(withId(R.id.toolbar))
                )
            ).check(matches(withText(app.getString(R.string.one))))
        }
    }
}