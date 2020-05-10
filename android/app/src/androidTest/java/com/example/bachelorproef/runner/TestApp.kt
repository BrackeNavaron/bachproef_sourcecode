package com.example.bachelorproef.runner

import android.app.Application
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.loadKoinModules
import org.koin.core.context.startKoin
import org.koin.core.context.unloadKoinModules
import org.koin.core.module.Module


class TestApp : Application() {
    override fun onCreate() {
        super.onCreate()
        startKoin {
            androidLogger()
            androidContext(this@TestApp)
            modules(emptyList())//Modules are loaded during the test
        }
    }

    //This method is some boilerplate
    //It loads the Koin Modules for the test
    //Then it runs the test code
    //After the test it removes the modules so a new test can insert its own modules
    internal fun loadModules(module: Module, block: () -> Unit){
        loadKoinModules(module)
        block()
        unloadKoinModules(module)
    }
}