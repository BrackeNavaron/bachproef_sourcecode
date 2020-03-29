package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.bacherlorproef.R

/**
 * This class represents the UI Showcase fragment
 */
class ShowcaseFragment : Fragment() {

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?): View?
    {
        return inflater.inflate(R.layout.fragment_showcase, container,false)
    }
}