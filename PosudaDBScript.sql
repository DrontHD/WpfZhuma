/*Перед выполнением скрипта создайте базу данных под названием PosudaDB */

USE [PosudaDB]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderInformation]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInformation](
	[IdOrder] [varchar](50) NOT NULL,
	[Product] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Order_Information] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[DeliveryDate] [date] NULL,
	[PointsIssuance] [int] NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[CodeGet] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointsIssuance]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointsIssuance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Index] [varchar](50) NULL,
	[City] [varchar](max) NULL,
	[Street] [varchar](max) NULL,
	[House] [varchar](max) NULL,
 CONSTRAINT [PK_Points_Issuance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Product categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employee role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 27.10.2023 1:23:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[Article] [varchar](50) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Unit] [varchar](10) NULL,
	[Price] [money] NULL,
	[MaxDiscount] [int] NOT NULL,
	[IdManufacturer] [int] NULL,
	[IdSupplier] [int] NULL,
	[IdProductCategory] [int] NULL,
	[CurrentDiscount] [int] NULL,
	[QuantityInStock] [int] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (1, N'Webber')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (2, N'Luminarc')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (3, N'Нева')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (4, N'Tefal')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (5, N'Solaris')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (6, N'Galaxy')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (7, N'Эмаль')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderInformation] ON 

INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'1', N'А112Т4', 2, 1)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'1', N'D548T5', 2, 2)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'2', N'F735F5', 3, 3)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'2', N'D644G3', 1, 4)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'3', N'H482Y6', 2, 5)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'3', N'F836E5', 1, 6)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'4', N'N835F5', 5, 7)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'4', N'F835F5', 5, 8)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'5', N'D036H2', 10, 9)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'5', N'N835D4', 10, 10)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'6', N'K036S3', 1, 11)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'6', N'C367R6', 1, 12)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'7', N'L346D4', 1, 13)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'7', N'S257G5', 1, 14)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'8', N'G405K9', 20, 15)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'8', N'S306J8', 20, 16)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'9', N'V493H5', 1, 17)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'9', N'F835H6', 1, 18)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'10', N'K935B6', 3, 19)
INSERT [dbo].[OrderInformation] ([IdOrder], [Product], [Quantity], [Id]) VALUES (N'10', N'F934E5', 2, 20)
SET IDENTITY_INSERT [dbo].[OrderInformation] OFF
GO
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-11' AS Date), 13, NULL, NULL, NULL, 301, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (2, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-11' AS Date), 12, N'Никулин', N'Антон', N'Фёдорович', 302, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (3, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 13, NULL, NULL, NULL, 303, 0)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (4, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-13' AS Date), 14, NULL, NULL, NULL, 304, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (5, CAST(N'2022-05-09' AS Date), CAST(N'2022-05-15' AS Date), 15, N'Копылова', N'Софья', N'Николаевна', 305, 0)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (6, CAST(N'2022-05-09' AS Date), CAST(N'2022-05-15' AS Date), 16, NULL, NULL, NULL, 306, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (7, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 16, N'Петров', N'Ибрагим', N'Романович', 307, 0)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (8, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 18, NULL, NULL, NULL, 308, 1)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (9, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 20, NULL, NULL, NULL, 309, 0)
INSERT [dbo].[Orders] ([Id], [OrderDate], [DeliveryDate], [PointsIssuance], [LastName], [FirstName], [MiddleName], [CodeGet], [Status]) VALUES (10, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 20, N'Овсянников', N'Никита', N'Сергеевич', 310, 0)
GO
SET IDENTITY_INSERT [dbo].[PointsIssuance] ON 

INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (1, N'344288', N'Краснокаменск', N'Чехова', N'1')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (2, N'614164', N'Краснокаменск', N'Степная', N'30')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (3, N'394242', N'Краснокаменск', N'Коммунистическая', N'43')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (4, N'660540', N'Краснокаменск', N'Солнечная', N'25')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (5, N'125837', N'Краснокаменск', N'Шоссейная', N'40')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (6, N'125703', N'Краснокаменск', N'Партизанская', N'49')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (7, N'625283', N'Краснокаменск', N'Победы', N'46')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (8, N'614611', N'Краснокаменск', N'Молодежная', N'50')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (9, N'454311', N'Краснокаменск', N'Новая', N'19')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (10, N'660007', N'Краснокаменск', N'Октябрьская', N'19')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (11, N'603036', N'Краснокаменск', N'Садовая', N'4')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (12, N'450983', N'Краснокаменск', N'Комсомольская', N'26')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (13, N'394782', N'Краснокаменск', N'Чехова', N'3')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (14, N'603002', N'Краснокаменск', N'Дзержинского', N'28')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (15, N'450558', N'Краснокаменск', N'Набережная', N'30')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (16, N'394060', N'Краснокаменск', N'Фрунзе', N'43')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (17, N'410661', N'Краснокаменск', N'Школьная', N'50')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (18, N'625590', N'Краснокаменск', N'Коммунистическая', N'20')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (19, N'625683', N'Краснокаменск', N'8 Марта', N'')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (20, N'400562', N'Краснокаменск', N'Зеленая', N'32')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (21, N'614510', N'Краснокаменск', N'Маяковского', N'47')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (22, N'410542', N'Краснокаменск', N'Светлая', N'46')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (23, N'620839', N'Краснокаменск', N'Цветочная', N'8')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (24, N'443890', N'Краснокаменск', N'Коммунистическая', N'1')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (25, N'603379', N'Краснокаменск', N'Спортивная', N'46')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (26, N'603721', N'Краснокаменск', N'Гоголя', N'41')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (27, N'410172', N'Краснокаменск', N'Северная', N'13')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (28, N'420151', N'Краснокаменск', N'Вишневая', N'32')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (29, N'125061', N'Краснокаменск', N'Подгорная', N'8')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (30, N'630370', N'Краснокаменск', N'Шоссейная', N'24')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (31, N'614753', N'Краснокаменск', N'Полевая', N'35')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (32, N'426030', N'Краснокаменск', N'Маяковского', N'44')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (33, N'450375', N'Краснокаменск', N'Клубная', N'44')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (34, N'625560', N'Краснокаменск', N'Некрасова', N'12')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (35, N'630201', N'Краснокаменск', N'Комсомольская', N'17')
INSERT [dbo].[PointsIssuance] ([id], [Index], [City], [Street], [House]) VALUES (36, N'190949', N'Краснокаменск', N'Мичурина', N'26')
SET IDENTITY_INSERT [dbo].[PointsIssuance] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (1, N'Кастрюли')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (2, N'Сервиз')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (3, N'Сковорода')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (4, N'посуда')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (1, N'Федоров', N'Глеб', N'Михайлович', N'o@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (2, N'Семенова', N'Софья', N'Дмитриевна', N'hr6zdl@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (3, N'Васильев', N'Егор', N'Германович', N'kaft93x@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (4, N'Смирнова', N'Ирина', N'Александровна', N'dcu@yandex.ru', N'YOyhfR', 2)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (5, N'Петров', N'Андрей', N'Владимирович', N'19dn@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (6, N'Егоров', N'Максим', N'Андреевич', N'pa5h@mail.ru', N'rwVDh9', 2)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (7, N'Никитин', N'Артур', N'Алексеевич', N'281av0@gmail.com', N'LdNyos', 2)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (8, N'Киселев', N'Максим', N'Сергеевич', N'8edmfh@outlook.com', N'gynQMT', 3)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (9, N'Борисов', N'Тимур', N'Егорович', N'sfn13i@mail.ru', N'AtnDjr', 3)
INSERT [dbo].[Staff] ([ID], [LastName], [FirstName], [MiddleName], [Login], [Password], [IdRole]) VALUES (10, N'Климов', N'Арсений', N'Тимурович', N'g0orc3x1@outlook.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'Максидом')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'Домовой')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'A395T3', N'Набор кастрюль', N'шт.', 2150.0000, 15, 7, 1, 1, 2, 13, N'Набор кастрюль Эмаль Дача 2-3194/4 белый')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'C367R6', N'Набор кастрюль', N'шт.', 3600.0000, 15, 1, 2, 1, 3, 7, N'Набор кастрюль Webber BE-336/6 6 пр. серебристый')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'C425F8', N'Набор посуды', N'шт.', 5990.0000, 15, 3, 1, 4, 5, 9, N'Набор обеденной посуды Mason Cash Classic 12 предметов серый')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'C432H7', N'Набор посуды', N'шт.', 2700.0000, 30, 4, 2, 4, 4, 6, N'Набор посуды Tefal Ingenio Red 04162820 3 пр. красный')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'D026R4', N'Сковорода', N'шт.', 1800.0000, 25, 3, 1, 3, 4, 2, N'Сковорода НЕВА МЕТАЛЛ 4 Карелия 2328, 28 см')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'D036H2', N'Сковорода', N'шт.', 1960.0000, 5, 3, 2, 3, 5, 12, N'Сковорода НЕВА МЕТАЛЛ 4 Алтай индукционная, 26 см')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'D548T5', N'Столовый сервиз', N'шт.', 1700.0000, 15, 2, 2, 2, 4, 10, N'Столовый сервиз Luminarc Every Day G0566, 6 персон, 18 предм.')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'D630H5', N'Набор кастрюль', N'шт.', 2000.0000, 10, 1, 1, 1, 3, 8, N'Набор кастрюль Webber BE-621/6 стальной')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'D644G3', N'Набор кастрюль', N'шт.', 3500.0000, 5, 1, 2, 1, 3, 8, N'Набор кастрюль Webber ВЕ-620/8 8 пр. стальной')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'F735F5', N'Сковорода', N'шт.', 1270.0000, 10, 3, 1, 3, 2, 4, N'Сковорода НЕВА МЕТАЛЛ 4 Домашняя 7424, съемная ручка, 24 см')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'F835F5', N'Набор посуды', N'шт.', 732.0000, 10, 5, 2, 2, 2, 9, N'Набор посуды SOLARIS S1605: 6 тарелок 180мм в контейнере')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'F835H6', N'Кастрюля для запекания', N'шт.', 2130.0000, 10, 3, 2, 1, 2, 5, N'Кастрюля эмалированная, цветок Розы')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'F836E5', N'Набор сковород', N'шт.', 4600.0000, 20, 4, 1, 3, 2, 6, N'Набор сковород Tefal Ingenio Chef Red L6598672 3 пр. бордовый')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'F934E5', N'Сервировочное блюдо', N'шт.', 1200.0000, 10, 3, 1, 4, 3, 5, N'Сервировочное блюдо ROSSI для подачи из керамики 28х18 см ')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'G405K9', N'Набор посуды', N'шт.', 240.0000, 5, 5, 1, 4, 4, 23, N'Набор посуды SOLARIS S1607: 6 стаканов 0,1л в контейнере')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'H482Y6', N'Столовый сервиз', N'шт.', 2300.0000, 15, 2, 1, 2, 5, 12, N'Столовый сервиз Luminarc Cadix L0300, 6 персон, 19 предм.')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'J468K6', N'Набор сковород', N'шт.', 1390.0000, 25, 6, 1, 3, 2, 13, N'Набор сковород GALAXY GL9801 2 пр. синий')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'K036S3', N'Набор посуды', N'шт.', 2990.0000, 5, 6, 2, 2, 5, 15, N'Набор посуды GALAXY GL9507 6 пр. коричневый')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'K935B6', N'Салатник', N'шт.', 1200.0000, 5, 3, 2, 4, 3, 9, N'Салатник «Кото», 0,19 л 10 см красный, фарфор')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'L346D4', N'Набор кружек', N'шт.', 329.0000, 5, 3, 1, 4, 5, 18, N'Набор кружек Pasabahce Basic, 370 мл, 2 предм., 2 персоны')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'M045H6', N'Набор кастрюль', N'шт.', 1499.0000, 15, 7, 1, 1, 4, 7, N'Набор кастрюль СтальЭмаль 1с33/1 6 пр. белоснежный /маки ')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'M527Y7', N'Казан', N'шт.', 1999.0000, 30, 3, 2, 1, 3, 6, N'Казан 5 л Наша 4 антипригарный')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'N835D4', N'Набор кастрюль', N'шт.', 2100.0000, 10, 6, 1, 1, 3, 5, N'Набор кастрюль GALAXY GL9512 4 пр. фиолетовый')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'N835F5', N'Кастрюля для запекания', N'шт.', 744.0000, 5, 4, 2, 1, 3, 13, N'Кастрюля для запекания Tefal 208AC00/1043, 2.3 л, 23 см')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'S257G5', N'Набор посуды', N'шт.', 2300.0000, 10, 4, 1, 4, 4, 8, N'Набор посуды для выпечки O CUISINE 333SA95/6142')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'S306J8', N'Ковш', N'шт.', 409.0000, 10, 4, 1, 4, 2, 14, N'Ковш б/деколи(палевый) 17,5х8 см 1,5 л')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'S413D4', N'Набор кастрюль', N'шт.', 4500.0000, 15, 7, 1, 1, 3, 15, N'Набор кастрюль СтальЭмаль 7DA025S 6 пр. слоновая кость')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'S835H6', N'Кастрюля для запекания', N'шт.', 1600.0000, 15, 4, 2, 1, 4, 13, N'Кастрюля Scovo Expert СЭ-008, 4.5 л')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'V493H5', N'Набор посуды', N'шт.', 6000.0000, 15, 4, 1, 4, 4, 18, N'Набор посуды Tefal Ingenio RED 9 предметов ')
INSERT [dbo].[Warehouse] ([Article], [ProductName], [Unit], [Price], [MaxDiscount], [IdManufacturer], [IdSupplier], [IdProductCategory], [CurrentDiscount], [QuantityInStock], [Description]) VALUES (N'А112Т4', N'Набор кастрюль', N'шт.', 2600.0000, 30, 1, 1, 1, 4, 6, N'Набор кастрюль Webber BE-335/6 6 пр. серебристый')
GO
ALTER TABLE [dbo].[OrderInformation]  WITH CHECK ADD  CONSTRAINT [FK_Order_Information_Warehouse] FOREIGN KEY([Product])
REFERENCES [dbo].[Warehouse] ([Article])
GO
ALTER TABLE [dbo].[OrderInformation] CHECK CONSTRAINT [FK_Order_Information_Warehouse]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Information] FOREIGN KEY([Id])
REFERENCES [dbo].[OrderInformation] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Order_Information]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Points_Issuance] FOREIGN KEY([PointsIssuance])
REFERENCES [dbo].[PointsIssuance] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Points_Issuance]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Employee role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Employee role]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Manufacturers] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_Manufacturers]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Product_categories] FOREIGN KEY([IdProductCategory])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_Product_categories]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Suppliers] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_Suppliers]
GO
