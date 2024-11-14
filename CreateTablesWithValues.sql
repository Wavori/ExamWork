USE [master]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderReceiptCode] [smallint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__C3905BAF40E11E2A] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamOrderProduct]    Script Date: 10.10.2024 20:02:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[OrderQuantity] [tinyint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__817A266277CA12A0] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamPickupPoint]   Script Date: 10.10.2024 20:02:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamPickupPoint](
	[PickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[PostCode] [int] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_ExamPickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamProduct]    Script Date: 10.10.2024 20:02:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamProduct](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductCategory] [nvarchar](max) NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NULL,
	[ProductCost] [decimal](19, 2) NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NULL,
	[ProductStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK__ExamProd__2EA7DCD5A72A3F42] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamRole]    Script Date: 10.10.2024 20:02:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamUser]    Script Date: 10.10.2024 20:02:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL, 
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExamOrder] ON 
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (1, N'�����', CAST(N'2022-05-04' AS Date), CAST(N'2022-05-10' AS Date), 23, 201)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (2, N'�����', CAST(N'2022-05-05' AS Date), CAST(N'2022-05-11' AS Date), 25, 202)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (3, N'�����', CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 26, 203)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (4, N'�����', CAST(N'2022-05-07' AS Date), CAST(N'2022-05-13' AS Date), 27, 204)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (5, N'�����', CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 28, 205)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (6, N'�����', CAST(N'2022-05-09' AS Date), CAST(N'2022-05-15' AS Date), 29, 206)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (7, N'�����', CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 30, 207)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (8, N'�����', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 31, 208)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (9, N'�����', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 32, 209)
GO
INSERT [dbo].[ExamOrder] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderReceiptCode]) VALUES (10, N'��������', CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 33, 210)
GO
SET IDENTITY_INSERT [dbo].[ExamOrder] OFF
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (1, N'F893T5', 2)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (1, N'�112�4', 2)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (2, N'E530Y6', 1)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (2, N'F346G5', 2)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (3, N'D344Y7', 2)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (3, N'J432E4', 1)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (4, N'D378D3', 2)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (4, N'E245R5', 1)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (5, N'H732R5', 3)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (5, N'R464G6', 2)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (6, N'E573G6', 3)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (6, N'K535G6', 3)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (7, N'F344S4', 6)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (7, N'G532R5', 5)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (8, N'D526R4', 5)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (8, N'S753T5', 4)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (9, N'A436H7', 3)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (9, N'V472S3', 3)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (10, N'E479G6', 1)
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (10, N'O875F6', 4)
GO
SET IDENTITY_INSERT [dbo].[ExamPickupPoint] ON 
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (1, 344288, N'�. ������� ��. ������ 1')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (2, 614164, N'�.������� ��. ������� 30')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (3, 394242, N'�. ������� ��. ���������������� 43')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (4, 660540, N'�. ������� ��. ��������� 25')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (5, 125837, N'�. ������� ��. ��������� 40')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (6, 125703, N'�. ������� ��. ������������ 49')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (7, 625283, N'�. ������� ��. ������ 46')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (8, 614611, N'�. ������� ��. ���������� 50')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (9, 454311, N'�.������� ��. ����� 19')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (10, 660007, N'�.������� ��. ����������� 19')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (11, 603036, N'�. ������� ��. ������� 4')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (12, 450983, N'�.������� ��. ������������� 26')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (13, 394782, N'�. ������� ��. ������ 3')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (14, 603002, N'�. ������� ��. ������������ 28')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (15, 450558, N'�. ������� ��. ���������� 30')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (16, 394060, N'�.������� ��. ������ 43')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (17, 410661, N'�. ������� ��. �������� 50')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (18, 625590, N'�. ������� ��. ���������������� 20')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (19, 625683, N'�. ������� ��. 8 �����')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (20, 400562, N'�. ������� ��. ������� 32')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (21, 614510, N'�. ������� ��. ����������� 47')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (22, 410542, N'�. ������� ��. ������� 46')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (23, 620839, N'�. ������� ��. ��������� 8')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (24, 443890, N'�. ������� ��. ���������������� 1')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (25, 603379, N'�. ������� ��. ���������� 46')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (26, 603721, N'�. ������� ��. ������ 41')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (27, 410172, N'�. ������� ��. �������� 13')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (28, 420151, N'�. ������� ��. �������� 32')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (29, 125061, N'�. ������� ��. ��������� 8')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (30, 630370, N'�. ������� ��. ��������� 24')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (31, 614753, N'�. ������� ��. ������� 35')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (32, 426030, N'�. ������� ��. ����������� 44')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (33, 450375, N'�. ������� ��. ������� 44')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (34, 625560, N'�. ������� ��. ��������� 12')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (35, 630201, N'�. ������� ��. ������������� 17')
GO
INSERT [dbo].[ExamPickupPoint] ([PickupPointID], [PostCode], [Address]) VALUES (36, 190949, N'�. ������� ��. �������� 26')
GO
SET IDENTITY_INSERT [dbo].[ExamPickupPoint] OFF
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A436H7', N'Scalpers Yacht Club Eau de Parfum', N'����������� ����', N'����������', NULL, N'Scalpers', CAST(5200.00 AS Decimal(19, 2)), 20, 50, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D344Y7', N'Atelier Rebul Grapefruit Delight Intense Eau de Cologne', N'��������', N'����������', NULL, N'Atelier Rebul', CAST(3500.00 AS Decimal(19, 2)), 43, 10, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D378D3', N'Focallure Pure Matte Lipstick', N'������� ������ ������ � ����������� ���� � �������', N'������', NULL, N'Focallure', CAST(650.00 AS Decimal(19, 2)), 10, 0, N'��� � �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D526R4', N'Jusbox Night Flow Eau de Parfum', N'����������� ����', N'����������', NULL, N'Jusbox', CAST(16400.00 AS Decimal(19, 2)), 0, 15, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E245R5', N'Kilian Good Girl Gone Bad Full Range Set', N'����������� �����', N'����������', NULL, N'Kilian', CAST(67500.00 AS Decimal(19, 2)), 0, 0, N'��� � �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E479G6', N'Clinique Lash Power Mascara', N'������������ ���� ��� ������', N'������', NULL, N'Clinique', CAST(3350.00 AS Decimal(19, 2)), 41, 20, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E530Y6', N'Clarins Summer CollectionBronzing Compact Powder', N'������������ �����', N'������', NULL, N'Clarins', CAST(5100.00 AS Decimal(19, 2)), 25, 46, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E573G6', N'Clarins Water Lip Stain', N'������� ��� ���', N'������', NULL, N'Clarins', CAST(2650.00 AS Decimal(19, 2)), 30, 0, N'��� � �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F344S4', N'Tous Man Spritz Eau de Toilette', N'��������� ����', N'����������', NULL, N'Tous', CAST(6500.00 AS Decimal(19, 2)), 20, 17, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F346G5', N'Maison Lamyris Cosaque Eau de Parfume', N'����������� ����', N'����������', NULL, N'Maison Lamyris', CAST(2900.00 AS Decimal(19, 2)), 20, 3, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F893T5', N'MAC MACximal Matte Lipstick', N'������� ������ ������', N'������', NULL, N'MAC', CAST(2690.00 AS Decimal(19, 2)), 0, 43, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G532R5', N'Press Gurwitz Perfumerie �3 Tobacco, Cinnamon, Vanilla Eau de Toilette', N'��������� ����', N'����������', NULL, N'Press Gurwitz Perfumerie', CAST(6500.00 AS Decimal(19, 2)), 20, 16, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H732R5', N'MAC Squirt Plumping Gloss Stick', N'������� ��� ���, ��������� �����', N'������', NULL, N'MAC', CAST(2690.00 AS Decimal(19, 2)), 0, 13, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J432E4', N'Acqua Di Parma Colonia C.L.U.B. Eau de Cologne', N'��������', N'����������', NULL, N'Acqua Di Parma', CAST(12500.00 AS Decimal(19, 2)), 0, 0, N'��� � �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K535G6', N'Proraso Azur Lime Cologne', N'��������', N'����������', NULL, N'Proraso', CAST(2565.00 AS Decimal(19, 2)), 0, 12, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O875F6', N'Kilian Love, don''t be shy Eau de Parfum', N'����������� ����', N'����������', NULL, N'Kilian', CAST(28530.00 AS Decimal(19, 2)), 0, 0, N'��� � �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R464G6', N'Tom Ford Grey Vetiver Parfum', N'����', N'����������', NULL, N'Tom Ford', CAST(15600.00 AS Decimal(19, 2)), 0, 0, N'��� � �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S753T5', N'Clarins Aroma Eau Dynamisante', N'������������ ������������� ���� ��� ����', N'����������', NULL, N'Clarins', CAST(4400.00 AS Decimal(19, 2)), 25, 14, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V472S3', N'Clarins Aroma Eau Ressourcante', N'������������� ������������� ���� ��� ����', N'����������', NULL, N'Clarins', CAST(4400.00 AS Decimal(19, 2)), 25, 16, N'� �������')
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'�112�4', N'Bobbi Brown Skin Corrector Stick', N'���������� ��������� � �����', N'������', NULL, N'Bobbi Brown', CAST(3800.00 AS Decimal(19, 2)), 20, 0, N'��� � �������')
GO
SET IDENTITY_INSERT [dbo].[ExamRole] ON 
GO
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (1, N'�������������')
GO
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (2, N'��������')
GO
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (3, N'������')
GO
SET IDENTITY_INSERT [dbo].[ExamRole] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamUser] ON 
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'�������������', N'��������', N'����������', N'loginDEsgg2018', N'qhgYnW', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'��������', N'������', N'���������', N'loginDEdcd2018', N'LxR6YI', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'�������', N'�����', N'�����������', N'loginDEisg2018', N'Cp8ddU', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'������', N'����', N'����������', N'loginDEcph2018', N'7YpE0p', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'������', N'������', N'���������', N'loginDEgco2018', N'nMr|ss', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'����', N'������', N'�����������', N'loginDEwjg2018', N'9UfqWQ', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'�������', N'����', N'������������', N'loginDEjbz2018', N'xIAWNI', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'������', N'��������', N'��������', N'loginDEmgu2018', N'0gC3bk', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'������', N'������', N'����������', N'loginDErdg2018', N'ni0ue0', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'��������', N'����', N'�����������', N'loginDEjtv2018', N'f2ZaN6', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'������', N'�����', N'����������', N'loginDEtfj2018', N'{{ksPn', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'��������', N'�������', N'������������', N'loginDEpnb2018', N'{ADBdc', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'������', N'������', N'��������', N'loginDEzer2018', N'5&R+zs', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'������', N'�����', N'���������', N'loginDEiin2018', N'y9l*b}', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'��������', N'���������', N'���������', N'loginDEqda2018', N'|h+r}I', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'��������', N'��������', N'����������', N'loginDEbnj2018', N'#���?', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'���������', N'����', N'����������', N'loginDEqte2018', N'dC8bDI', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'��������', N'������', N'��������', N'loginDEfeo2018', N'8cI7vq', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'���������', N'�����', N'��������', N'loginDEvni2018', N'e4pVIv', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'��������', N'������', N'�����������', N'loginDEjis2018', N'A9K++2', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'��������', N'�������', N'��������', N'loginDExvv2018', N'R1zh}|', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'��������', N'�������', N'���������', N'loginDEadl2018', N'F&IWf4', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'�������', N'���������', N'�������������', N'loginDEyzn2018', N'P1v24R', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'�������', N'���������', N'�����������', N'loginDEphn2018', N'F}jGsJ', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'�������', N'������', N'������������', N'loginDEdvk2018', N'NKNkup', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'��������', N'����', N'����������', N'loginDEtld2018', N'c+CECK', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'������', N'������', N'��������', N'loginDEima2018', N'XK3sOA', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'������', N'����', N'���������', N'loginDEyfe2018', N'4Bbzpa', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'������', N'���', N'����������', N'loginDEwqc2018', N'vRtAP*', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'�������', N'�����', N'�������������', N'loginDEgtt2018', N'7YD|BR', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'��������', N'������', N'���������', N'loginDEiwl2018', N'LhlmIl', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'������������', N'ϸ��', N'�����������', N'loginDEyvi2018', N'22beR}', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'�������', N'��������', N'��������', N'loginDEtfz2018', N'uQY0ZQ', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'���������', N'��������', N'�����������', N'loginDEikb2018', N'*QkUxc', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'��������', N'������', N'���������', N'loginDEdmi2018', N'HOGFbU', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'�������', N'���������', N'����������', N'loginDEtlo2018', N'58Jxrg', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'������', N'������', N'������������', N'loginDEsnd2018', N'lLHqZf', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'�����', N'�������', N'����������', N'loginDEgno2018', N'4fqLiO', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'��������', N'�����', N'��������', N'loginDEgnl2018', N'wdio{u', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'���������', N'�����', N'����������', N'loginDEzna2018', N'yz1iMB', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'�����', N'�����', N'������������', N'loginDEsyh2018', N'&4jYGs', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'��������', N'������', N'�����������', N'loginDExex2018', N'rnh36{', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'���������', N'�����', N'������������', N'loginDEdjm2018', N'KjI1JR', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'������', N'����', N'���������', N'loginDEgup2018', N'36|KhF', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'�����', N'��������', N'����������', N'loginDEdat2018', N'ussd8Q', 1)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'����', N'������', N'���������', N'loginDEffj2018', N'cJP+HC', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'����������', N'������', N'������������', N'loginDEisp2018', N'dfz5Ii', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'�����', N'�������', N'������������', N'loginDEfrp2018', N'6dcR|9', 2)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'���������', N'��������', N'������������', N'loginDEaee2018', N'5&qONH', 3)
GO
INSERT [dbo].[ExamUser] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'��������', N'������', N'����������', N'loginDEthu2018', N'|0xWzV', 3)
GO
SET IDENTITY_INSERT [dbo].[ExamUser] OFF
GO
/****** Object:  Index [IX_ExamOrder_OrderReceiptCode]    Script Date: 10.10.2024 20:02:16 ******/
ALTER TABLE [dbo].[ExamOrder] ADD  CONSTRAINT [IX_ExamOrder_OrderReceiptCode] UNIQUE NONCLUSTERED 
(
	[OrderReceiptCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[ExamPickupPoint] ([PickupPointID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamPickupPoint]
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ExamOrder] ([OrderID])
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Order__403A8C7D]
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[ExamProduct] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[ExamUser]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[ExamRole] ([RoleID])
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [CK_ExamOrderProduct] CHECK  (([OrderQuantity]>=(1)))
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [CK_ExamOrderProduct]
GO
USE [master]
GO
CREATE PROCEDURE GetOrderTotalCost
	@orderId int
AS
BEGIN
	SELECT CAST(SUM(ExamProduct.ProductCost*(1-ExamProduct.ProductDiscountAmount*0.01)) as decimal(18,2))
	FROM ExamOrder
	INNER JOIN ExamOrderProduct ON ExamOrder.OrderID = ExamOrderProduct.OrderID INNER JOIN ExamProduct ON ExamOrderProduct.ProductArticleNumber = ExamProduct.ProductArticleNumber
	WHERE ExamOrder.OrderID = @orderId;
END
GO
CREATE PROCEDURE GetOrderTotalDiscount
	@orderId int
AS
	SELECT SUM(ExamProduct.ProductDiscountAmount)
	FROM ExamOrder 
	INNER JOIN ExamOrderProduct ON ExamOrder.OrderID = ExamOrderProduct.OrderID INNER JOIN ExamProduct ON ExamOrderProduct.ProductArticleNumber = ExamProduct.ProductArticleNumber 
	WHERE ExamOrder.OrderID = @orderId