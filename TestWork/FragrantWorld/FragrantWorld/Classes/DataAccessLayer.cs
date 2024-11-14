using FragrantWorld.Classes;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Windows.Controls;

namespace FragrantWorld
{
    class DataAccessLayer
    {
        public static string ServerName { get; set; } = @"DESKTOP - 5V09H0F";
        public static string DatabaseName { get; set; } = "ExamDatabase";
        public static string Login { get; set; } = "koreev";
        public static string Password { get; set; } = "1234";
        public static string ConnectionString
        {
            get
            {
                SqlConnectionStringBuilder builder = new()
                {
                    DataSource = ServerName,
                    InitialCatalog = DatabaseName,
                    TrustServerCertificate = true
                };
                return builder.ConnectionString;
            }
        }

        public static List<Product> GetProduct()                                //Подключается к базе данных.
        {                                                                       //Выполняет SQL-запрос для получения всех продуктов из таблицы ExamProduct.
            using SqlConnection connection = new(ConnectionString);             //Читает данные из результата запроса и создает объекты Product.
            connection.Open();                                                  //Добавляет созданные объекты в список.
                                                                                //Возвращает список объектов Product.
            var query = "USE ExamDatabase SELECT * FROM ExamProduct";           //Этот метод подключается к базе данных, выполняет запрос для получения всех продуктов из таблицы ExamProduct, читает данные из результата запроса и возвращает их в виде списка объектов Product.
            SqlCommand command = new(query, connection);
            List<Product> products = new();
            var reader = command.ExecuteReader();

            while (reader.Read())
            {
                var product = new Product
                {
                    ArticleNumber = reader["ProductArticleNumber"].ToString(),
                    Name = reader["ProductName"].ToString(),
                    Description = reader["ProductDescription"].ToString(),
                    Category = reader["ProductCategory"].ToString(),
                    Manufacturer = reader["ProductManufacturer"].ToString(),
                    Cost = Convert.ToDouble(reader["ProductCost"]),
                    DiscountAmount = Convert.ToInt32(reader["ProductDiscountAmount"]),
                    QuantityInStock = Convert.ToInt32(reader["ProductQuantityInStock"]),
                    Status = reader["ProductStatus"].ToString()
                };
                products.Add(product);
            }
            return products;
        }

        public static List<string> GetArticleNumber()   //Получает список всех продуктов из базы данных с помощью метода GetProduct.
        {                                               //Создает новый список для хранения артикулов продуктов.
            List<Product> products = GetProduct();      //Проходит по каждому продукту в списке и добавляет его артикул в новый список.
            List<string> articleNumbers = new();        //Возвращает список артикулов.
                                                        //Этот метод позволяет легко получить все артикулы продуктов из базы данных и вернуть их в виде списка объектов ArticleNumbers.
            foreach (var product in products)  
            {
                articleNumbers.Add(product.ArticleNumber);
            }
            return articleNumbers;
        }

        public static List<Order> GetOrder()                                       //Подключается к базе данных.
        {                                                                          //Выполняет SQL-запрос для получения всех заказов из таблицы ExamOrder.
            using SqlConnection connection = new(ConnectionString);                //Читает данные из результата запроса и создает объекты Order.
            connection.Open();                                                     //Добавляет созданные объекты в список.
                                                                                   //Возвращает список объектов Order.
            var query = "USE ExamDatabase SELECT * FROM ExamOrder";                //Этот метод позволяет получить все заказы из базы данных и вернуть их в виде списка объектов Order.


            SqlCommand command = new(query, connection);
            List<Order> orders = new();
            var reader = command.ExecuteReader();

            while (reader.Read())
            {
                var order = new Order
                {
                    Id = Convert.ToInt32(reader["OrderID"]),
                    Status = reader["OrderStatus"].ToString(),
                    Date = (DateTime)reader["OrderDate"],
                    DeliveryDate = (DateTime)reader["OrderDeliveryDate"],
                    PickupPoint = Convert.ToInt32(reader["OrderPickupPoint"]),
                    ReceiptCode = Convert.ToInt32(reader["OrderReceiptCode"]),
                };
                orders.Add(order);
            }
            return orders;
        }

