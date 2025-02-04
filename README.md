import kotlinx.coroutines.*
import kotlin.random.Random

fun main() = runBlocking {
    println("Основной поток: ${Thread.currentThread().name}")

    val deferred: Deferred<Int> = async { connectToWebServer() }
    val result = deferred.await()

    println("Полученный код состояния HTTP: $result")
}

suspend fun connectToWebServer(): Int {
    println("Подключение к веб-серверу (Поток: ${Thread.currentThread().name})")
    delay(1000)
    val statusCodes = listOf(200, 400, 401, 403, 404, 410, 500)
    val randomStatusCode = statusCodes.random()
    return randomStatusCode
}
