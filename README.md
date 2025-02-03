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

    // Проверка наличия ключа в словаре и вывод значения
    println("Введите двухбуквенный код страны для поиска: ")
    val searchCode = readLine() ?: ""
    if (countryCodes.containsKey(searchCode)) {
        println("Страна с кодом $searchCode: ${countryCodes[searchCode]}")
    } else {
        println("Страна с кодом $searchCode не найдена в словаре.")
    }

    // Подсчет количества совпадений значения
    println("Введите название страны для поиска совпадений: ")
    val searchCountry = readLine() ?: ""
    val countMatches = countryCodes.values.count { it == searchCountry }
    println("Количество совпадений для страны $searchCountry: $countMatches")

    // Удаление элемента по ключу и вывод содержимого словаря
    println("Введите двухбуквенный код страны для удаления: ")
    val removeCode = readLine() ?: ""
    if (countryCodes.containsKey(removeCode)) {
        countryCodes.remove(removeCode)
        println("Элемент с кодом $removeCode удален.")
    } else {
        println("Элемент с кодом $removeCode не найден в словаре.")
    }

    // Вывод содержимого словаря после удаления
    println("Содержимое словаря после удаления:")
    for ((code, country) in countryCodes) {
        println("$code - $country")
    }
    println("Количество элементов в словаре: ${countryCodes.size}")
}