        public static List<PickupPoint> GetPickupPoint()                    //Подключается к базе данных.
        {                                                                   //Выполняет SQL-запрос для получения всех пунктов самовывоза из таблицы ExamPickupPoint.
            using SqlConnection connection = new(ConnectionString);         //Читает данные из результата запроса и создает объекты PickupPoint.
            connection.Open();                                              //Добавляет созданные объекты в список.
                                                                            //Возвращает список объектов PickupPoint.
            var query = "USE ExamDatabase SELECT * FROM ExamPickupPoint";   //Этот метод позволяет получить все пункты самовывоза из базы данных и вернуть их в виде списка объектов PickupPoint.
            SqlCommand command = new(query, connection);
            List<PickupPoint> pickupPoints = new();
            var reader = command.ExecuteReader();

            while (reader.Read())
            {
                var pickupPoint = new PickupPoint
                {
                    Id = Convert.ToInt32(reader["PickupPointID"]),
                    Address = reader["Address"].ToString(),
                    PostCode = reader["PostCode"].ToString(),
                };
                pickupPoints.Add(pickupPoint);
            }
            return pickupPoints;
        }
            
        public static User GetUser(string userLogin)                                                //Подключается к базе данных.                   
        {                                                                                           //Выполняет SQL-запрос для получения данных пользователя с указанным логином из таблицы ExamUser.
            using SqlConnection connection = new(ConnectionString);                                 //Читает данные из результата запроса и создает объект User.
            connection.Open();                                                                      //Возвращает объект User.
                                                                                                    //Этот метод позволяет получить данные пользователя из базы данных по его логину и вернуть их в виде объекта User.
            var query = "USE ExamDatabase SELECT * FROM ExamUser WHERE UserLogin LIKE @searchText";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@searchText", $"{userLogin}");

            User user = null;

            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                user = new User
                {
                    Id = Convert.ToInt32(reader["UserID"]),
                    Surname = reader["UserSurname"].ToString(),
                    Name = reader["UserName"].ToString(),
                    Patronymic = reader["UserPatronymic"].ToString(),
                    Login = reader["UserLogin"].ToString(),
                    Password = reader["UserPassword"].ToString(),
                    Role = Convert.ToInt32(reader["UserRole"])
                };
            }
            return user;
        }

        public static string GetUserFullName(int orderId)                                                                       //Подключается к базе данных.
        {                                                                                                                       //Выполняет SQL-запрос для получения полного имени пользователя с указанным UserID из таблицы ExamUser.
            using SqlConnection connection = new(ConnectionString);                                                             //Возвращает полное имя пользователя в виде строки.
            connection.Open();                                                                                                  //Этот метод позволяет получить полное имя пользователя из базы данных по его идентификатору и вернуть его в виде строки.

            var query = "SELECT CONCAT_WS(' ',UserSurname, UserName, UserPatronymic) FROM ExamUser WHERE UserID = @orderId";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@orderId", orderId);
            return Convert.ToString(command.ExecuteScalar());
        }

        public static void AddOrder(int pickupPoint, int receiptCode)                                                                               //Подключается к базе данных.
        {                                                                                                                                           //Формирует SQL-запрос для вставки новой записи в таблицу ExamOrder с указанными значениями.
            using SqlConnection connection = new(ConnectionString);                                                                                 //Выполняет запрос, добавляя новую запись в таблицу.
            connection.Open();

            var query = "USE ExamDatabase INSERT INTO ExamOrder (OrderStatus, OrderDate, OrderDeliveryDate, OrderPickupPoint, OrderReceiptCode) " +
                $"VALUES (N'Новый', '{DateTime.Now:yyyy-MM-dd}', '{DateTime.Now.AddDays(3):yyyy-MM-dd}', '{pickupPoint}', '{receiptCode}')";
            SqlCommand command = new(query, connection);
            command.ExecuteNonQuery();
        }

