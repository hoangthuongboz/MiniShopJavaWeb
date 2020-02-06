CREATE DATABASE shop;
GO
USE shop;
GO
--DROP DATABASE shop;
--DROP TABLE Product;
--SELECT * FROM Products;
--drop table Categories;
--select * from Categories
--select * from Users;
GO
CREATE TABLE Categories
(
	CateId INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CateName NVARCHAR(64) NOT NULL,
	CateImage NVARCHAR(64) NULL,
	Display BIT NOT NULL
)
GO

CREATE TABLE Products
(
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CateId INT NOT NULL,
	Name NVARCHAR(128) NOT NULL,
	Price INT NOT NULL,
	Discount FLOAT,
	Information NVARCHAR(MAX) NULL,
	Description NVARCHAR(MAX) NOT NULL,
	Image NVARCHAR(128),
	Display BIT NOT NULL
)
GO
CREATE TABLE Users
(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	Phone NCHAR(10) NULL,
	Address NVARCHAR(50) NULL,
	Username VARCHAR(50) NOT NULL,
	Password VARCHAR(16) NOT NULL,
	RoleId INT NOT NULL,
	Lock BIT NOT NULL
)
GO
CREATE TABLE Carts
(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	UserId INT NOT NULL,
	BuyDate DATE,
	Name NVARCHAR(50),
	Phone NCHAR(10),
	Email NVARCHAR(50),
	Address NVARCHAR(150),
	Note NVARCHAR(150),
	Payment NVARCHAR(100),
	Status INT
)
CREATE TABLE CartItems(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Quantity INT NOT NULL,
	UnitPrice FLOAT NOT NULL,
	ProId INT NOT NULL,
	CartId INT NOT NULL
)
GO
SET IDENTITY_INSERT Categories ON;
INSERT INTO Categories (CateId, CateName, CateImage, Display) VALUES 
	(1, N'Freeze', N'images/category-image/freeze1.png', 1),
	(2, N'Cà phê', N'images/category-image/cafe1.png', 1),
	(3, N'Trà', N'images/category-image/tra1.png', 1),
	(4, N'Bánh mì',N'images/category-image/banhmi1.png', 1),
	(5, N'Khác',N'images/category-image/khac1.png', 1);
