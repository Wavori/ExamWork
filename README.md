@Composable
fun ProductRow(products: List<Product>) {
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(products) { product ->
            ProductCardVertical(product = product)
        }
    }
}

@Composable
fun ProductList(products: List<Product>) {
    val listState = rememberLazyListState()
    val showButton = remember { derivedStateOf { listState.firstVisibleItemIndex > 0 } }
    val coroutineScope = rememberCoroutineScope()

    Box(modifier = Modifier.fillMaxSize()) {
        LazyColumn(
            state = listState,
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            item {
                Text(
                    text = "Selected Product",
                    style = MaterialTheme.typography.h5,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }
            items(products) { product ->
                ProductCardHorizontal(product = product)
            }
        }

        if (showButton.value) {
            FloatingActionButton(
                onClick = {
                    coroutineScope.launch {
                        listState.scrollToItem(index = 0)
                    }
                },
                modifier = Modifier
                    .align(Alignment.BottomEnd)
                    .padding(16.dp)
            ) {
                Icon(Icons.Filled.ArrowUpward, contentDescription = "Scroll to Top")
            }
        }
    }
}
