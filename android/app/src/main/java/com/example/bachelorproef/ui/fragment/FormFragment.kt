package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.SeekBar
import android.widget.SeekBar.OnSeekBarChangeListener
import androidx.appcompat.widget.AppCompatSeekBar
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatSpinner
import androidx.fragment.app.Fragment
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentFormBinding
import com.example.bachelorproef.viewmodel.FormViewModel
import com.example.bachelorproef.viewmodel.SharedViewModel
import kotlinx.android.synthetic.main.fragment_form.*
import org.koin.androidx.viewmodel.ext.android.sharedViewModel
import org.koin.androidx.viewmodel.ext.android.viewModel

class FormFragment : Fragment(), AdapterView.OnItemSelectedListener {
    private val sharedViewModel: SharedViewModel by sharedViewModel()
    private val viewModel: FormViewModel by viewModel()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        val binding = FragmentFormBinding.inflate(inflater,container,false)
        binding.lifecycleOwner = this
        binding.viewModel = viewModel
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        (activity as AppCompatActivity).supportActionBar!!.title = getString(R.string.choice_forms)
        setupSpinner()
        setupProgressBar()
    }

    //SPINNER

    /**
     * This implementation of the adapter interface doesn't do anything specific
     */
    override fun onNothingSelected(parent: AdapterView<*>?) {
        //do nothing
    }

    /**
     * Notify the viewmodel
     */
    override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
        viewModel.onDropDownChanged(position)
    }

    /**
     * Setup the [AppCompatSpinner] for the task priority
     */
    private fun setupSpinner()
    {
        val spinner = view?.findViewById<AppCompatSpinner>(R.id.spinner)
        ArrayAdapter.createFromResource(
            context!!,
            R.array.dropdown_items,
            android.R.layout.simple_spinner_item
        ).also { adapter ->
            // Specify the layout to use when the list of choices appears
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
            // Apply the adapter to the spinner
            spinner?.adapter = adapter
        }
        spinner?.onItemSelectedListener = this
        spinner?.setSelection(viewModel.getDropDownInput().value!!)
    }

    //PROGRESS BAR
    private fun setupProgressBar(){
        seekBar?.setOnSeekBarChangeListener(object : OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
                viewModel.onSliderChanged(progress)
            }

            override fun onStartTrackingTouch(seekBar: SeekBar?) {
                //do nothing
            }

            override fun onStopTrackingTouch(seekBar: SeekBar?) {
                //do nothing
            }
        })
    }
}