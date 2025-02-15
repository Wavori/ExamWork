import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun Task4BoxLayout() {
    Box(
        modifier = Modifier
            .size(300.dp) // Размер контейнера
            .background(Color.White) // Фон контейнера
    ) {
        // Центральный черный прямоугольник
        Box(
            modifier = Modifier
                .size(150.dp, 250.dp)
                .background(Color.Black)
        )

        // Красный прямоугольник вверху слева
        Box(
            modifier = Modifier
                .size(50.dp, 30.dp)
                .background(Color.Red)
        )

        // Оранжевый прямоугольник вверху справа
        Box(
            modifier = Modifier
                .size(50.dp, 30.dp)
                .background(Color.Orange)
        )

        // Зеленый прямоугольник слева
        Box(
            modifier = Modifier
                .size(30.dp, 50.dp)
                .background(Color.Green)
        )

        // Розовый прямоугольник справа
        Box(
            modifier = Modifier
                .size(30.dp, 50.dp)
                .background(Color.Magenta)
        )

        // Синий прямоугольник внизу слева
        Box(
            modifier = Modifier
                .size(50.dp, 30.dp)
                .background(Color.Blue)
        )

        // Желтый прямоугольник внизу справа
        Box(
            modifier = Modifier
                .size(50.dp, 30.dp)
                .background(Color.Yellow)
        )

        // Серый прямоугольник внизу по центру
        Box(
            modifier = Modifier
                .size(30.dp, 50.dp)
                .background(Color.Gray)
        )

        // Голубой прямоугольник вверху по центру
        Box(
            modifier = Modifier
                .size(50.dp, 30.dp)
                .background(Color.Cyan)
        )
    }
}
