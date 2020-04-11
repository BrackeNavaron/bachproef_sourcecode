package com.example.bachelorproef.ui.recyclerview

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.bachelorproef.databinding.PagerItemBinding

class PagerAdapter(private val pages: List<Int>):
    RecyclerView.Adapter<PagerAdapter.PagerViewHolder>() {

    class PagerViewHolder(val binding: PagerItemBinding): RecyclerView.ViewHolder(binding.root)

    override fun getItemCount(): Int = pages.size

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PagerViewHolder {
        val binding = PagerItemBinding.inflate(LayoutInflater.from(parent.context),parent,false)
        return PagerViewHolder(binding)
    }

    override fun onBindViewHolder(holder: PagerViewHolder, position: Int) {
        holder.binding.pageNr = pages[position]
    }
}