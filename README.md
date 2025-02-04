import kotlinx.coroutines.*

// Suspend-функция, эмулирующая загрузку файлов
suspend fun downloadFiles() {
    try {
        for (i in 1..30) {
            println("Загрузка файла $i")
            delay(3000) // Задержка на 3 секунды для каждого файла
        }
        println("Все файлы загружены")
    } catch (e: CancellationException) {
        println("Загрузка отменена")
    }
}

fun main() = runBlocking {
    val job = launch(Dispatchers.IO) {
        downloadFiles()
    }

    // Ожидание ввода пользователя для отмены загрузки
    println("Введите 'cancel' для отмены загрузки:")
    val input = readLine()
    if (input == "cancel") {
        job.cancel()
    }

    job.join() // Ожидание завершения корутины
}
