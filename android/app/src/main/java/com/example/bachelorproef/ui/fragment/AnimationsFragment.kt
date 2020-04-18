package com.example.bachelorproef.ui.fragment

import android.animation.AnimatorSet
import android.animation.ObjectAnimator
import android.os.Build
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import androidx.navigation.fragment.FragmentNavigatorExtras
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentAnimationBinding
import com.example.bachelorproef.viewmodel.AnimationViewModel
import kotlinx.android.synthetic.main.fragment_animation.*
import kotlinx.android.synthetic.main.fragment_animation_transition_destination.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class AnimationsFragment : Fragment() {

    private val viewModel: AnimationViewModel by viewModel()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        val binding = FragmentAnimationBinding.inflate(inflater,container,false)
        binding.lifecycleOwner = this
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val toolbar = (activity as AppCompatActivity).supportActionBar!!
        toolbar.title = getString(R.string.choice_animation)
        setupViews()
        setupAnimations()
    }

    private fun setupViews(){
        //setup start values for each view
        //tv1 -> black to green text
        textView1.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
        //tv2 -> black to green text + text size, at the same time
        textView2.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
        textView2.textSize = 12.0f
        //tv3 -> black to green text + text size, animate 1 then animate 2
        textView3.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
        textView3.textSize = 12.0f
        //tv4 -> black to green text + text size, animate 1 then after a set interval animate 2
        textView4.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
        textView4.textSize = 12.0f
    }

    private fun setupAnimations(){
        button1.setOnClickListener {
            doAnimOne()
        }
        button2.setOnClickListener {
            doAnimTwo()
        }
        button3.setOnClickListener {
            doAnimThree()
        }
        button4.setOnClickListener {
            doAnimFour()
        }
        sharedTransitionButton.setOnClickListener {
            doSharedElementTransition()
        }
    }

    private fun doAnimOne(){
        val black = ContextCompat.getColor(requireContext(),R.color.colorBlack)
        val green = ContextCompat.getColor(requireContext(),R.color.colorGreen)
        if(viewModel.getAnimOneClicked().value!!){
            textView1.setTextColor(black)
        }else{
            //Animate, but check the API
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                ObjectAnimator.ofArgb(textView1,"textColor",black,green).apply {
                    duration = 300
                    start()
                }
            }
        }
        viewModel.onButtonOneClicked()
    }

    private fun doAnimTwo(){
        if(viewModel.getAnimTwoClicked().value!!){
            textView2.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
            textView2.textSize = 12.0f
        }else{
            //do forward animation, use AnimatorSet, check API
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
                val black = ContextCompat.getColor(requireContext(),R.color.colorBlack)
                val green = ContextCompat.getColor(requireContext(),R.color.colorGreen)
                val textColor = ObjectAnimator.ofArgb(textView2,"textColor",black,green)
                val textSize = ObjectAnimator.ofFloat(textView2,"textSize",12.0f,24.0f)
                AnimatorSet().apply {
                    playTogether(textColor,textSize)
                    duration = 300
                    start()
                }
            }
        }
        viewModel.onButtonTwoClicked()
    }

    private fun doAnimThree(){
        if(viewModel.getAnimThreeClicked().value!!){
            textView3.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
            textView3.textSize = 12.0f
        }else{
            //do forward animation, use AnimatorSet, check API
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
                val black = ContextCompat.getColor(requireContext(),R.color.colorBlack)
                val green = ContextCompat.getColor(requireContext(),R.color.colorGreen)
                val textColor = ObjectAnimator.ofArgb(textView3,"textColor",black,green)
                val textSize = ObjectAnimator.ofFloat(textView3,"textSize",12.0f,24.0f)
                AnimatorSet().apply {
                    playSequentially(textColor,textSize)
                    duration = 300
                    start()
                }
            }
        }
        viewModel.onButtonThreeClicked()
    }

    private fun doAnimFour(){
        if(viewModel.getAnimFourClicked().value!!){
            textView4.setTextColor(ContextCompat.getColor(requireContext(),R.color.colorBlack))
            textView4.textSize = 12.0f
        }else{
            //do forward animation, use AnimatorSet, check API
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
                val black = ContextCompat.getColor(requireContext(),R.color.colorBlack)
                val green = ContextCompat.getColor(requireContext(),R.color.colorGreen)
                val textColor = ObjectAnimator.ofArgb(textView4,"textColor",black,green)
                val textSize = ObjectAnimator
                    .ofFloat(textView4,"textSize",12.0f,24.0f)
                    .apply {
                    startDelay = 250L
                }
                AnimatorSet().apply {
                    playTogether(textColor,textSize)
                    duration = 500
                    start()
                }
            }
        }
        viewModel.onButtonFourClicked()
    }

    private fun doSharedElementTransition(){
        val extras = FragmentNavigatorExtras(
            sharedTransitionText to getString(R.string.shared_element_transition))
        requireActivity().findNavController(R.id.mainNavHost).navigate(R.id.animationSharedTransitionDestinationFragment,
            null,
            null,
            extras)
    }
}