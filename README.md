import kotlinx.coroutines.*

suspend fun loadFiles() {
    try {
        for (i in 1..30) {
            println("Загрузка файла $i")
            delay(3000) // Задержка на 3 секунды
        }
        println("Все файлы загружены")
    } catch (e: CancellationException) {
        println("Загрузка отменена")
    }
}

fun main() = runBlocking {
    val job = launch {
        loadFiles()
    }

    // Запускаем отдельную корутину для чтения ввода пользователя
    launch {
        while (isActive) {
            val input = readLine()
            if (input == "cancel") {
                job.cancel()
            }
        }
    }

    job.join()
}
