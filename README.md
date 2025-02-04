import kotlinx.coroutines.*

fun main() = runBlocking(Dispatchers.IO) {
    println("Основной поток: ${Thread.currentThread().name}")

    val job = launch {
        try {
            loadFiles()
        } catch (e: CancellationException) {
            println("Загрузка отменена")
        }
    }

    // Симуляция ввода пользователя для отмены загрузки
    println("Введите 'cancel' для отмены загрузки:")
    val input = readLine()
    if (input == "cancel") {
        job.cancel()
    }

    job.join()
}

suspend fun loadFiles() {
    for (i in 1..30) {
        println("Загрузка файла $i (Поток: ${Thread.currentThread().name})")
        delay(3000)
    }
    println("Все файлы загружены")
}
