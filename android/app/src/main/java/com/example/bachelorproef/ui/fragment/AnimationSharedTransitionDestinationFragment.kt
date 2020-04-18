package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.transition.TransitionInflater
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentAnimationTransitionDestinationBinding
import kotlinx.android.synthetic.main.fragment_animation_transition_destination.backButton

class AnimationSharedTransitionDestinationFragment : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        sharedElementEnterTransition = TransitionInflater.from(context).inflateTransition(android.R.transition.move)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        val binding = FragmentAnimationTransitionDestinationBinding.inflate(inflater,container,false)
        binding.lifecycleOwner = this
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val toolbar = (activity as AppCompatActivity).supportActionBar!!
        toolbar.title = getString(R.string.animate_shared_transition_button)
        backButton.setOnClickListener {
            //Don't use a shared element transition to go back
            sharedElementEnterTransition = null
            sharedElementReturnTransition = null
            view.transitionName = null
            findNavController().navigateUp()
        }
    }
}