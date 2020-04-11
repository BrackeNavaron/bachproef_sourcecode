package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.bachelorproef.ui.recyclerview.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentListBinding
import com.example.bachelorproef.viewmodel.ListViewModel
import kotlinx.android.synthetic.main.fragment_list.view.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class ListFragment : Fragment() {
    private val viewModel: ListViewModel by viewModel()

    lateinit var listRV: RecyclerView

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        val binding = FragmentListBinding.inflate(inflater,container,false)
        binding.lifecycleOwner = this
        //setup recyclerview
        val viewManager = LinearLayoutManager(activity)
        val viewAdapter = ListAdapter(viewModel.getItems())
        listRV = binding.list.apply {
            hasFixedSize()
            layoutManager = viewManager
            adapter = viewAdapter
        }
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        (activity as AppCompatActivity).supportActionBar!!.title = getString(R.string.choice_lists)
        view.backButton.setOnClickListener {
            findNavController().navigateUp()
        }
    }
}