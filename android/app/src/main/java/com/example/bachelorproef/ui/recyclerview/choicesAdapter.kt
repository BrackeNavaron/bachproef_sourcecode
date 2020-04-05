package com.example.bachelorproef.ui.recyclerview

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.bacherlorproef.databinding.ChoiceItemBinding

interface ChoiceClickListener {
    fun onChoiceSelected(choice: ShowcaseChoice)
}

data class ShowcaseChoice(
    val image: Int,
    val label: Int,
    val destination: Int
)

class ChoicesAdapter(private val choices: List<ShowcaseChoice>, private val clickListener: ChoiceClickListener):
    RecyclerView.Adapter<ChoicesAdapter.ChoicesViewHolder>() {

    class ChoicesViewHolder(val binding: ChoiceItemBinding): RecyclerView.ViewHolder(binding.root)

    override fun getItemCount(): Int = choices.size

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ChoicesViewHolder {
        val binding = ChoiceItemBinding.inflate(LayoutInflater.from(parent.context),parent,false)
        return ChoicesViewHolder(binding)
    }

    override fun onBindViewHolder(holder: ChoicesViewHolder, position: Int) {
        //set the binding's model variable
        val choice = choices[position]
        holder.binding.choice = choice
        //bind the click listener
        holder.binding.choiceCard.setOnClickListener{
            clickListener.onChoiceSelected(choice)
        }
    }
}