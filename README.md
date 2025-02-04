import kotlinx.coroutines.*

fun main() = runBlocking {
    println("Основной поток: ${Thread.currentThread().name}")

    val job1 = launch { printSheep() }
    val job2 = launch { printCats() }

    job1.join()
    job2.join()
}

suspend fun printSheep() {
    withContext(Dispatchers.IO) {
        println("Поток овечек: ${Thread.currentThread().name}")
        for (i in 1..500) {
            println("$i овечка")
        }
        delay(1000)
        for (i in 501..1000) {
            println("$i овечка")
        }
    }
}

suspend fun printCats() {
    withContext(Dispatchers.IO) {
        println("Поток котиков: ${Thread.currentThread().name}")
        for (i in 1..500) {
            println("$i котик")
            delay(10)
        }
    }
}
