import kotlinx.coroutines.*

suspend fun printSheep() {
    for (i in 1..500) {
        println("$i овечка")
    }
    delay(1000) // Задержка на 1 секунду
    for (i in 501..1000) {
        println("$i овечка")
    }
}

suspend fun printCats() {
    for (i in 1..500) {
        println("$i котик")
        delay(10) // Задержка на 10 миллисекунд
    }
}

fun main() = runBlocking {
    // Запуск первой корутины для вывода овечек
    launch {
        printSheep()
    }

    // Запуск второй корутины для вывода котиков
    launch {
        printCats()
    }
}
