import kotlinx.coroutines.*

suspend fun downloadFiles() {
    try {
        for (i in 1..30) {
            println("Загрузка файла $i")
            delay(3000) // Задержка на 3 секунды
        }
        println("Все файлы загружены")
    } catch (e: CancellationException) {
        println("Загрузка отменена")
        throw e // Перебрасываем исключение для корректного завершения корутины
    }
}

fun main() = runBlocking {
    val job = launch {
        downloadFiles()
    }

    // Запускаем отдельную корутину для прослушивания ввода пользователя
    launch {
        while (isActive) {
            println("Введите 'cancel' для отмены загрузки:")
            val input = readLine()
            if (input == "cancel") {
                job.cancel()
                break
            }
        }
    }

    job.join() // Ожидаем завершения основной корутины
}
