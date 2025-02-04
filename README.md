import kotlinx.coroutines.*

suspend fun connectToDatabase() {
    withTimeout(10000) { // Устанавливаем таймаут на 10 секунд
        for (i in 1..5) {
            println("Попытка подключения к БД $i")
            delay(3000) // Задержка на 3 секунды
        }
        println("Подключение к БД успешно")
    }
}

fun main() = runBlocking {
    try {
        connectToDatabase()
    } catch (e: TimeoutCancellationException) {
        println("Превышено время ожидания")
    }
}
