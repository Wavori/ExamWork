fun main() {
    // Часть 1: Создание, заполнение и вывод списка с фруктами
    val fruits = mutableListOf<String>()
    fruits.add("Яблоко")
    fruits.add("Банан")
    fruits.add("Вишня")

    println("Введите количество фруктов для добавления: ")
    val n = readLine()?.toIntOrNull() ?: 0
    for (i in 1..n) {
        println("Введите название фрукта $i: ")
        val fruit = readLine() ?: ""
        fruits.add(fruit)
    }

    println("Список фруктов:")
    for ((index, fruit) in fruits.withIndex()) {
        println("${index + 1} - $fruit")
    }
    println("Количество элементов в списке: ${fruits.size}")

    // Часть 2: Обработка списков
    val numbers = mutableListOf<Int>()
    println("Введите количество элементов для добавления: ")
    val m = readLine()?.toIntOrNull() ?: 0
    for (i in 1..m) {
        println("Введите число $i: ")
        val number = readLine()?.toIntOrNull() ?: 0
        numbers.add(number)
    }

    val index100 = numbers.indexOf(100)
    println("Индекс элемента со значением 100: ${if (index100 == -1) "Не найдено" else index100}")

    val sumNumbers = numbers.sum()
    println("Сумма элементов коллекции: $sumNumbers")

    val averageNumbers = if (numbers.isNotEmpty()) sumNumbers.toDouble() / numbers.size else 0.0
    println("Среднее значение элементов коллекции: $averageNumbers")

    val allPositive = numbers.all { it > 0 }
    println("Все числа больше нуля: $allPositive")

    val oddNumbers = numbers.filter { it % 2 != 0 }
    println("Нечетные значения элементов: $oddNumbers")
}
