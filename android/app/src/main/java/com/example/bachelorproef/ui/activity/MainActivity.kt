package com.example.bachelorproef.ui.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.bachelorproef.R


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(findViewById(R.id.toolbar))
    }
}