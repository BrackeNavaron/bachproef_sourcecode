package com.example.bachelorproef.viewmodel

import android.app.Application
import android.graphics.drawable.Drawable
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.bachelorproef.R
import com.example.bachelorproef.application.MyApplication
import com.example.bachelorproef.util.IOnTextChangedListener

class FormViewModel(application: Application) : AndroidViewModel(application) {
    val dropdownValues = listOf(1,2,3,4,5)
    private val textInput = MutableLiveData("")
    private val textInputError = MutableLiveData<String>(null)
    val textInputDrawable = MutableLiveData<Drawable>(null)
    private val maxTextLength = 20
    private val switchInput = MutableLiveData(false)
    //Assuming radio 1 is true
    private val radioInput = MutableLiveData(true)
    private val checkboxInput = MutableLiveData(false)
    private val sliderInput = MutableLiveData(0)
    private val dropdownInput = MutableLiveData(dropdownValues[0])
    val sliderMax = 100

    fun getSliderInput(): LiveData<Int> = sliderInput
    fun getSwitchInput(): LiveData<Boolean> = switchInput
    fun getRadioInput(): LiveData<Boolean> = radioInput
    fun getCheckboxInput(): LiveData<Boolean> = checkboxInput
    fun getTextInput(): LiveData<String> = textInput
    fun getTextInputError(): LiveData<String> = textInputError
    fun getDropDownInput(): LiveData<Int> = dropdownInput

    val onInputFieldOneChanged = object : IOnTextChangedListener {
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

    fun onSwitchChanged(){
        switchInput.value = !switchInput.value!!
    }

    fun onRadioChanged(isRadio1: Boolean){
        radioInput.value = isRadio1
    }

    fun onCheckboxChanged(){
        checkboxInput.value = !checkboxInput.value!!
    }

    fun onSliderChanged(newValue: Int){
        sliderInput.value = newValue
    }

    fun onDropDownChanged(newValue: Int){
        dropdownInput.value = newValue
    }
}