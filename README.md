import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview

@Composable
fun Task4() {
    // Список с пятью разными строковыми значениями
    val items = listOf("Элемент 1", "Элемент 2", "Элемент 3", "Элемент 4", "Элемент 5")

    // Используем LazyColumn для отображения списка
    LazyColumn {
        items(items) { item ->
            Text(text = item)
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Task4Preview() {
    Task4()
}
