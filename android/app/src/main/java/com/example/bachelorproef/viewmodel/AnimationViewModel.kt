package com.example.bachelorproef.viewmodel

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class AnimationViewModel : ViewModel() {
    private val animOneButtonClicked = MutableLiveData(false)
    private val animTwoButtonClicked = MutableLiveData(false)
    private val animThreeButtonClicked = MutableLiveData(false)
    private val animFourButtonClicked = MutableLiveData(false)

    fun getAnimOneClicked() : LiveData<Boolean> = animOneButtonClicked
    fun getAnimTwoClicked() : LiveData<Boolean> = animTwoButtonClicked
    fun getAnimThreeClicked() : LiveData<Boolean> = animThreeButtonClicked
    fun getAnimFourClicked() : LiveData<Boolean> = animFourButtonClicked

    fun onButtonOneClicked(){
        animOneButtonClicked.value = !animOneButtonClicked.value!!
    }

    fun onButtonTwoClicked(){
        animTwoButtonClicked.value = !animTwoButtonClicked.value!!
    }

    fun onButtonThreeClicked(){
        animThreeButtonClicked.value = !animThreeButtonClicked.value!!
    }

    fun onButtonFourClicked(){
        animFourButtonClicked.value = !animFourButtonClicked.value!!
    }
}