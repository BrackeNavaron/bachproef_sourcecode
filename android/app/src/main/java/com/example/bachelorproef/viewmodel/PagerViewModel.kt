package com.example.bachelorproef.viewmodel

import androidx.lifecycle.ViewModel

class PagerViewModel : ViewModel() {
    private val items = listOf(1,2,3)

    fun getItems() = items
}