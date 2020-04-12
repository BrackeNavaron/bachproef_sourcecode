package com.example.bachelorproef.application

import androidx.multidex.MultiDexApplication
import com.example.bachelorproef.viewmodel.*
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.context.startKoin
import org.koin.dsl.module

class MyApplication : MultiDexApplication() {
    override fun onCreate() {
        super.onCreate()
        setupKoin()
    }

    /**
     * Setup DI with Koin.
     */
    private fun setupKoin(){
        startKoin {
            androidLogger()
            androidContext(this@MyApplication)
            modules(listOf(viewModelModule))
        }
    }

    private val viewModelModule = module {
        viewModel {
            ShowcaseViewModel(get())
        }
        viewModel {
            PagerViewModel()
        }
        viewModel {
            ListViewModel()
        }
        viewModel {
            FormViewModel(get())
        }
        //Get this VM: by sharedViewModel()
        viewModel {
            SharedViewModel()
        }
    }
}