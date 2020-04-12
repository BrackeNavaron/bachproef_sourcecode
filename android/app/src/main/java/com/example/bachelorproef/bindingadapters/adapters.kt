package com.example.bachelorproef.bindingadapters

import android.text.Editable
import android.text.TextWatcher
import android.widget.ImageView
import androidx.core.widget.doOnTextChanged
import androidx.databinding.BindingAdapter
import androidx.lifecycle.ViewModel
import com.example.bachelorproef.util.IOnTextChangedListener
import com.google.android.material.textfield.TextInputEditText
import com.google.android.material.textfield.TextInputLayout

@BindingAdapter("android:src")
fun setImageResource(imageView: ImageView, resource: Int) {
    imageView.setImageResource(resource)
}

/**
 * @param view the view to bind for
 * @param errorMessage the message to bind
 */
@BindingAdapter("app:error")
fun setErrorMessage(view: TextInputLayout, errorMessage: String?) {
    view.error = errorMessage
}

/**
 * @param view the view to bind for
 * @param handler the text changed handler
 */
@BindingAdapter("app:onTextChanged")
fun setOnTextChanged(view: TextInputEditText, handler: IOnTextChangedListener) {
    view.addTextChangedListener(object : TextWatcher {
        override fun afterTextChanged(s: Editable?) {
            //do nothing
        }

        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
            //do nothing
        }

        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
            handler.onTextChanged(s)
        }
    })
}