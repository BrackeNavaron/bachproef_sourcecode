package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.*
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import androidx.navigation.fragment.findNavController
import com.example.bachelorproef.R
import kotlinx.android.synthetic.main.fragment_showcase.*


class ShowcaseFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        return inflater.inflate(R.layout.fragment_showcase, container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        bottomNav.setOnNavigationItemSelectedListener {
            val ctrl = requireActivity().findNavController(R.id.showcaseNavHost)
            if(it.itemId == R.id.bottom_nav_showcase){
                ctrl.navigate(R.id.showcaseChoiceFragment)
            }else{
                ctrl.navigate(R.id.settingsFragment)
            }

            true
        }
    }
}