package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.example.bachelorproef.R
import kotlinx.android.synthetic.main.fragment_navigation.*

class NavigationFragment : Fragment(){

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        return inflater.inflate(R.layout.fragment_navigation, container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        btn.setOnClickListener {
            onNavigateWithArgs()
        }
    }

    private fun onNavigateWithArgs(){
        val action = NavigationFragmentDirections.actionNavigationFragmentToNavArgsFragment("This arg got passed along!")
        findNavController().navigate(action)
    }
}