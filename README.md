package com.example.yourapp

import android.content.Context
import android.graphics.Color
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat

class ProductDisplayView(context: Context) : LinearLayout(context) {

    init {
        orientation = VERTICAL
        setPadding(16, 16, 16, 16)

        // Создаем метку для названия товара
        val productName = TextView(context).apply {
            text = "Название товара"
            textSize = 24f
            setTextColor(Color.BLACK)
        }

        // Создаем метку для цены товара
        val productPrice = TextView(context).apply {
            text = "Цена товара"
            textSize = 18f
            setTextColor(Color.BLACK)
            setPadding(0, 8, 0, 16)
        }

        // Создаем кнопку
        val addToCartButton = Button(context).apply {
            text = "Добавить в корзину"
            setBackgroundColor(ContextCompat.getColor(context, android.R.color.holo_purple))
            setTextColor(Color.WHITE)
            setOnClickListener {
                // Измените текст и цвет кнопки
                text = "Перейти в корзину"
                setBackgroundColor(Color.WHITE)
                setTextColor(Color.BLACK)
            }
        }

        // Добавляем элементы в контейнер
        addView(productName)
        addView(productPrice)
        addView(addToCartButton)
    }
}
