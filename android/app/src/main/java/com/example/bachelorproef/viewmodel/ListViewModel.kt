package com.example.bachelorproef.viewmodel

import androidx.lifecycle.ViewModel

class ListViewModel : ViewModel() {
    private val items = listOf(
        "lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit",
        "lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit",
        "lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit"
    )

    fun getItems() = items
}