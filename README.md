fun main() {
    // Создание наборов студентов
    val studentsRetake1 = mutableSetOf<String>()
    val studentsRetake2 = mutableSetOf<String>()

    // Заполнение набора студентов, не сдавших зачет у преподавателя 1
    println("Введите количество студентов, не сдавших зачет у преподавателя 1: ")
    val n1 = readLine()?.toIntOrNull() ?: 0
    for (i in 1..n1) {
        println("Введите ФИО студента $i: ")
        val student = readLine() ?: ""
        studentsRetake1.add(student)
    }

    // Заполнение набора студентов, не сдавших зачет у преподавателя 2
    println("Введите количество студентов, не сдавших зачет у преподавателя 2: ")
    val n2 = readLine()?.toIntOrNull() ?: 0
    for (i in 1..n2) {
        println("Введите ФИО студента $i: ")
        val student = readLine() ?: ""
        studentsRetake2.add(student)
    }

    // Определение общего количества студентов, отправленных на пересдачу
    val allStudents = studentsRetake1.union(studentsRetake2)
    println("Всего студентов было отправлено на пересдачу: ${allStudents.size}")

    // Определение количества студентов, не сдавших оба зачета
    val bothFailed = studentsRetake1.intersect(studentsRetake2)
    println("Студенты, не сдавшие оба зачета: ${bothFailed.size}")

    // Определение количества студентов, не сдавших только один зачет
    val oneFailed = allStudents.subtract(bothFailed)
    println("Студенты, не сдавшие только один зачет: ${oneFailed.size}")
}