        public static void UpdateOrder(Order order)                                                                                                                 //Подключается к базе данных.
        {                                                                                                                                                           //Формирует SQL-запрос для обновления записи в таблице ExamOrder с указанными значениями.
            using SqlConnection connection = new(ConnectionString);                                                                                                 //Выполняет запрос, обновляя запись в таблице.
            connection.Open();                                                                                                                                      
                                                                                                                                                                    
            var query = $"USE ExamDatabase UPDATE ExamOrder SET OrderStatus = N'{order.Status}', OrderPickupPoint = {order.PickupPoint} WHERE OrderID = {order.Id}";
            SqlCommand command = new(query, connection);
            command.ExecuteNonQuery();
        }

        public static double GetOrderTotalCost(int orderId)             //Подключается к базе данных.
        {                                                               //Вызывает хранимую процедуру GetOrderTotalCost для получения общей стоимости заказа с указанным orderId.
            using SqlConnection connection = new(ConnectionString);     //Возвращает общую стоимость заказа в виде значения типа double.
            connection.Open();                                          //

            var query = "GetOrderTotalCost";
            SqlCommand command = new(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@orderId", orderId);
            var result = Convert.ToDouble(command.ExecuteScalar());
            return result;
        }

        public static double GetOrderTotalDiscount(int orderId)         //Подключается к базе данных.
        {                                                               //Вызывает хранимую процедуру GetOrderTotalDiscount для получения общей скидки заказа с указанным orderId.
            using SqlConnection connection = new(ConnectionString);     //Возвращает общую скидку заказа в виде значения типа int или double.
            connection.Open();                                          //
                                                                        //
            var query = "GetOrderTotalDiscount";
            SqlCommand command = new(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@orderId", orderId);
            var result = Convert.ToInt32(command.ExecuteScalar());
            return result;
        }

        public static void UpdateProduct(Product product)                                                                                                       //Подключается к базе данных.
        {                                                                                                                                                       //Формирует SQL-запрос для обновления записи в таблице ExamProduct с указанными значениями.
            using SqlConnection connection = new(ConnectionString);                                                                                             //Выполняет запрос, обновляя запись в таблице.
            connection.Open();                                                                                                                                 

            var query = $"USE ExamDataBase UPDATE ExamProduct SET ProductName = N'{product.Name}', ProductDescription = N'{product.Description}', " +
                $"ProductCategory = N'{product.Category}', ProductManufacturer = N'{product.Manufacturer}', ProductCost = {product.Cost}, " +
                $"ProductDiscountAmount = {product.DiscountAmount}, ProductQuantityInStock = {product.QuantityInStock}, ProductStatus = N'{product.Status}'" +
                $"WHERE ProductArticleNumber = N'{product.ArticleNumber}'";
            SqlCommand command = new(query, connection);
            command.ExecuteNonQuery();
        }

        public static void DeleteProduct(Product product)                                                                     //Подключается к базе данных.
        {                                                                                                                     //Формирует SQL-запрос для удаления записи из таблицы ExamProduct с указанным значением ProductArticleNumber.
            using SqlConnection connection = new(ConnectionString);                                                           //Выполняет запрос, удаляя запись из таблицы.
            connection.Open();                                                                                               

            var query = $"USE ExamDataBase DELETE ExamProduct WHERE ProductArticleNumber = N'{product.ArticleNumber}'";
            SqlCommand command = new(query, connection);
            command.ExecuteNonQuery();
        }

        public static void AddProduct(Product product)                                                                                                                  //Подключается к базе данных.
        {                                                                                                                                                               //Формирует SQL-запрос для вставки новой записи в таблицу ExamProduct с указанными значениями.
            using SqlConnection connection = new(ConnectionString);                                                                                                     //Выполняет запрос, добавляя новую запись в таблицу.
            connection.Open();                                                                                                                                         

            var query = $"USE ExamDataBase INSERT INTO ExamProduct (ProductArticleNumber, ProductName, ProductDescription, ProductCategory, ProductManufacturer, " +
                $"ProductCost, ProductDiscountAmount, ProductQuantityInStock, ProductStatus) " +
                $"VALUES (N'{product.ArticleNumber}', N'{product.Name}', N'{product.Description}', N'{product.Category}', N'{product.Manufacturer}', " +
                $"'{product.Cost}', '{product.DiscountAmount}', '{product.QuantityInStock}', N'{product.Status}')";
            SqlCommand command = new(query, connection);
            command.ExecuteNonQuery();
        }
    }
}


