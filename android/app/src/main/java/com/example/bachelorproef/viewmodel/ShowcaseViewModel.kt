package com.example.bachelorproef.viewmodel

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData

class ShowcaseViewModel(application: Application) : AndroidViewModel(application) {
    private val title = MutableLiveData<String>()

    fun setTitle(value: String){
        title.value = value
    }

    fun getTitle() = title as LiveData<String>
}