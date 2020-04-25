package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentAsyncBinding
import com.example.bachelorproef.viewmodel.AsyncViewModel
import org.koin.androidx.viewmodel.ext.android.viewModel

class AsyncFragment : Fragment(){
    private val viewModel: AsyncViewModel by viewModel()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val binding = FragmentAsyncBinding.inflate(inflater,container,false)
        binding.lifecycleOwner = this
        binding.viewModel = viewModel
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        (activity as AppCompatActivity).supportActionBar!!.title = getString(R.string.choice_async)
    }
}