package com.example.bachelorproef.viewmodel

import android.app.Application
import android.util.Log
import androidx.lifecycle.*
import com.example.bachelorproef.R
import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.ReceiveChannel
import java.lang.IndexOutOfBoundsException

class AsyncViewModel(application: Application) : AndroidViewModel(application){
    private val isCoroutineLoading = MutableLiveData(false)
    private val isChannelLoading = MutableLiveData(false)

    private val coroutineErrorString = application.getString(R.string.coroutine_error)
    private val coroutineIdleString = application.getString(R.string.coroutine_idle)
    private val coroutineDoneString = application.getString(R.string.coroutine_done)
    private val channelErrorString = application.getString(R.string.channel_error)
    private val channelIdleString = application.getString(R.string.channel_idle)
    private val coroutineOutput = MutableLiveData(coroutineIdleString)
    private val channelOutput = MutableLiveData(channelIdleString)

    private var coroutineExecuted = MutableLiveData(false)
    private var channelExecuted = MutableLiveData(false)

    fun getCoroutineOutput() : LiveData<String> = coroutineOutput
    fun getChannelOutput() : LiveData<String> = channelOutput
    fun getIsCoroutineLoading() : LiveData<Boolean> = isCoroutineLoading
    fun getIsChannelLoading() : LiveData<Boolean> = isChannelLoading

    suspend fun onCoroutine() : String {
        delay(300L)//Pretend we do something, not counted in results since it's a 'fake' coroutine
        return coroutineDoneString
    }

    suspend fun onCoroutineWithError() : String {
        delay(300L)//Pretend we do something
        throw IndexOutOfBoundsException("Oops!")
    }

    suspend fun startChannel(channel: Channel<Int>){
        for (x in 1..5){
            delay(200L)
            channel.send(x * x)
        }
        channel.close()// we're done sending
    }

    suspend fun receiveFromChannel(channel: Channel<Int>){
        for (i in channel){
            channelOutput.value = i.toString()
        }
        channelExecuted.value = false
    }

    fun doCoroutine(){
        if(coroutineExecuted.value!!) return
        coroutineExecuted.value = true
        viewModelScope.launch {
            isCoroutineLoading.value = true
            coroutineOutput.value = ""
            coroutineOutput.value = onCoroutine()
            isCoroutineLoading.value = false
            coroutineExecuted.value = false
        }
    }

    fun doCoroutineWithError(){
        if(coroutineExecuted.value!!) return
        coroutineExecuted.value = true
        viewModelScope.launch {
            isCoroutineLoading.value = true
            coroutineOutput.value = ""
            try {
                coroutineOutput.value = onCoroutineWithError()
            }catch (ex : IndexOutOfBoundsException){
                coroutineOutput.value = coroutineErrorString
            }finally {
                isCoroutineLoading.value = false
                coroutineExecuted.value = false
            }
        }
    }

    fun doChannel(){
        if(channelExecuted.value!!) return
        channelExecuted.value = true
        val channel = Channel<Int>()
        viewModelScope.launch {
            startChannel(channel)
        }
        viewModelScope.launch {
            receiveFromChannel(channel)
        }
    }

    suspend fun startErrorChannel(channel : Channel<Int>){
        try{
            for (x in 1..5){
                isChannelLoading.value = true
                delay(200L)
                if(x == 3){
                    throw IndexOutOfBoundsException("Oops!")
                }else{
                    channel.send(x * x)
                }
                isChannelLoading.value = false
            }
        }catch (e : IndexOutOfBoundsException){
            channelOutput.value = channelErrorString
            isChannelLoading.value = false
        }finally {
            channel.close()
        }
    }

    suspend fun receiveFromErrorChannel(channel: Channel<Int>){
        for (i in channel){
            channelOutput.value = i.toString()
        }
    }

    @ExperimentalCoroutinesApi
    fun doChannelWithError(){
        if(channelExecuted.value!!) return
        channelExecuted.value = true
        val channel = Channel<Int>()
        viewModelScope.launch {
            startErrorChannel(channel)
        }
        viewModelScope.launch {
            receiveFromErrorChannel(channel)
        }
    }

}