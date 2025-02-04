import kotlinx.coroutines.*
import kotlin.random.Random

// Suspend-функция, эмулирующая подключение к веб-серверу
suspend fun connectToWebServer(): Int {
    println("Подключение к веб-серверу")
    delay(1000) // Ожидание 1 секунду
    val httpStatusCodes = listOf(200, 400, 401, 403, 404, 410, 500)
    return httpStatusCodes.random() // Возвращаем случайный код состояния HTTP
}

fun main() = runBlocking {
    // Запускаем корутину и получаем объект Deferred
    val deferred: Deferred<Int> = async {
        connectToWebServer()
    }

    // Ожидаем завершения выполнения и выводим результат
    val result = deferred.await()
    println("Полученный код состояния HTTP: $result")
}
