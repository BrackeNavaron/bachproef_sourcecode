package com.example.bachelorproef.runner

import android.app.Application
import android.content.Context
import androidx.test.runner.AndroidJUnitRunner

/**
 * This runner will execute our UI tests.
 */
class KoinTestRunner: AndroidJUnitRunner() {
    override fun newApplication(cl: ClassLoader?, className: String?, context: Context?): Application {
        return super.newApplication(
            cl, TestApp::class.java.name, context
        )
    }
}