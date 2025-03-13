package com.example.yourapp

import android.graphics.Color
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat

class ProductDisplayActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Создаем корневой контейнер
        val layout = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(16, 16, 16, 16)
        }

        // Создаем метку для названия товара
        val productName = TextView(this).apply {
            text = "Название товара"
            textSize = 24f
            setTextColor(Color.BLACK)
        }

        // Создаем метку для цены товара
        val productPrice = TextView(this).apply {
            text = "Цена товара"
            textSize = 18f
            setTextColor(Color.BLACK)
            setPadding(0, 8, 0, 16)
        }

        // Создаем кнопку
        val addToCartButton = Button(this).apply {
            text = "Добавить в корзину"
            setBackgroundColor(ContextCompat.getColor(this@ProductDisplayActivity, android.R.color.holo_purple))
            setTextColor(Color.WHITE)
            setOnClickListener {
                // Измените текст и цвет кнопки
                text = "Перейти в корзину"
                setBackgroundColor(Color.WHITE)
                setTextColor(Color.BLACK)
            }
        }

        // Добавляем элементы в контейнер
        layout.addView(productName)
        layout.addView(productPrice)
        layout.addView(addToCartButton)

        // Устанавливаем контейнер как контент активности
        setContentView(layout)
    }
}
