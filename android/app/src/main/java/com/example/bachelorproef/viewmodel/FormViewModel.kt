package com.example.bachelorproef.viewmodel

import android.app.Application
import android.graphics.drawable.Drawable
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.bachelorproef.R
import com.example.bachelorproef.application.MyApplication
import com.example.bachelorproef.util.IOnTextChangedListener

class FormViewModel(application: Application) : AndroidViewModel(application), IOnTextChangedListener {
    private val textInput = MutableLiveData("")
    private val textInputError = MutableLiveData<String>(null)
    val textInputDrawable = MutableLiveData<Drawable>(null)
    private val maxTextLength = 20

    fun getTextInput(): LiveData<String> = textInput
    fun getTextInputError(): LiveData<String> = textInputError

    override fun onTextChanged(text: CharSequence?) {
        when {
            text.isNullOrBlank() -> {
                textInputError.value = getApplication<MyApplication>().getString(R.string.form_text_required)
            }
            text.length > maxTextLength -> {
                textInputError.value = getApplication<MyApplication>().getString(R.string.form_text_max_value,maxTextLength)
            }
            else -> {
                textInputError.value = null
                textInput.value = text.toString()
            }
        }
    }
}