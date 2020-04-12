package com.example.bachelorproef.ui.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.bachelorproef.R
import com.example.bachelorproef.viewmodel.SharedViewModel
import org.koin.androidx.viewmodel.ext.android.viewModel

class MainActivity : AppCompatActivity() {

    private val sharedViewModel : SharedViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(findViewById(R.id.toolbar))
    }
}