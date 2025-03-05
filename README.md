<TextView
    android:id="@+id/textView_seasons"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content" />

    import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView textViewSeasons = findViewById(R.id.textView_seasons);

        // Получаем массив строк из ресурсов
        String[] seasons = getResources().getStringArray(R.array.seasons);

        // Объединяем значения массива в одну строку
        StringBuilder seasonsString = new StringBuilder();
        for (String season : seasons) {
            seasonsString.append(season).append("\n");
        }

        // Устанавливаем текст в TextView
        textViewSeasons.setText(seasonsString.toString());
    }
}
