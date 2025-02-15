import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Button
import androidx.compose.runtime.Composable

@Composable
fun Task3Column() {
    Column {
        Text(text = "Добро пожаловать")
        Button(onClick = { /* Do something */ }) {
            Text(text = "ОК")
        }
    }
}



import androidx.compose.foundation.layout.Row

@Composable
fun Task3Row() {
    Row {
        Text(text = "Добро пожаловать")
        Button(onClick = { /* Do something */ }) {
            Text(text = "ОК")
        }
    }
}


import androidx.compose.foundation.layout.Box

@Composable
fun Task3Box() {
    Box {
        Text(text = "Добро пожаловать")
        Button(onClick = { /* Do something */ }) {
            Text(text = "ОК")
        }
    }
}
