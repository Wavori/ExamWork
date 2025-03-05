import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.Font
import androidx.compose.runtime.Composable
import androidx.compose.ui.res.fontResource

object Type {
    @Composable
    fun getFontFamily(): FontFamily {
        return FontFamily(
            Font(resId = R.font.my_font)
        )
    }
}
