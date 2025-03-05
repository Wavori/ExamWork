<resources>
    <!-- Русские строки -->
    <string name="find">Найти</string>
    <string name="ok">ОК</string>
    <string name="login">Войти</string>
    <string name="register">Зарегистрироваться</string>

    <!-- Английские строки -->
    <string name="search">Search</string>
    <string name="enter">Enter</string>

    <!-- Форматированная строка -->
    <string name="user_info">Имя пользователя: %1$s, Год: %2$d</string>
</resources>

<resources>
    <string-array name="seasons">
        <item>Весна</item>
        <item>Лето</item>
        <item>Осень</item>
        <item>Зима</item>
    </string-array>
</resources>

<resources>
    <plurals name="hours">
        <item quantity="one">час</item>
        <item quantity="few">часа</item>
        <item quantity="many">часов</item>
        <item quantity="other">часов</item>
    </plurals>

    <plurals name="minutes">
        <item quantity="one">минута</item>
        <item quantity="few">минуты</item>
        <item quantity="many">минут</item>
        <item quantity="other">минут</item>
    </plurals>
</resources>

<resources>
    <color name="colorPrimary">#6200EE</color>
    <color name="colorPrimaryDark">#3700B3</color>
    <color name="colorAccent">#03DAC5</color>
    <color name="colorBackground">#FFFFFF</color>
    <color name="colorText">#000000</color>
</resources>

<resources>
    <style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
        <!-- Другие стили -->
        <item name="android:fontFamily">@font/my_font</item>
    </style>
</resources>

<resources>
    <dimen name="button_width">100dp</dimen>
    <dimen name="button_height">50dp</dimen>
    <dimen name="button_margin">16dp</dimen>
    <dimen name="row_padding">8dp</dimen>
</resources>

<Button
    android:layout_width="@dimen/button_width"
    android:layout_height="@dimen/button_height"
    android:text="@string/ok"
    android:backgroundTint="@color/colorPrimary"
    android:fontFamily="@font/my_font"
    android:layout_margin="@dimen/button_margin"/>
