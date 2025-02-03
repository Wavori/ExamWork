fun main() {
    // Создание словаря
    val countryCodes = mutableMapOf<String, String>()

    // Заполнение словаря программно
    countryCodes["RU"] = "Россия"
    countryCodes["US"] = "США"
    countryCodes["FR"] = "Франция"

    // Заполнение словаря с клавиатуры
    println("Введите количество стран для добавления: ")
    val n = readLine()?.toIntOrNull() ?: 0
    for (i in 1..n) {
        println("Введите двухбуквенный код страны $i: ")
        val code = readLine() ?: ""
        println("Введите название страны $i: ")
        val country = readLine() ?: ""
        countryCodes[code] = country
    }

    // Вывод содержимого словаря на экран
    println("Содержимое словаря:")
    for ((code, country) in countryCodes) {
        println("$code - $country")
    }
    println("Количество элементов в словаре: ${countryCodes.size}")
}
