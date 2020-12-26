	USE [master]
	GO
	/****** Object:  Database [QuanLyQuanCafe]    Script Date: 17/01/2018 5:12:07 PM ******/
	CREATE DATABASE [QuanLyQuanCafe]
	 CONTAINMENT = NONE
	 ON  PRIMARY 
	( NAME = N'QuanLyQuanCafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCafe.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
	 LOG ON 
	( NAME = N'QuanLyQuanCafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyQuanCafe_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
	GO
	USE QuanLyQuanCafe
	ALTER DATABASE [QuanLyQuanCafe] SET COMPATIBILITY_LEVEL = 120
	GO
	IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
	begin
	EXEC [QuanLyQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
	end
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULL_DEFAULT OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULLS OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET ANSI_PADDING OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET ANSI_WARNINGS OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET ARITHABORT OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET AUTO_CLOSE OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET AUTO_SHRINK OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET NUMERIC_ROUNDABORT OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET QUOTED_IDENTIFIER OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET RECURSIVE_TRIGGERS OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET  ENABLE_BROKER 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET TRUSTWORTHY OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET PARAMETERIZATION SIMPLE 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET RECOVERY FULL 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET  MULTI_USER 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET PAGE_VERIFY CHECKSUM  
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET DB_CHAINING OFF 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET DELAYED_DURABILITY = DISABLED 
	GO
	USE QuanLyBanCafe
	GO
	/****** Object:  Table [dbo].[Account]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[Account](
		[UserName] [nvarchar](100) NOT NULL,
		[DisplayName] [nvarchar](100) NOT NULL DEFAULT (N'Kter'),
		[PassWord] [nvarchar](1000) NOT NULL DEFAULT ((0)),
		[Type] [int] NOT NULL DEFAULT ((0)),
	PRIMARY KEY CLUSTERED 
	(
		[UserName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO
	/****** Object:  Table [dbo].[Bill]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[Bill](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[DateCheckIn] [date] NOT NULL DEFAULT (getdate()),
		[DateCheckOut] [date] NULL,
		[idTable] [int] NOT NULL,
		[status] [int] NOT NULL DEFAULT ((0)),
		[discount] [int] NULL,
		[totalPrice] [float] NULL,
	PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO
	/****** Object:  Table [dbo].[BillInfo]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[BillInfo](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[idBill] [int] NOT NULL,
		[idFood] [int] NOT NULL,
		[count] [int] NOT NULL DEFAULT ((0)),
	PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO
	/****** Object:  Table [dbo].[Food]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[Food](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](100) NOT NULL DEFAULT (N'Ch?a ??t tên'),
		[idCategory] [int] NOT NULL,
		[price] [float] NOT NULL DEFAULT ((0)),
	PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO
	/****** Object:  Table [dbo].[FoodCategory]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[FoodCategory](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](100) NOT NULL DEFAULT (N'Ch?a ??t tên'),
	PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO
	/****** Object:  Table [dbo].[TableFood]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [dbo].[TableFood](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](100) NOT NULL DEFAULT (N'Bàn ch?a có tên'),
		[status] [nvarchar](100) NOT NULL DEFAULT (N'Tr?ng'),
	PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO
	INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'admin', N'admin', N'123456', 1)
	INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'staff', N'staff', N'123456', 0)
	SET IDENTITY_INSERT [dbo].[Bill] ON 

	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (56, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 7, 1, 20, 359200)
	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (57, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 12, 1, 20, 120000)
	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (58, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 9, 1, 10, 2637000)
	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (59, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 3, 1, 0, 39000)
	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (60, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 3, 1, 0, 39000)
	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (61, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 3, 1, 0, 180000)
	INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (62, CAST(N'2018-01-17' AS Date), NULL, 17, 0, NULL, NULL)
	SET IDENTITY_INSERT [dbo].[Bill] off;
	SET IDENTITY_INSERT [dbo].[BillInfo] on; 

	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (70, 56, 3, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (71, 56, 4, 3)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (72, 56, 1, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (73, 56, 2, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (74, 57, 2, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (75, 58, 7, 10)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (76, 58, 5, 10)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (77, 58, 6, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (78, 59, 3, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (79, 60, 3, 1)
	INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (80, 62, 6, 1)
	SET IDENTITY_INSERT [dbo].[BillInfo] OFF
	SET IDENTITY_INSERT [dbo].[Food] ON 

	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'L?u h?i s?n', 2, 200000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Tôm n??ng s?t me', 2, 150000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Khoai tây chiên', 1, 39000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (4, N'??u ph?ng cay', 1, 20000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (5, N'Gà phô mai', 3, 250000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'Dú dê n??ng', 3, 180000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Bia Heniken', 4, 25000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Pepsi', 4, 2000)
	INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'Aquaifina', 4, 10000)
	SET IDENTITY_INSERT [dbo].[Food] OFF
	SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

	INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Khai v?')
	INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'H?i s?n')
	INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Th?t')
	INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'N??c')
	SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
	SET IDENTITY_INSERT [dbo].[TableFood] ON 

	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 0', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 1', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 2', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 3', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 4', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 5', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 6', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 7', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 8', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 9', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (12, N'Bàn 10', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (13, N'Bàn 11', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (14, N'Bàn 12', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (15, N'Bàn 13', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (16, N'Bàn 14', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (17, N'Bàn 15', N'Có ng??i')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (18, N'Bàn 16', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (19, N'Bàn 17', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (20, N'Bàn 18', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (21, N'Bàn 19', N'Tr?ng')
	INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (22, N'Bàn 20', N'Tr?ng')
	SET IDENTITY_INSERT [dbo].[TableFood] OFF
	ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
	REFERENCES [dbo].[TableFood] ([id])
	GO
	ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
	REFERENCES [dbo].[Bill] ([id])
	GO
	ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
	REFERENCES [dbo].[Food] ([id])
	GO
	ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
	REFERENCES [dbo].[FoodCategory] ([id])
	GO
	/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE PROC [dbo].[USP_GetAccountByUserName]
	@UserName nvarchar(100)
	AS
	BEGIN
		SELECT * FROM dbo.Account WHERE UserName = @UserName
	END

	GO
	/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE PROC [dbo].[USP_GetListBillByDate]
	@checkFrom DATE,
	@checkTo DATE
	AS
	BEGIN
		SELECT t.name AS [Tên bàn],b.DateCheckIn AS [Gi? vào],b.DateCheckOut AS [Gi? ra],b.discount AS [Gi?m giá],b.totalPrice AS [T?ng ti?n] FROM dbo.Bill AS b,dbo.TableFood AS t
		WHERE b.idTable = t.id
			AND	b.DateCheckOut >= @checkFrom
			AND b.DateCheckOut <= @checkTo
			AND b.status = '1'
	END

	GO
	/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	 CREATE PROC [dbo].[USP_GetTableList]
	 AS SELECT * FROM dbo.TableFood

	GO/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE PROC [dbo].[USP_InsertBill]
	@idTable INT
	AS
	BEGIN
		INSERT dbo.Bill 
				( DateCheckIn ,
				  DateCheckOut ,
				  idTable ,
				  status,
				  discount
				)
		VALUES  ( GETDATE() , -- DateCheckIn - date
				  NULL , -- DateCheckOut - date
				  @idTable , -- idTable - int
				  0,  -- status - int
				  0
				)
	END

	GO
	/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON

	drop proc dbo.USP_InsertBillInfo;
	GO
	CREATE PROC [dbo].[USP_InsertBillInfo]
	@idBill int, @idFood int,@count int
	AS
	BEGIN
		DECLARE @isExistBillInfo INT
		DECLARE @foodCount INT = 1
		SELECT @isExistBillInfo=b.id ,@foodCount=b.count FROM dbo.BillInfo AS b WHERE idBill = @idBill AND idFood = @idFood
		IF(@isExistBillInfo>0)
		BEGIN
			DECLARE @newCount INT = @foodCount + @count 
			IF(@newCount > 0)
				UPDATE dbo.BillInfo SET count = @foodCount + @count WHERE idFood = @idFood
			ELSE
				DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
		END
		ELSE
		BEGIN
    		INSERT INTO dbo.BillInfo
				( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
				  @idFood, -- idFood - int
				  @count  -- count - int
				  )
		END
	
	END
	GO
	/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE PROC [dbo].[USP_Login]
	@userName nvarchar(100), @passWord nvarchar(100)
	AS
	BEGIN
		SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
	END

	GO
	/****** Object:  StoredProcedure [dbo].[USP_SwitchTabel]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	create PROC [dbo].[USP_SwitchTabel]
	@idTable1 INT, @idTable2 int
	AS BEGIN

		DECLARE @idFirstBill int
		DECLARE @idSeconrdBill INT
	
		DECLARE @isFirstTablEmty INT = 1
		DECLARE @isSecondTablEmty INT = 1
	
	
		SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	
		IF (@idFirstBill IS NULL)
		BEGIN
			INSERT dbo.Bill
					( DateCheckIn ,
					  DateCheckOut ,
					  idTable ,
					  status
					)
			VALUES  ( GETDATE() , -- DateCheckIn - date
					  NULL , -- DateCheckOut - date
					  @idTable1 , -- idTable - int
					  0  -- status - int
					)
		        
			SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
		END
	
		SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
		IF (@idSeconrdBill IS NULL)
		BEGIN
			INSERT dbo.Bill
					( DateCheckIn ,
					  DateCheckOut ,
					  idTable ,
					  status
					)
			VALUES  ( GETDATE() , -- DateCheckIn - date
					  NULL , -- DateCheckOut - date
					  @idTable2 , -- idTable - int
					  0  -- status - int
					)
			SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
		END
	
		SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill

		SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
		UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
		UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
		DROP TABLE IDBillInfoTable
	
		IF (@isFirstTablEmty = 0)
			UPDATE dbo.TableFood SET status = N'Tr?ng' WHERE id = @idTable2		
		
		IF (@isSecondTablEmty= 0)
			UPDATE dbo.TableFood SET status = N'Tr?ng' WHERE id = @idTable1
	END

	GO
	/****** Object:  Trigger [dbo].[UTG_UpdateBill]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	use QuanLyQuanCafe;

	GO
	CREATE TRIGGER [dbo].[UTG_UpdateBill]
	ON [dbo].[Bill] FOR UPDATE
	AS
	BEGIN
		DECLARE @idBill INT

		SELECT @idBill = id FROM Inserted

		DECLARE @idTable INT 

		SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill

		DECLARE @count INT =0
	
		SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0

		IF(@count=0)
			UPDATE dbo.TableFood SET status = N'Tr?ng' WHERE id = @idTable
	END
	GO
	select * from dbo.Bill;
	select * from dbo.BillInfo;
	select * from dbo.TableFood;
	/****** Object:  Trigger [dbo].[UTG_UpdateBillInfo]    Script Date: 17/01/2018 5:12:07 PM ******/
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	use QuanLyQuanCafe;
	drop trigger dbo.[UTG_UpdateBillInfo];
	GO

	create TRIGGER [dbo].[UTG_UpdateBillInfo]
	ON [dbo].[BillInfo] FOR INSERT, UPDATE
	AS 
	BEGIN
		DECLARE @idBill INT
		SELECT @idBill = idBill FROM Inserted
		DECLARE @idTable INT 
		SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0
	
		DECLARE @count INT 
		SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idBill

		IF(@count > 0)
		BEGIN
			UPDATE dbo.TableFood SET status = N'Có ng??i' WHERE id = @idTable
		END
		ELSE
		BEGIN
    		UPDATE dbo.TableFood SET status = N'Tr?ng' WHERE id = @idTable
		END
	
	END
	GO
	delete dbo.Bill;
	delete dbo.BillInfo;
	USE [master]
	GO
	ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
	GO
	select * from dbo.Bill;
	select * from dbo.BillInfo;
	update dbo.Bill set status = 0;
	use QuanLyQuanCafe;

	SELECT f.name,bi.count,f.price,f.price*bi.count AS totalPrice FROM dbo.Bill AS b, dbo.BillInfo AS bi,dbo.Food AS f WHERE b.id = bi.idBill AND bi.idFood = f.id --AND b.idTable = 56;

	select * from dbo.TableFood;
	UPDATE dbo.TableFood set status = N'Co nguoi' WHERE id in (1,2);
	UPDATE dbo.TableFood set status = N'Tr?ng';
	update dbo.Bill set status = 0;
	select * from Bill;
	delete dbo.Bill;
	delete dbo.BillInfo;
	select * from dbo.Account;
	SELECT * FROM dbo.FoodCategory
	select * from dbo.Food;
	select * from dbo.BillInfo;
	select * from dbo.Bill where idTable = 25 and status = 0;
	SELECT f.name,bi.count,f.price,f.price*bi.count AS totalPrice FROM dbo.Bill AS b, dbo.BillInfo AS bi,dbo.Food AS f WHERE b.id = bi.idBill AND bi.idFood = f.id AND b.idTable = 10;

	select * from dbo.TableFood;
	SELECT * FROM dbo.Bill WHERE status = 0 and idTable = 3;
	SELECT * FROM dbo.BillInfo WHERE idBill = 1;
	DELETE dbo.BillInfo WHERE id = 59;
	delete from dbo.TableFood where id = 1;
	select 