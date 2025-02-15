import androidx.compose.foundation.background
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun Task2() {
    Text(
        text = "Привет, Jetpack Compose!",
        fontSize = 24.sp,
        modifier = Modifier
            .background(Color.LightGray)
            .padding(20.dp)
    )
}

@Preview(showBackground = true)
@Composable
fun Task2Preview() {
    Task2()
}
