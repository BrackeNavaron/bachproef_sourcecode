package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import com.example.bachelorproef.viewmodel.ShowcaseViewModel
import com.example.bacherlorproef.R
import org.koin.androidx.viewmodel.ext.android.viewModel

class ShowcaseChoiceFragment : Fragment() {

    private val viewModel: ShowcaseViewModel by viewModel()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        return inflater.inflate(R.layout.fragment_showcase_choice, container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        (activity as AppCompatActivity).supportActionBar!!.title = getString(R.string.one)
    }

    /**
     * Notify that this fragment has an options menu
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.showcase_menu,menu)
        super.onCreateOptionsMenu(menu, inflater)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when(item.itemId){
            R.id.one -> {
                viewModel.setTitle(getString(R.string.one))
                (activity as AppCompatActivity).supportActionBar!!.title = viewModel.getTitle().value
                true
            }
            R.id.two -> {
                viewModel.setTitle(getString(R.string.two))
                (activity as AppCompatActivity).supportActionBar!!.title = viewModel.getTitle().value
                true
            }
            R.id.three -> {
                viewModel.setTitle(getString(R.string.three))
                (activity as AppCompatActivity).supportActionBar!!.title = viewModel.getTitle().value
                true
            }
            R.id.four -> {
                viewModel.setTitle(getString(R.string.four))
                (activity as AppCompatActivity).supportActionBar!!.title = viewModel.getTitle().value
                true
            }
            R.id.five -> {
                viewModel.setTitle(getString(R.string.five))
                (activity as AppCompatActivity).supportActionBar!!.title = viewModel.getTitle().value
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}