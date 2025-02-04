import kotlinx.coroutines.*

suspend fun connectToDatabase() {
    withTimeout(10000) { // Устанавливаем таймаут на 10 секунд
        for (i in 1..5) {
            println("Попытка подключения к БД $i в потоке ${Thread.currentThread().name}")
            delay(3000) // Задержка на 3 секунды
        }
        println("Подключение к БД успешно в потоке ${Thread.currentThread().name}")
    }
}

fun main() = runBlocking {
    println("Основной поток: ${Thread.currentThread().name}")

    try {
        // Используем Dispatchers.IO для запуска корутины
        withContext(Dispatchers.IO) {
            connectToDatabase()
        }
    } catch (e: TimeoutCancellationException) {
        println("Превышено время ожидания в потоке ${Thread.currentThread().name}")
    }
}
