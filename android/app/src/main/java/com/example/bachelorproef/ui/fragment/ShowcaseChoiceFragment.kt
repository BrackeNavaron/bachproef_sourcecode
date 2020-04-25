package com.example.bachelorproef.ui.fragment

import android.os.Bundle
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.bachelorproef.R
import com.example.bachelorproef.databinding.FragmentShowcaseChoiceBinding
import com.example.bachelorproef.ui.recyclerview.ChoiceClickListener
import com.example.bachelorproef.ui.recyclerview.ChoicesAdapter
import com.example.bachelorproef.ui.recyclerview.ShowcaseChoice
import com.example.bachelorproef.viewmodel.ShowcaseViewModel
import org.koin.androidx.viewmodel.ext.android.viewModel

class ShowcaseChoiceFragment : Fragment(), ChoiceClickListener {

    private val viewModel: ShowcaseViewModel by viewModel()

    lateinit var choicesRV: RecyclerView

    private val choices = listOf(
        ShowcaseChoice(
            R.drawable.ic_hourglass_full_24px,
            R.string.choice_async,
            R.id.asyncFragment
        ),
        ShowcaseChoice(
            R.drawable.ic_navigation_24px,
            R.string.choice_navigation,
            0//TODO paste in the correct id when the destination exists
        ),
        ShowcaseChoice(
            R.drawable.ic_format_list_numbered_24px,
            R.string.choice_lists,
            R.id.listFragment
        ),
        ShowcaseChoice(
            R.drawable.ic_view_carousel_24px,
            R.string.choice_pagers,
            R.id.pagerFragment
        ),
        ShowcaseChoice(
            R.drawable.ic_transform_24px,
            R.string.choice_animation,
            R.id.animationsFragment
        ),
        ShowcaseChoice(
            R.drawable.ic_screen_lock_portrait_24px,
            R.string.choice_permissions,
            0//TODO paste in the correct id when the destination exists
        ),
        ShowcaseChoice(
            R.drawable.ic_create_24px,
            R.string.choice_forms,
            R.id.formFragment
        )
    )

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?
    {
        val binding = FragmentShowcaseChoiceBinding.inflate(inflater,container,false)
        binding.lifecycleOwner = this
        //setup recyclerview
        val viewManager = GridLayoutManager(activity,resources.getInteger(R.integer.choice_cols))
        val viewAdapter = ChoicesAdapter(choices,this)
        choicesRV = binding.choicesList.apply {
            hasFixedSize()
            layoutManager = viewManager
            adapter = viewAdapter
        }
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        (activity as AppCompatActivity).supportActionBar!!.title = getString(R.string.one)
    }


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

    override fun onChoiceSelected(choice: ShowcaseChoice) {
        val navController = findNavController()
        if(choice.destination != 0){//just prevent unset ones from doing anything; we can remove when all are set
            navController.navigate(choice.destination)
        }

    }
}