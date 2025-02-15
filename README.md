import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

@Composable
fun Task4ColumnLayout() {
    Column(
        modifier = Modifier
            .fillMaxWidth() // Ширина столбца равна ширине родителя
            .background(Color.White) // Фон столбца
    ) {
        // Красный блок (5%)
        Text(
            text = "5%",
            modifier = Modifier
                .fillMaxWidth()
                .height(20.dp)
                .background(Color.Red)
        )

        // Зеленый блок (15%)
        Text(
            text = "15%",
            modifier = Modifier
                .fillMaxWidth()
                .height(60.dp)
                .background(Color.Green)
        )

        // Синий блок (30%)
        Text(
            text = "30%",
            modifier = Modifier
                .fillMaxWidth()
                .height(120.dp)
                .background(Color.Blue)
        )

        // Желтый блок (50%)
        Text(
            text = "50%",
            modifier = Modifier
                .fillMaxWidth()
                .height(200.dp)
                .background(Color.Yellow)
        )
    }
}
