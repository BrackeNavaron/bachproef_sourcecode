package com.example.bachelorproef.ui.fragment

import androidx.fragment.app.Fragment
import com.example.bachelorproef.viewmodel.SharedViewModel
import org.koin.androidx.viewmodel.ext.android.sharedViewModel

class FormFragment : Fragment() {
    private val sharedViewModel: SharedViewModel by sharedViewModel()

}