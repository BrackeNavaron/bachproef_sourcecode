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
class BottomNavigationTest : KoinTest {
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
                SharedViewModel()
            }
        }

        app.loadModules(module){
            //Launch an activity Scenario that starts MainActivity
            ActivityScenario.launch(MainActivity::class.java)
            //Wait for the bottom navbar (Showcase | Settings) items
            onView(withId(R.id.bottomNav)).check(matches(isDisplayed()))
            //Click on settings item in bottom navbar
            //withText fails on a multiple matching views exception, hence the with content description
            onView(withContentDescription(R.string.menu_settings)).perform(click())
            //Find the toolbar title
            onView(
                allOf(
                    instanceOf(TextView::class.java),
                    withParent(withId(R.id.toolbar))
                )
                //check if it has changed to settings
                //since we navigate to settings page by clicking
            ).check(matches(withText(R.string.menu_settings)))
        }
    }
}