SET IDENTITY_INSERT Categories OFF;
GO
SET IDENTITY_INSERT Products ON;
INSERT INTO Products (Id, CateId, Name, Price, Discount, Image, Information,Description, Display) VALUES
	(1, 1, N'Phin Sữa Đá', 290000, 0.5, N'images/product-image/phin-sua-da.png', NULL, N'Hương vị cà phê Việt Nam đích thực! Từng hạt cà phê hảo hạng được chọn bằng tay, phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Cà phê được pha từ Phin truyền thống, hoà cùng sữa đặc sánh và thêm vào chút đá tạo nên ly Phin Sữa Đá – Đậm Đà Chất Phin.', 1),
	(2, 1, N'Phin Đen Đá', 290000, 0, N'images/product-image/phin-den-da.png', NULL, N'Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha hoàn toàn từ Phin, cho thêm 1 thìa đường, một ít đá viên mát lạnh, tạo nên Phin Đen Đá mang vị cà phê đậm đà chất Phin.', 1),
	(3, 1, N'Phin Đen Nóng', 290000, 0, N'images/product-image/phin-den-nong.png', NULL, N'Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha từ Phin, cho thêm 1 thìa đường, mang đến vị cà phê đậm đà chất Phin.', 1),
	(4, 1, N'Phin Sữa Nóng', 290000, 0, N'images/product-image/phin-sua-nong.png', NULL, N'Hương vị cà phê Việt Nam đích thực! Từng hạt cà phê hảo hạng được chọn bằng tay, phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Kết hợp với nước sôi từng giọt cà phê được chiết xuất từ Phin truyền thống, hoà cùng sữa đặc sánh tạo nên ly Phin Sữa Nóng – Đậm đà chất Phin.', 1),
	(5, 1, N'Mocha Macchiato', 590000, 0, N'images/product-image/mocha-macchiato.png', NULL, N'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà mang thương hiệu Highlands Coffee. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 1),
	(6, 1, N'Espresso', 440000, 0.3, N'images/product-image/espresso.png', NULL, N'Đích thực là ly cà phê espresso ngon đậm đà! Được chiết xuất một cách hoàn hảo từ loại cà phê rang được phối trộn độc đáo từ những hạt cà phê Robusta và Arabica chất lượng hảo hạng', 1),
	(7, 1, N'Americano', 440000, 0, N'images/product-image/americano.png', NULL, N'Americano tại Highlands Coffee là sự kết hợp giữa cà phê espresso thêm vào nước đun sôi. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 1),
	(8, 1, N'Latte', 540000, 50, N'images/product-image/latte.png', NULL, N'Ly cà phê sữa ngọt ngào đến khó quên! Với một chút nhẹ nhàng hơn so với Cappuccino, Latte của chúng tôi bắt đầu với cà phê espresso, sau đó thêm sữa tươi và bọt sữa một cách đầy nghệ thuật. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.', 1),
	(9, 2, N'Caramel Phin Freeze', 490000, 0, N'images/product-image/caramel-phin-freeze.png', NULL, N'Thơm ngon khó cưỡng! Được kết hợp từ cà phê truyền thống chỉ có tại Highlands Coffee, cùng với caramel, thạch cà phê và đá xay mát lạnh. Trên cùng là lớp kem tươi thơm béo và caramel ngọt ngào. Món nước phù hợp trong những cuộc gặp gỡ bạn bè, bởi sự ngọt ngào thường mang mọi người xích lại gần nhau. ',1),
	(10, 2, N'Classic Phin Freeze', 490000, 0, N'images/product-image/classic-phin-freeze.png', NULL, N'Thơm ngon đậm đà! Được kết hợp từ cà phê pha Phin truyền thống chỉ có tại Highlands Coffee, cùng với thạch cà phê và đá xay mát lạnh. Trên cùng là lớp kem tươi thơm béo và bột ca cao đậm đà. Món nước hoàn hảo để khởi đầu câu chuyện cùng bạn bè.',1),
	(11, 2, N'Freeze Trà Xanh', 490000, 0.4, N'images/product-image/freeze-tra-xanh.png', NULL, N'Thức uống rất được ưa chuộng! Trà xanh thượng hạng từ cao nguyên Việt Nam, kết hợp cùng đá xay, thạch trà dai dai, thơm ngon và một lớp kem dày phủ lên trên vô cùng hấp dẫn. Freeze Trà Xanh thơm ngon, mát lạnh, chinh phục bất cứ ai!', 1),
	(12, 2, N'Cookies & Cream', 490000, 0, N'images/product-image/cookies-cream.png', NULL, N'Một thức uống ngon lạ miệng bởi sự kết hợp hoàn hảo giữa cookies sô cô la giòn xốp cùng hỗn hợp sữa tươi cùng sữa đặc đem say với đá viên, và cuối cùng không thể thiếu được chính là lớp kem whip mềm mịn cùng cookies sô cô la say nhuyễn.', 1),
	(13, 2, N'Freeze Sô-cô-la', 490000, 0, N'images/product-image/freeze-socola.png', NULL, N'Thiên đường đá xay sô cô la! Từ những thanh sô cô la Việt Nam chất lượng được đem xay với đá cho đến khi mềm mịn, sau đó thêm vào thạch sô cô la dai giòn, ở trên được phủ một lớp kem whip beo béo và sốt sô cô la ngọt ngào. Tạo thành Freeze Sô-cô-la ngon mê mẩn chinh phục bất kì ai!', 1),
	(14, 3, N'Trà Sen Vàng', 390000, 0, N'images/product-image/tra-sen-vang.png', NULL, N'Thức uống chinh phục những thực khách khó tính! Sự kết hợp độc đáo giữa trà Ô long, hạt sen thơm bùi và củ năng giòn tan. Thêm vào chút sữa sẽ để vị thêm ngọt ngào.', 1),
	(15, 3, N'Trà Thạch Vải', 39000, 0, N'images/product-image/tra-thach-vai.png', NULL, N'Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch vàng giòn béo, mang đến thức uống tuyệt hảo!', 1),
	(16, 3, N'Trà Thạch Đào', 39000, 0.1, N'images/product-image/tra-thach-dao.png', NULL, N'Vị trà đậm đà kết hợp cùng những miếng đào thơm ngon mọng nước cùng thạch đào giòn dai. Thêm vào ít sữa để gia tăng vị béo.', 1),
	(17, 3, N'Trà Thanh Đào', 39000, 0, N'images/product-image/tra-thanh-dao.png', NULL, N'Một trải nghiệm thú vị khác! Sự hài hòa giữa vị trà cao cấp, vị sả thanh mát và những miếng đào thơm ngon mọng nước sẽ mang đến cho bạn một thức uống tuyệt vời.', 1),
	(18, 4, N'Thịt nướng', 19000, 0, N'images/product-image/thit-nuong.png', NULL, N'Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.', 1),
	(19, 4, N'Xíu mại', 19000, 0, N'images/product-image/xiu-mai.png', NULL, N'Bánh mì Việt Nam giòn thơm, với nhân thịt viên hấp dẫn, phủ thêm một lớp nước sốt cà chua ngọt, cùng với rau tươi và gia vị đậm đà.', 1),
	(20, 4, N'Gà Xé Nước Tương', 19000, 0, N'images/product-image/ga-xe-nuoc-tuong.png', NULL, N'Bánh mì Việt Nam giòn thơm với nhân gà xé, rau, gia vị hòa quyện cùng nước sốt đặc biệt.', 1),
	(21, 4, N'Chả lụa xá xíu', 19000, 0, N'images/product-image/cha-lua-xa-xiu.png', NULL, N'Bánh mì Việt Nam giòn thơm với chả lụa và thịt xá xíu thơm ngon, kết hợp cùng rau và gia vị, hòa quyện cùng nước sốt độc đáo.', 1),
	(22, 5, N'Bánh Mousse Cacao', 29000, 0, N'images/product-image/banh-mousse-cacao.png', NULL, N'Bánh Mousse Ca Cao, là sự kết hợp giữa ca-cao Việt Nam đậm đà cùng kem tươi.', 1),
	(23, 5, N'Bánh Sô-cô-la Highlands', 29000, 0, N'images/product-image/banh-socola-highlands.png', NULL, N'Một chiếc bánh độc đáo! Sô cô la ngọt ngào và kem tươi béo ngậy, được phủ thêm một lớp sô cô la mỏng bên trên cho thêm phần hấp dẫn.', 1),
	(24, 5, N'Bánh Caramel Phô Mai', 29000, 0, N'images/product-image/banh-caramel-pho-mai.jpg', NULL, N'Ngon khó cưỡng! Bánh phô mai thơm béo được phủ bằng lớp caramel ngọt ngào', 1),
	(25, 5, N'Bánh Mousse Đào', 29000, 0, N'images/product-image/banh-mousse-dao.png', NULL, N'Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.', 1);
SET IDENTITY_INSERT Products OFF;
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
INSERT [dbo].[CartItems] ([Id], [Quantity], [UnitPrice], [ProId], [CartId]) VALUES (43, 1, 29000, 24, 1)
INSERT [dbo].[CartItems] ([Id], [Quantity], [UnitPrice], [ProId], [CartId]) VALUES (44, 1, 290000, 2, 2)
INSERT [dbo].[CartItems] ([Id], [Quantity], [UnitPrice], [ProId], [CartId]) VALUES (45, 2, 580000, 1, 2)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 
INSERT [dbo].[Carts] ([Id], [UserId], [BuyDate], [Name], [Phone], [Email], [Address], [Note], [Payment], [Status]) VALUES (1, 2, CAST(N'2019-09-21' AS Date), N'thuong', N'0372704074', N'thuong@gmail.com', N'97, Man Thiện, P.Hiệp Phú, Quận9', N'Khách Vip', N'COD', 0)
INSERT [dbo].[Carts] ([Id], [UserId], [BuyDate], [Name], [Phone], [Email], [Address], [Note], [Payment], [Status]) VALUES (2, 3, CAST(N'2019-10-21' AS Date), N'lep', N'0372704074', N'lep@gmail.com', N'97, Man Thiện, P.Hiệp Phú, Quận9', N'giao buổi sáng', N'COD', 0)
INSERT [dbo].[Carts] ([Id], [UserId], [BuyDate], [Name], [Phone], [Email], [Address], [Note], [Payment], [Status]) VALUES (3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Carts] ([Id], [UserId], [BuyDate], [Name], [Phone], [Email], [Address], [Note], [Payment], [Status]) VALUES (4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Carts] OFF
--select * from Users;
select * from Carts;
select * from CartItems;
SET IDENTITY_INSERT [dbo].[Users] ON 
INSERT [dbo].[Users] ([Id], [Name], [Email], [Phone], [Address], [Username], [Password], [RoleId], [Lock]) VALUES (1, N'admin', N'admin@gmail.com', N'0372704074', N'97, Man Thiện, Q9', N'admin', N'123', 1, 0)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Phone], [Address], [Username], [Password], [RoleId], [Lock]) VALUES (2, N'Thuong', N'thuong@gmail.com', N'0372704074', N'97, Man Thiện, P.Hiệp Phú, Quận 9', N'thuong', N'123', 0, 0)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Phone], [Address], [Username], [Password], [RoleId], [Lock]) VALUES (3, N'lep', N'lep@gmail.com', N'0372704074', N'97, Man Thiện, P.Hiệp Phú, Quận 9', N'lep', N'123', 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK__CartItems__CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK__CartItems__CartId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK__CartItems__ProId] FOREIGN KEY([ProId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK__CartItems__ProId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK__Carts__UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK__Carts__UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__CateId] FOREIGN KEY([CateId])
REFERENCES [dbo].[Categories] ([CateId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__CateId]
GO
--select * from Users
--select * from Carts where Carts.UserId=2;