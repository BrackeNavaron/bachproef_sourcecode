package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.viewpager2.widget.ViewPager2
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentPagerBinding
import com.example.bachelorproef.ui.recyclerview.PagerAdapter
import com.example.bachelorproef.viewmodel.PagerViewModel
import kotlinx.android.synthetic.main.fragment_pager.view.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class PagerFragment : Fragment() {
    private val viewModel: PagerViewModel by viewModel()

    lateinit var pager: ViewPager2
    lateinit var pagerAdapter: PagerAdapter

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val binding = FragmentPagerBinding.inflate(inflater, container,false)
        binding.lifecycleOwner = this
        pager = binding.pager
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val toolbar = (activity as AppCompatActivity).supportActionBar!!
        toolbar.title = getString(R.string.choice_pagers)
        pagerAdapter = PagerAdapter(viewModel.getItems())
        pager.apply {
            adapter = pagerAdapter
            offscreenPageLimit = 3
            //TODO transformer code here
        }
        view.backButton.setOnClickListener {
            findNavController().navigateUp()
        }
    }
}