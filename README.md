import android.os.Bundle;
import android.widget.Button;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Найдите кнопки по их идентификаторам
        Button buttonFind = findViewById(R.id.button_find);
        Button buttonOk = findViewById(R.id.button_ok);
        Button buttonLogin = findViewById(R.id.button_login);
        Button buttonRegister = findViewById(R.id.button_register);
        Button buttonSearch = findViewById(R.id.button_search);
        Button buttonEnter = findViewById(R.id.button_enter);

        // Установите обработчики нажатий для кнопок
        buttonFind.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Нажата кнопка Найти", Toast.LENGTH_SHORT).show();
            }
        });

        buttonOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Нажата кнопка ОК", Toast.LENGTH_SHORT).show();
            }
        });

        buttonLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Нажата кнопка Войти", Toast.LENGTH_SHORT).show();
            }
        });

        buttonRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Нажата кнопка Зарегистрироваться", Toast.LENGTH_SHORT).show();
            }
        });

        buttonSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Нажата кнопка Search", Toast.LENGTH_SHORT).show();
            }
        });

        buttonEnter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Нажата кнопка Enter", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
