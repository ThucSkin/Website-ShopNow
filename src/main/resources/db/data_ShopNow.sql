USE [WebShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Image] [varchar](255) NULL,
	[Address] [nvarchar](100) NULL,
	[TelePhone] [char](10) NULL,
	[Reset_password] [varchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NULL,
 CONSTRAINT [PK_Authorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductId] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FeedBacks_1] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NULL,
	[Discription] [nvarchar](100) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[CreateDay] [date] NOT NULL,
	[TelePhone] [varchar](12) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](30) NULL,
	[Total] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NULL,
	[Image1] [varchar](50) NOT NULL,
	[Image2] [varchar](50) NULL,
	[Image3] [varchar](50) NULL,
	[Image4] [varchar](50) NULL,
	[Image5] [varchar](50) NULL,
	[EnteredDay] [date] NOT NULL,
	[Discription] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[HotSale] [varchar](20) NULL,
	[OldPrice] [int] NULL,
	[TheFirm] [nvarchar](20) NULL,
	[RAM] [varchar](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statitic]    Script Date: 3/30/2023 9:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statitic](
	[OrderId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[id] [int] NULL,
	[slDoanhthu] [bigint] NOT NULL,
	[slOrder] [bigint] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Admin', N'123', N'Thức Admin', N'thucAdmin@gmail.com', N'f38b98e1c562343c6d73.jpg', N'50 Nguyễn Thị Thập, Hòa Minh, Liên Chiểu, Đà Nẵng.', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ba', N'567890', N'Lý Thành An', N'tonthuhuyen581@hotmail.com', N'Screenshot 2022-12-05 111914.png', N'Xã Lãng Ngâm, Huyện Gia Bình, Bắc Ninh.', N'0798473625', N'ErIhQsMUnp1IT0B7Lxj2qDkf8lQ4oiOXR0QCzwL4G52NwX0J9C')
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ca', N'34567', N'Nguyễn Thị Tú Cẩm', N'hnianhunga560@hotmail.com', N'Screenshot 2022-12-05 111945.png', N'Xã Long Cốc, Huyện Tân Sơn, Phú Thọ', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Can', N'567890', N'Chu Thị Vỹ Lan', N'chuvylan546@yahoo.com', N'e11.jpg', N'Phường Tân An, Quận Ninh Kiều, Cần Thơ', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'demo', N'123', N'Nguyễn Công Viên', N'congvien.01@gmail.com', N'LogoShopNow.png', N'60 Ngô Thị Nhậm, Hòa Minh, Đà Nẵng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'demo3', N'123123', N'Huỳnh Thị Như', N'nhuyeukhangno1@gmail.com', N'e12.jpg', N'Xã Thanh Sơn, Huyện Kim Bảng, Hà Nam', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'director', N'123123', N'Nguyễn Văn Thức', N'thucfc2002@gmail.com', N'c89e299133bdc3e39aac.jpg', N'25 Ngô Sĩ Liên, Hòa Minh, Liên Chiểu, Đà Nẵng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ha', N'123', N'Bành Thị Thu Hà', N'ngocmongvy346@gmail.com', N'Screenshot 2022-12-05 111850.png', N'Xã Ba Cụm Nam, Huyện Khánh Sơn, Khánh Hòa', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Hai', N'123', N'Lý Thị Hải Như', N'deothuviet949@facebook.com', N'Screenshot 2022-12-05 112000.png', N'Xã Gio Việt, Huyện Gio Linh, Quảng Trị', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Hi', N'4567890', N'Lý Văn Hoán Tư', N'nghiemthaovan641@facebook.com', N'Screenshot 2022-12-05 112046.png', N'Xã Ngọc Linh, Huyện Vị Xuyên, Hà Giang', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Hoan', N'234', N'Lý Văn Công Hoàn', N'aovietson265@facebook.com', N'Screenshot 2022-12-05 112126.png', N'Xã Tân Thới, Huyện Tân Phú Đông, Tiền Giang', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Hoang', N'3245678', N'Dương Thị Thu Cầm', N'hoaphihai961@icloud.com', N'Screenshot 2022-12-05 112113.png', N'Xã Tân Phước, Huyện Tân Thành, Bà Rịa - Vũng Tàu', N'0394763912', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Huy', N'123', N'Lê Văn Huy', N'danggiangthanh771@google.com', N'noimage.jpg', N'Xã Phương Khoan, Huyện Sông Lô, Vĩnh Phúc', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Huyn', N'e45678970', N'Huyn La', N'khieutruongthanh141@gmail.com', N'Screenshot 2022-12-05 112034.png', N'Xã Pom Lót, Huyện Điện Biên, Điện Biên', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Khang', N'123', N'Lý Thường Khang', N'ungthuynhu76@hotmail.com', N'Screenshot 2022-12-05 112137.png', N'Xã Nhơn Mỹ, Thị xã An Nhơn, Bình Định', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ky', N'123123', N'Lý Nhã Kỳ', N'diemlechi468@microsoft.com', N'Screenshot 2022-12-05 112024.png', N'Phường Tiên Cát, Thành phố Việt Trì, Phú Thọ', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Lan', N'123', N'Ninh Duong Lan ', N'leuvietnga606@naver.com', N'Screenshot 2022-12-05 111850.png', N'Xã An Hải, Huyện Lý Sơn, Quảng Ngãi', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Lay', N'4567890', N'Hồ Viết Khang', N'vuthanhphong168@gmail.com', N'noimage.jpg', N'Xã Rô Men, Huyện Đam Rông, Lâm Đồng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'linh', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'linh6ch', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Luc', N'e567890', N'LucTieuKy', N'laviethai0@facebook.com', N'Screenshot 2022-12-05 112046.png', N'Phường Lãm Hà, Quận Kiến An, Hải Phòng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Luoc', N'34567890', N'Lược Văn Cảnh', N'phihaivan687@yahoo.com', N'Screenshot 2022-12-05 112000.png', N'Xã An Thanh, Huyện Quỳnh Phụ, Thái Bình', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ly', N'123', N'Ho Ly', N'lenhanhong446@google.com', N'Screenshot 2022-12-05 112059.png', N'Xã Tân Mỹ, Thành phố Bắc Giang, Bắc Giang', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ma', N'456789', N'Ma Thị Hoa', N'giapthanhnga737@gmail.com', N'noimage.jpg', N'Phường Hiệp Thành, Thị xã Ngã Bảy, Hậu Giang', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Manh', N'456789', N'Manh Duc Cuong', N'leunhathung307@microsoft.com', N'noimage.jpg', N'Xã Thanh Sơn, Huyện Kim Bảng, Hà Nam', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Mi', N'456789', N'LaMiDo', N'diepuctai144@google.com', N'noimage.jpg', N'Xã Ngọc Đường, Thành phố Hà Giang, Hà Giang', N'0358453271', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Mip', N'45678', N'Minh Mip', N'ungtamhang472@gmail.com', N'noimage.jpg', N'Xã Hưng Phú, Huyện Phước Long, Bạc Liêu', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Mit', N'1234', N'Mu Mit Toi Tam', N'xakimngan677@microsoft.com', N'noimage.jpg', N'Phường Ngọc Hà, Thành phố Hà Giang, Hà Giang', N'0783460158', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Na', N'4567890', N'Tra Bong Na', N'trinhxuanhieu204@microsoft.com', N'noimage.jpg', N'Xã Trà Giang, Huyện Trà Bồng, Quảng Ngãi', N'0834983571', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Nhanh', N'123', N'Nhanh Nhanh Len', N'quananhao580@naver.com', N'noimage.jpg', N'Phường Hòa Thọ Tây, Quận Cẩm Lệ, Đà Nẵng', N'0843062958', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ni', N'2345678', N'Ni Co Lat Cau', N'doanlinhphuong427@naver.com', N'noimage.jpg', N'Xã Thượng Long, Huyện Yên Lập, Phú Thọ', N'0768362045', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ninh', N'67890-', N'Minh Tieu Ha', N'cabichhai812@icloud.com', N'noimage.jpg', N'Xã Nâm N''Jang, Huyện Đắk Song, Đắc Nông', N'0914178509', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Oi', N'4567890', N'Ly Ly Đáng Yêu', N'tonthattuankhanh378@facebook.com', N'noimage.jpg', N'Xã Tam Hiệp, Huyện Phúc Thọ, Hà Nội', N'0385743268', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Pho', N't6666666', N'Giang A Pho', N'biminhloan91@microsoft.com', N'noimage.jpg', N'Xã Thanh Hải, Huyện Ninh Hải, Ninh Thuận', N'0329268457', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Phu', N'22222', N'Phu Le', N'trinhhaphuong315@google.com', N'noimage.jpg', N'Xã Yên Lỗ, Huyện Bình Gia, Lạng Sơn', N'0813714695', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Phung', N'67890-', N'Cung Phung', N'giangthanhao29@google.com', N'noimage.jpg', N'Phường 2, Thành phố Tuy Hoà, Phú Yên', N'0779734521', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'qqww', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'f3.jpg', N'123 nguyen thi thap2', N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Qui', N'12345678', N'Ho Qui Kong Ly', N'tonguyetha291@yahoo.com', N'noimage.jpg', N'Xã An Phú, Huyện Lục Yên, Yên Bái', N'0337451390', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Quynh', N'123', N'Ly Thi Quynh', N'Qunhh@gmail.com', N'noimage.jpg', N'Xã Nghĩa Hà, Thành phố Quảng Ngãi, Quảng Ngãi', N'0852360194', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ri', N'24546578', N'Ca Ri', N'machyenthanh421@google.com', N'noimage.jpg', N'Xã Cam Lập, Thành phố Cam Ranh, Khánh Hòa', N'0365780136', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Rin', N'67890-', N'Rin Rin Kuout', N'xaquynhthanh140@facebook.com', N'noimage.jpg', N'Xã Độc Lập, Huyện Quảng Uyên, Cao Bằng', N'0857584139', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'staff', N'123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'f3.jpg', N'Phường Trần Hưng Đạo, Thành phố Hải Dương, Hải Dương', N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Su', N'600000', N'Xã Ia Din Su', N'sonkieuminh11@facebook.com', N'noimage.jpg', N'Xã Ia Din, Huyện Đức Cơ, Gia Lai', N'0975398617', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'T1', N'123123', N'Nguyễn Văn Thức', N'thucnvpd05369@fpt.edu.vn', N'6a26e19d85b175ef2ca0.jpg', N'21 Phú Thạnh 1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'0999999977', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'T2', N'123', N'Thuc Skin', N'thucbadao@gmail.com', N'noimage.jpg', N'Xã Quảng Hoà, Huyện Đăk Glong, Đắc Nông', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'T3', N'123', N'Hồ Văn ý', N't3@gmail.com', N'noimage.jpg', N'Xã Nhơn Sơn, Huyện Ninh Sơn, Ninh Thuận', N'0798473625', N'nOdxdkjVnrhpllvpwJhrz20hUQDVn5t05tGkK5zjrdQQO12hir')
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ta', N'456789', N'Ta Day La Vo Dich', N'nhuhuyha870@yahoo.com', N'noimage.jpg', N'Xã Hồng Châu, Huyện Yên Lạc, Vĩnh Phúc', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Tan', N'r42386', N'Lâm Đồng Tân', N'khuuhongthuy464@gmail.com', N'noimage.jpg', N'Xã Nam Ninh, Huyện Cát Tiên, Lâm Đồng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Thai', N'5dd3123', N'Tuần Giáo Thái', N'phinhathanh844@yahoo.com', N'noimage.jpg', N'Xã Pú Nhung, Huyện Tuần Giáo, Điện Biên', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Thinh', N'123', N'Lai Châu', N'vienthuyen819@icloud.com', N'noimage.jpg', N'Xã Nậm Khao, Huyện Mường Tè, Lai Châu', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Thuc', N'123', N'Thức Skin', N'thucfc2002@gmail.com', N'Screenshot 2022-12-05 112034.png', N'21 Phú Thanh1, Hòa Minh, Liên Chiểu, Đà Nẵng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'thuc1', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Thuc11', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'thuc123', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'ThucSkin', N'123', N'Thức Skin', N'thucfc2002@gmail.com', N'c89e299133bdc3e39aac.jpg', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Ti', N'123', N'Trần Văn Tí', N'ti452@microsoft.com', N'1.png', N'Xã Hưng Phú, Huyện Phước Long, Bạc Liêu', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Tim', N't555555', N'Tim Tim Xanh Xanh', N'himyhiep907@naver.com', N'noimage.jpg', N'Xã Suối Trai, Huyện Sơn Hòa, Phú Yên', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'TramAnh', N'123', N'Trâm Anh', N'tramanh002@gmail.com', N'cay-cau-noi.jpg', N'Xã Yên Lỗ, Huyện Bình Gia, Lạng Sơn', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'tt', N'123123', N'Nguyễn Công Kiên', N'congvien.0123@gmail.com', N'noimage.jpg', N'Lý Thường Kiệt, An Phú, Hòa Tân', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'TTTT', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'TTTTT', N'123123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'noimage.jpg', NULL, N'0969794458', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Tung', N'1342567687', N'Nghiem ThanhTTung', N'lothienngon447@yahoo.com', N'noimage.jpg', N'Xã Thanh Sơn, Huyện Kim Bảng, Hà Nam', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'user', N'123', N'Facebook', N'thucfc2002@gmail.com', N'Screenshot 2022-12-05 112208.png', N'Xã Tam Hiệp, Huyện Phúc Thọ, Hà Nội', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Uyen', N'123', N'Nguyen Hai Uyen', N'UyenNC@gmail.com', N'noimage.jpg', N'Lý Thường Kiệt, An Phú, Hòa Tân', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Va', N'3245678', N'Va Cham', N'tiephuukhang981@naver.com', N'noimage.jpg', N'Xã Quảng Hoà, Huyện Đăk Glong, Đắc Nông', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Yasuo', N'123123', N'Yasuo', N'thucfc2002@gmail.com', N'Screenshot 2022-12-05 111850.png', N'123 nguyen thi thap', N'0969794458', NULL)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (148, N'Admin', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (95, N'demo', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (104, N'Khang', N'CUST')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (143, N'T1', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (96, N'ThucSkin', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (112, N'Ti', N'STAF')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (141, N'Yasuo', N'DIRE')
GO
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Điện thoại')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (3, N'Lap top')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (4, N'Ipad')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (5, N'Đồng hồ')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (8, N'Phụ kiện')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2005, N'Máy tính bàn')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (109, N'T1', 22, N'Sản phẩm chất lương')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (110, N'T1', 2019, N'Điện thoại đẹp, giá hợp lý')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (111, N'T1', 14, N'Cấu hình mạnh ')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (112, N'Admin', 14, N'Rẻ, xịn, chơi game không lag')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (115, N'Yasuo', 9, N'ok 👍👌👌👌')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (117, N'T1', 9, N'ok')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (118, N'ThucSkin', 2091, N'Cấu hình mạnh, chơi game ok 👌👌👌')
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 
GO
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (31, N'user', 10)
GO
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (32, N'Thuc', 2060)
GO
INSERT [dbo].[Favorites] ([FavoriteId], [Username], [ProductId]) VALUES (33, N'user', 2019)
GO
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBacks] ON 
GO
INSERT [dbo].[FeedBacks] ([FeedBackId], [Description], [Username]) VALUES (30, N'web lag', N'Admin')
GO
INSERT [dbo].[FeedBacks] ([FeedBackId], [Description], [Username]) VALUES (33, N'Giao hàng chậm vl', N'Admin')
GO
INSERT [dbo].[FeedBacks] ([FeedBackId], [Description], [Username]) VALUES (34, N'Giao hàng nhanh, hàng chất lượng 👍👍👍', N'T1')
GO
INSERT [dbo].[FeedBacks] ([FeedBackId], [Description], [Username]) VALUES (35, N'ok 💕💕', N'Yasuo')
GO
INSERT [dbo].[FeedBacks] ([FeedBackId], [Description], [Username]) VALUES (36, N'Giao hang` nhanh 👍👍👍💖', N'ThucSkin')
GO
SET IDENTITY_INSERT [dbo].[FeedBacks] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (19, 19, 2034, 5000000, 10, 1, N'Duyệt', 12022000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (20, 20, 2035, 2300000, 10, 2, N'Duyệt', 25382000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (21, 21, 2036, 4500000, 10, 1, N'Duyệt', 19972500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (23, 23, 2038, 3000000, 10, 2, N'Duyệt', 13643000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (25, 25, 2040, 5300000, 10, 1, N'Duyệt', 21861000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (26, 26, 2041, 5100000, 10, 1, N'Duyệt', 25191000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (27, 27, 2042, 900000, 10, 1, N'Duyệt', 21771000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (28, 28, 2043, 2500000, 10, 2, N'Duyệt', 18792000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (30, 30, 2045, 2000000, 10, 1, N'Duyệt', 8631000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (32, 32, 2047, 5000000, 10, 1, N'Duyệt', 3591000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (33, 33, 2048, 1000000, 10, 1, N'Duyệt', 3992000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (34, 34, 2049, 2000000, 10, 1, N'Duyệt', 12990000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (35, 35, 2050, 3000000, 10, 2, N'Duyệt', 4491000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (36, 36, 2051, 4000000, 10, 1, N'Duyệt', 18891000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (37, 37, 2052, 3400000, 10, 2, N'Duyệt', 3192000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (39, 39, 2054, 1100000, 10, 1, N'Duyệt', 25194000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (40, 40, 2055, 1200000, 10, 2, N'Duyệt', 25193000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (41, 41, 2056, 1300000, 10, 1, N'Duyệt', 17574000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (42, 42, 2057, 1400000, 10, 2, N'Duyệt', 18441000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (43, 43, 2058, 2100000, 10, 3, N'Duyệt', 1374300)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (44, 44, 2059, 2300000, 10, 1, N'Duyệt', 1972000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (45, 45, 2060, 2400000, 10, 2, N'Duyệt', 1103700)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (46, 46, 2061, 3200000, 10, 1, N'Duyệt', 1998000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (47, 47, 2062, 1200000, 10, 2, N'Duyệt', 234400)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (48, 48, 2063, 1800000, 10, 3, N'Duyệt', 926100)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (49, 49, 2064, 4100000, 10, 1, N'Duyệt', 769500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (121, 147, 2079, 1060000, 10, 1, N'Duyệt', 954000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (122, 147, 2028, 25990000, 15, 1, N'Duyệt', 22091500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (123, 147, 2020, 4990000, 15, 1, N'Duyệt', 4241500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (124, 148, 2079, 1060000, 10, 4, N'Duyệt', 3816000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (125, 148, 2025, 25990000, 25, 1, N'Duyệt', 19492500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (144, 166, 2063, 1029000, 10, 1, N'Duyệt', 926100)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (145, 166, 2064, 855000, 10, 1, N'Duyệt', 769500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (146, 167, 2025, 25990000, 25, 1, N'Duyệt', 19492500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (149, 172, 2077, 970000, 20, 1, N'Duyệt', 776000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (150, 173, 2081, 21490000, 20, 1, N'Duyệt', 17192000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (155, 180, 2058, 1527000, 10, 1, N'Duyệt', 1374300)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (156, 181, 8, 10790000, 15, 3, N'Duyệt', 27514500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (157, 181, 9, 36290000, 25, 1, N'Duyệt', 27217500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (158, 182, 4, 4990000, 20, 1, N'Duyệt', 3992000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (159, 183, 10, 19990000, 10, 1, N'Duyệt', 17991000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (160, 183, 9, 36290000, 25, 2, N'Duyệt', 54435000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (161, 184, 8, 10790000, 15, 3, N'Duyệt', 27514500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (162, 184, 10, 19990000, 10, 3, N'Duyệt', 53973000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (163, 184, 9, 36290000, 25, 4, N'Duyệt', 108870000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (164, 184, 14, 43590000, 15, 2, N'Duyệt', 74103000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (165, 184, 4, 4990000, 20, 1, N'Duyệt', 3992000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (166, 184, 2020, 4990000, 15, 2, N'Duyệt', 8483000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (167, 184, 2019, 2990000, 30, 1, N'Duyệt', 2093000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (168, 184, 2016, 25990000, 30, 1, N'Duyệt', 18193000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (169, 185, 9, 36290000, 25, 1, N'Duyệt', 27217500)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (170, 185, 10, 19990000, 10, 1, N'Duyệt', 17991000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (171, 186, 2118, 11399000, 15, 1, N'Duyệt', 9689150)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (19, N'Hoan', CAST(N'2022-11-04' AS Date), N'0969794458', N'1020 Nguyễn Tất Thành, Phường Thanh Khê Đông, Thanh Khê, Tp Đà NẴng', N'Công Hoàn', N'hoan2002@gmail.com', 4530000, N'Đang vận chuyển')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (20, N'Phu', CAST(N'2022-08-04' AS Date), N'0969794458', N'44 Trần Cung, Phường Nghĩa Tân, Quận Cầu Giấy, Hà Nội', N'Nguyen Ba Phu', N'thucfc2002@gmail.com', 4170000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (21, N'Na', CAST(N'2022-09-11' AS Date), N'0969794458', N'33 Thi Sách, Phường Hòa Thuận Tây, Quận Hòa Thuận Tây, Đà Nẵng', N'Li Na', N'linacfc2002@gmail.com', 4080000, N'Đang giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (23, N'Ni', CAST(N'2022-08-02' AS Date), N'0969794458', N'120 Bạch Mai, Phường 5, Quận Gò Vấp, Hồ Chí Minh', N'Ni Cô', N'nico@gmail.com', 5430000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (25, N'Ca', CAST(N'2022-02-07' AS Date), N'0969794458', N'51 Văn Cao, Phường Liễu Giai, Quận Ba Đình, Hà Nội', N'Ca Ca', N'cacafc2002@gmail.com', 4800000, N'Đã hủy')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (26, N'Mit', CAST(N'2022-11-06' AS Date), N'0969794458', N'81 Vũ Chí Thắng , Phường Nghĩa Xá, Quận Lê Chân, Hải Phòng', N'mit', N'thucfc2002@gmail.com', 4620000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (27, N'Oi', CAST(N'2022-12-11' AS Date), N'0969794458', N'12 Phan Tứ, Phường Mỹ An , Quận Sơn Trà, Đà Nẵng', N'Oi leee', N'thucfc2002@gmail.com', 840000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (28, N'Luoc', CAST(N'2022-10-10' AS Date), N'0969794458', N'256 Lương Hữu Khánh, Phường Phạm Ngũ Lão, Quận 1, Hồ Chí Minh', N'Luoc Luoc', N'thucfc2002@gmail.com', 4530000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (30, N'Qui', CAST(N'2022-11-04' AS Date), N'0969794458', N'35 Ngự Bình , An Cựu, Quận Thành phố Huế, Huế', N'Qui Bùi', N'thucfc2002@gmail.com', 1830000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (32, N'Hi', CAST(N'2022-12-06' AS Date), N'0969794458', N'101 Đồng Văn Cống, Phường An Thới, Quận Bình Thủy, Cần Thơ', N'Hi ', N'thucfc2002@gmail.com', 4530000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (33, N'Mi', CAST(N'2022-01-01' AS Date), N'0969794458', N'12 Duy Tân, Phường Thuận Đông , Quận Hải Châu, Đà Nẵng', N'Nguyen Thuc', N'thucfc2002@gmail.com', 930000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (34, N'Va', CAST(N'2022-02-10' AS Date), N'0969794458', N'40 Tây Thạnh, Phường Tây Thạnh, Quận Tân Phú, Hồ Chí Minh', N'Nguyen Thuc', N'thucfc2002@gmail.com', 1830000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (35, N'Lay', CAST(N'2022-04-04' AS Date), N'0969794458', N'32 Ba Vì, Phường 15, Quận Phú Nhuận, Hồ Chí Minh', N'Nguyen Thuc', N'thucfc2002@gmail.com', 5430000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (36, N'ba', CAST(N'2022-12-29' AS Date), N'0969794458', N'220 Bùi Thị Xuân, Phạm Ngũ Lão , Quận 1, Hồ Chí Minh', N'Nguyen Thuc', N'thucfc2002@gmail.com', 3630000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (37, N'ma', CAST(N'2022-08-01' AS Date), N'0969794458', N'189 Lý Nam Đế, Phường Hàng Mã, Quận Hoàn Kiếm, Hà Nội', N'Nguyen Thuc', N'thucfc2002@gmail.com', 6150000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (39, N'Phung', CAST(N'2022-08-14' AS Date), N'0969794458', N'40 Trần Cung, Phường Nghĩa Tân, Quận Cầu Giấy, Hà Nội', N'Nguyen Thuc', N'thucfc2002@gmail.com', 1020000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (40, N'Nhanh', CAST(N'2022-09-11' AS Date), N'0969794458', N'30 Thi Sách, Phường Hòa Thuận Tây, Quận Hòa Thuận Tây, Đà Nẵng', N'Nguyen Thuc', N'thucfc2002@gmail.com', 2190000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (41, N'Manh', CAST(N'2022-02-10' AS Date), N'0969794458', N'181 Ngô Văn Sở, Phường Hòa Minh, Liên Chiểu, TP Đà Nẵng', N'Nguyen Thuc', N'thucfc2002@gmail.com', 1200000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (42, N'Ninh', CAST(N'2022-08-02' AS Date), N'0969794458', N'110 Bạch Mai, Phường 5, Quận Gò Vấp, Hồ Chí Minh', N'Nguyen Thuc', N'thucfc2002@gmail.com', 2550000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (43, N'Rin', CAST(N'2022-12-19' AS Date), N'0969794458', N'65 Ngọc Hà, Phường Ngọc Hà , Quận Ba Đình, Hà Nội', N'Nguyen Thuc', N'thucfc2002@gmail.com', 5770000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (44, N'Can', CAST(N'2022-01-07' AS Date), N'0969794458', N'50 Văn Cao, Phường Liễu Giai, Quận Ba Đình, Hà Nội', N'Nguyen Thuc', N'thucfc2002@gmail.com', 2100000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (45, N'Mip', CAST(N'2022-12-06' AS Date), N'0969794458', N'80 Vũ Chí Thắng , Phường Nghĩa Xá, Quận Lê Chân, Hải Phòng', N'Nguyen Thuc', N'thucfc2002@gmail.com', 4350000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (46, N'Huyn', CAST(N'2022-12-11' AS Date), N'0969794458', N'120 Phan Tứ, Phường Mỹ An , Quận Sơn Trà, Đà Nẵng', N'Nguyen Thuc', N'thucfc2002@gmail.com', 2910000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (47, N'Luc', CAST(N'2022-10-10' AS Date), N'0969794458', N'26 Lương Hữu Khánh, Phường Phạm Ngũ Lão, Quận 1, Hồ Chí Minh', N'Nguyen Thuc', N'thucfc2002@gmail.com', 2190000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (48, N'ky', CAST(N'2022-09-02' AS Date), N'0969794458', N'125 Bạch Đằng , Thượng Lý, Quận Hồng Bàng, Hải Phòng', N'Nguyen Thuc', N'thucfc2002@gmail.com', 4890000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (49, N'Tung', CAST(N'2022-11-04' AS Date), N'0969794458', N'350 Ngự Bình , An Cựu, Quận Thành phố Huế, Huế', N'Nguyen Thuc', N'thucfc2002@gmail.com', 3720000, N'Đang vận chuyển')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (147, N'T1', CAST(N'2023-01-01' AS Date), N'0944444444', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'Thuc Skin', N'thucfc2002@gmail.com', 27317000, N'Đã hủy')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (148, N'T1', CAST(N'2023-01-01' AS Date), N'0944444444', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'Thuc Skin', N'thucfc2002@gmail.com', 23338500, N'Đã hủy')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (166, N'T1', CAST(N'2023-01-04' AS Date), N'0944444444', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'Thuc Skin', N'thucfc2002@gmail.com', 1725600, N'Đã hủy')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (167, N'T1', CAST(N'2023-01-08' AS Date), N'0944444444', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'Thuc Skin', N'thucfc2002@gmail.com', 19522500, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (172, N'T1', CAST(N'2023-01-08' AS Date), N'0944444444', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'Thức Skin', N'thucfc2002@gmail.com', 806000, N'Đã giao hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (173, N'T1', CAST(N'2023-01-10' AS Date), N'0999999999', N'21 Phú Thạnh1, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'thuc', N'thucfc2002@gmail.com', 17222000, N'Đang chờ xác nhận')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (180, N'T1', CAST(N'2023-02-07' AS Date), N'0954444444', N'21 abc', N'thuc', N'thucfc2002@gmail.com', 1404300, N'Đang chờ xác nhận')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (181, N'T1', CAST(N'2023-02-07' AS Date), N'0944444444', N'abc', N'thuc', N'thucfc2002@gmail.com', 54762000, N'Đang chờ xác nhận')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (182, N'demo', CAST(N'2023-02-09' AS Date), N'0222222222', N'asd', N'thuc', N'thucfc2002@gmail.com', 4022000, N'Đang chờ xác nhận')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (183, N'T1', CAST(N'2023-02-19' AS Date), N'0988888888', N'ACCC', N'Thuc', N'thucfc2002@gmail.com', 90447000, N'Đang vận chuyển')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (184, N'T1', CAST(N'2023-02-24' AS Date), N'0909090909', N'21 Phu thanh 1', N'Thuc', N'thucfc2002@gmail.com', 297251500, N'Đang chờ xác nhận')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (185, N'ThucSkin', CAST(N'2023-03-09' AS Date), N'0935353553', N'21 Phu Thanh1, Lien Chieu, Da Nang', N'Thuc', N'thucfc2002@gmail.com', 45238500, N'Đang chờ xác nhận')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (186, N'Yasuo', CAST(N'2023-03-10' AS Date), N'0933333333', N'Da Nang', N'Yasuo', N'thucfc2002@gmail.com', 9719150, N'Đang chờ xác nhận')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (4, N'Realme C35', 120, 4990000, 20, N'realme-9-pro.jpg', N'realme1.png', N'realme-2.png', N'realme-3.png', N'5sao.png', CAST(N'2022-11-10' AS Date), N'Chip A13 Bionic, hệ điều hành IOS 13 kết hợp hoàn hảo 
RAM 4GB, bộ nhớ trong 64GB hoạt động mượt mà, đa nhiệm -
Hệ thống camera kép mới 12 MP cho góc chụp siêu rộng -
Camera selfie 12 MP chụp hình ở chế độ chuyển động chậm -
Màn hình IPS LCD 6.1 inch Liquid Retina hiển thị sắc nét -
Pin chuẩn Li-Ion, dung lượng pin tốt, thời gian lướt web lâu.', 2, N'hot-icon.gif', 6490000, N'realme', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (8, N'Iphone 11 64GB', 100, 10790000, 15, N'ip11.png', N'ip11-1.png', N'ip11-2.png', N'ip11-3.png', N'4sao.png', CAST(N'2022-01-01' AS Date), N'Chip A13 Bionic, hệ điều hành IOS 13 kết hợp hoàn hảo - 
RAM 4GB, bộ nhớ trong 64GB hoạt động mượt mà, đa nhiệm -
Hệ thống camera kép mới 12 MP cho góc chụp siêu rộng -
Camera selfie 12 MP chụp hình ở chế độ chuyển động chậm -
Màn hình IPS LCD 6.1 inch Liquid Retina hiển thị sắc nét -
Pin chuẩn Li-Ion, dung lượng pin tốt, thời gian lướt web lâu.', 2, N'white-img.png', 12000000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (9, N'iPhone 13 Pro Max 256GB Vàng Đồng', 50, 36290000, 25, N'ip13MaVang.png', N'img-1.png', N'img-2.png', N'img-3.png', N'3sao.png', CAST(N'2022-01-01' AS Date), N'Chip Apple A15 Bionic xử lý tác vụ mạnh mẽ, trải nghiệm game mượt mà. -
Màn hình OLED 6.7'''' Super Retina XDR hiển thị hình ảnh sắc nét, chân thực. -
Tần số quét 120Hz cho thao tác chạm lướt mượt mà, xem video mãn nhãn. -
Cụm 3 camera 12MP: camera tele, Wide, Ultra Wide chụp ảnh chuyên nghiệp. -
iPhone 13 Pro Max kháng nước bụi chuẩn IP68 cho bạn yên tâm sử dụng.', 2, N'hot-icon.gif', 38290000, N'iphone', N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (10, N'iPhone 12 64GB Xanh lá', 100, 19990000, 10, N'ipXanhLa.png', N'img-1.png', N'img-2.png', N'img-3.png', N'3sao.png', CAST(N'2022-01-01' AS Date), N'Mặt lưng của điện thoại được làm bằng kính tạo nên sự thanh lịch và đẳng cấp. -
Màn hình 6.1 inch cho không gian trải nghiệm hoàn hảo. -
Tấm nền Super Retina XDR mang đến hình ảnh sắc nét. -
Cụm camera kép cho phép chụp ảnh góc rộng và siêu rộng. -
Chip Apple A14 Bionic cho hiệu năng mạnh hơn đến 50%. -
Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường. -
Chất liệu kính Ceramic Shield giúp bền hơn gấp 4 lần. -
Bộ nhớ trong 64GB đủ đáp ứng nhu cầu lưu trữ dữ liệu. ', 2, N'white-img.png', 21990000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (11, N'Laptop HP 14-DV2051TU i3', 20, 16690000, 15, N'Laptop HP 14-DV2051TU i3.png', N'laptopAsus-1.png', N'laptopAsus-3.png', N'laptopAsus-2.png', N'5sao.png', CAST(N'2022-11-10' AS Date), N'Thiết kế sang trọng, tinh tế, hiện đại với trọng lượng nhẹ chỉ 1.41 kg. -
Bộ vi xử lý Intel Core i3-1215U xử lý tốt các tác vụ học tập và văn phòng. -
Ổ cứng SSD 256GB xử lý nhanh các tác vụ, cho không gian lưu trữ tốt. -
Màn hình FHD 14 inch với góc nhìn 178° mang đến khung nhìn tuyệt vời.', 3, N'white-img.png', 17690000, N'', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (14, N'Iphone14 Pro Max 512GB', 450, 43590000, 15, N'iphone14_512GB.jpg', N'img-2.png', N'img-1.png', N'img-3.png', N'5sao.png', CAST(N'2020-10-19' AS Date), N'RAM 4GB, bộ nhớ trong 64GB hoạt động mượt mà, đa nhiệm
Hệ thống camera kép mới 12 MP cho góc chụp siêu rộng
Camera selfie 12 MP chụp hình ở chế độ chuyển động chậm
Màn hình IPS LCD 6.1 inch Liquid Retina hiển thị sắc nét', 2, N'white-img.png', 45590000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (17, N'Laptop Acer Aspire 3 A315-59-381E i3', 20, 13490000, 15, N'Laptop Acer Aspire 3.png', N'laptopAsus-1.png', N'laptopAsus-2.png', N'laptopAsus-3.png', N'5sao.png', CAST(N'2022-10-19' AS Date), N'Sở hữu thiết kế nhỏ gọn, kiểu dáng thời thượng với màu bạc cuốn hút. -
Bộ vi xử lý Intel Core i3-1215U với hiệu năng ổn định, xử lý tốt nhiều tác vụ. -
Màn hình FHD 15.6inch đường viền hẹp hiển thị hình ảnh sắc nét, chân thật. -
Trang bị công nghệ BlueLightShield bảo vệ mắt khỏi ánh sáng xanh có hại. -
RAM 8GB kết hợp cùng ổ cứng 512GB cho không gian lưu trữ rộng lớn hơn. -
Đa dạng các cổng kết nối thông dụng đáp ứng tốt nhu cầu làm việc và giải trí.', 3, N'white-img.png', 15490000, N'', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (18, N'NULMacbook Air M2 2022L', 50, 17800000, 10, N'Macbook Air M2 2022.png', N'laptopAsus-1.png', N'laptopAsus-2.png', N'laptopAsus-3.png', N'5sao.png', CAST(N'2022-10-20' AS Date), N'
Macbook Air M2 2022 13.6 inch Apple M2 16GB 256GB', 3, N'white-img.png', 19800000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (19, N'Macbook Pro 16', 40, 17490000, 10, N'Macbook Pro 16.png', N'laptopAsus-1.png', N'laptopAsus-2.png', N'laptopAsus-3.png', N'3sao.png', CAST(N'2022-10-20' AS Date), N'Macbook Pro 16 inch 2021 【Apple M1 Pro 10-core CPU, 16-core GPU】16GB 1TB', 3, N'white-img.png', 19490000, N'', N'/ 8GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (22, N'iPad Pro 11 2020', 150, 15490000, 15, N'iPad Pro 11 2020.png', N'ipad-3.png', N'ipad-2.png', N'ipad-1.png', N'4sao.png', CAST(N'2022-10-28' AS Date), N'Đánh giá iPad Pro 11 2020 Wifi – Tablet với hệ thống camera sau và con chip A12Z ấn tượng', 4, N'white-img.png', 16000000, N'', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2015, N'Điện thoại Xiaomi Redmi Note 11 Pro', 10, 6790000, 20, N'Xiaomi-redmi-note-11-blue-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Xiaomi Redmi Note 11 Pro 4G mang trong mình khá nhiều những nâng cấp cực kì sáng giá. Là chiếc điện thoại có màn hình lớn, tần số quét 120 Hz, hiệu năng ổn định cùng một viên pin siêu trâu.
Thiết kế cứng cáp, cầm nắm rất đầm tay
Điểm nổi bật ở phần thiết kế của Redmi Note 11 Pro chính là cụm camera khá lớn và lồi so với mặt lưng, mặt lưng có chất liệu bằng kính đã được làm phẳng đi. Khung viền bằng nhựa cũng được bo tròn và vát phẳng rất liền mạch, mức độ hoàn thiện tốt, không có hiện tượng ọp ẹp khi mình sử dụng chiếc máy này..
Khung viền phẳng - Xiaomi Redmi Note 11 Pro 4G
', 2, N'white-img.png', 7790000, N'xiaomi', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2016, N'Điện thoại Xiaomi 12 Pro', 10, 25990000, 30, N'xiaomi-12-pro-1-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Xiaomi 12 Pro - chiếc điện thoại đến từ nhà Xiaomi sở hữu một thiết kế thanh lịch và vô cùng đẳng cấp, mang trong mình một hiệu năng "khủng long" cùng cụm 3 camera 50 MP mang lại khả năng chụp ảnh, quay phim chất lượng hàng đầu phân khúc.
Thiết kế tràn viền hiện đại
Ấn tượng đầu tiên khi nhìn thấy Xiaomi 12 là vẻ ngoài máy không đi theo xu hướng thiết kế vuông vức hiện nay, được bo cong các viền cạnh ở cả phần mặt lưng và màn hình tạo cảm giác cầm nắm thoải mái, thao tác vuốt từ các cạnh vào rất trơn tru và không cấn tay.
Cạnh viền bo cong - Xiaomi 12 Pro
Bộ khung được chế tạo từ kim loại giúp tăng độ bền bỉ cho thiết bị và mang đến cái nhìn cao cấp hơn khi sử dụng. Với mặt lưng được hoàn thiện từ kính nhám, đem lại khả năng hạn chế bám dấu vân tay tốt, không những thế nó còn toát lên vẻ sang trọng trên một chiếc flagship.
Khung viền chắc chắn - Xiaomi 12 Pro
Chụp ảnh sắc nét với 3 camera 50 MP
Xiaomi 12 được trang bị 3 camera ở phần mặt lưng có cùng độ phân giải lên đến 50 MP để cho ra các bức ảnh có độ sắc nét cực cao, cùng nhiều tính năng hiện đại giúp bạn có được những tấm hình đầy nghệ thuật.
Trang bị 3 camera - Xiaomi 12 Pro
Với môi trường đủ sáng thì không là vấn đề với Xiaomi 12 Pro, ảnh cho ra cực kỳ rõ nét, có độ tương phản cao phân biệt rõ ràng giữa vùng sáng - tối, những vùng quá sáng sẽ được xử lý và cân bằng sao cho vừa phải, phù hợp với tổng thể bức ảnh.
Ảnh chụp ngoài trời - Xiaomi 12 Pro
Để kiểm chứng khả năng chụp đêm của máy có tốt như hãng đề cập thì mình có chụp test vào ban đêm bằng chiếc máy này, bức ảnh thu được làm mình rất bất ngờ khi độ chi tiết mà nó mang lại rất tốt, màu sắc được phân bổ rõ ràng và không bị hòa lại với nhau, nhiễu hạt đã được hạn chế rất nhiều.
Chụp ảnh vào ban đêm - Xiaomi 12 Pro.', 2, N'white-img.png', 28990000, N'xiaomi', N'/ 2GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2017, N'Điện thoại Xiaomi 12', 5, 16490000, 10, N'Xiaomi-12-xanh-duong-thumb-mau-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', N'2sao.png', CAST(N'2022-11-11' AS Date), N'Điện thoại Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.
Cầm nắm cực kỳ thoải mái
Ấn tượng đầu tiên khi mình nhìn điện thoại Xiaomi 12 là nó quá đẹp, các chi tiết được hoàn thiện một cách tỉ mỉ, cạnh viền được bo cong mềm mại và không thấy xuất hiện chi tiết thừa.
Vẻ ngoài sang trọng - Xiaomi 12
Bộ khung kim loại cứng cáp cùng mặt lưng kính cao cấp được hoàn thiện nhám mang lại khả năng hạn chế bám dấu vân tay, cũng như cho ra cảm giác cầm nắm rất thoải mái và chắc chắn.
Mặt lưng hoàn thiện nhám - Xiaomi 12
Xiaomi 12 đi ngược với xu hướng thiết kế vuông vức hiện nay nhằm mang đến cho người dùng trải nghiệm cầm nắm thoải mái nhất có thể, khi hai cạnh bên được hãng bo cong một cách mềm mại.
Cạnh viền bo cong mềm mại - Xiaomi 12
Máy mang đến cho mình cảm giác rất êm ái khi sử dụng, tình trạng cấn tay gần như không xuất hiện cho dù sử dụng liên tục trong khoảng thời gian dài, cử chỉ vuốt màn hình từ cạnh ngoài vào trong trở nên nhanh chóng và trơn mượt hơn nhờ viền màn hình bo cong.
Sử dụng thoải mái - Xiaomi 12
Cụm loa được bố trí riêng lẻ ở hai đầu thiết bị cùng công nghệ âm thanh Dolby Atmos, cho ra trải nghiệm giải trí khi chơi game hay xem phim một cách sống động hơn.
Hỗ trợ âm thanh vòm - Xiaomi 12
Nhìn đã mắt với màn hình sắc nét.', 2, N'white-img.png', 17490000, N'xiaomi', N'/ 3GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2018, N'Điện thoại Xiaomi 11T 5G 256GB', 3, 10990000, 15, N'xiaomi-11t-256gb-thumb-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'Xiaomi 11T 5G sở hữu màn hình AMOLED, viên pin siêu khủng cùng camera độ phân giải 108 MP, điện thoại Xiaomi sẽ đáp ứng mọi nhu cầu sử dụng của bạn, từ giải trí đến làm việc đều vô cùng mượt mà. 
Cho ra những tác phẩm đầy chân thật với camera 108 MP
Xiaomi đã trang bị cho máy cụm 3 camera sau gồm camera chính 108 MP, camera góc rộng có độ phân giải 8 MP cùng camera telemacro 5 MP kết hợp cùng phần cứng bên trong cho khả năng lấy nét, thu sáng và zoom cực tốt để cho ra những bức ảnh chi tiết dù bạn chụp gần hay chụp xa. 
Cụm camera sau chất lượng - Xiaomi 11T 5G 256GB
Việc chụp ảnh phong cảnh khi đi du lịch cũng diễn ra vô cùng dễ dàng thông qua camera góc rộng 120 độ, mang đến cho bạn tấm hình toàn cảnh đầy ấn tượng, các góc của ảnh cũng không bị bóp hay méo quá nhiều.
Không dừng lại ở đó máy còn được trang bị thêm khả năng chụp đêm siêu rõ nét, làm cho khung cảnh ban đêm thông qua bức ảnh càng thêm chân thực.
Chế độ chụp đêm - Xiaomi 11T 5G 256GB
Bạn sẽ có những bức ảnh chụp cận cảnh cực chi tiết, màu sắc trung thực thông qua ống kính telemacro với tiêu điểm chụp thích hợp khoảng 3 - 7 cm, khơi gợi sự sáng tạo của bạn bằng những tấm ảnh chụp cận cực chất, làm bật lên những nét đẹp ẩn đằng sau những chi tiết siêu nhỏ.
Ảnh chụp từ ống kính telemacro - Xiaomi 11T 5G 256GB
Ghi lại những điều thú vị trong cuộc sống của bạn tựa như một bộ phim điện ảnh với nhiều chế độ quay như Audio Zoom, Magic Zoom, Time Freeze,... thao tác điều chỉnh nhanh chóng với một cái chạm.', 2, N'white-img.png', 11990000, N'xiaomi', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2019, N'Điện thoại POCO C40', 10, 2990000, 30, N'xiaomi-poco-c40-thumb-vang-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Tháng 06/2022 điện thoại POCO C40 đã chính thức được cho ra mắt tại thị trường Việt Nam, sở hữu màn hình kích thước lớn, viên pin dung lượng khủng và một con chip JR510 mới lạ trên thị trường công nghệ hiện nay.
Pin khỏe, vui lâu
Cung cấp năng lượng cho C40 là viên pin khủng với dung lượng 6000 mAh. Mình khá bất ngờ với thời gian sử dụng liên tục của điện thoại khi đạt đến hơn 10 tiếng* cho các tác vụ cơ bản như chơi game, xem phim, mạng xã hội. Đây quả thật là một chiếc điện thoại pin khủng để cho bạn thời gian trải nghiệm gần như 1 ngày với mọi tác vụ.
Thời lượng pin lâu - POCO C40
Máy có công suất sạc tối đa 18 W nhưng trong hộp chỉ trang bị củ 10 W nên mình mất gần 3 giờ đồng hồ để sạc đầy sản phẩm. Nếu bạn có củ 18 W thì thời gian sẽ rút ngắn hơn, mình đã thử sạc lúc điện thoại còn 42% thì sau một tiếng sạc đã lên 72%.
Rút ngắn thời gian sạc - POCO C40
*Thời gian sạc, sử dụng có thể thay đổi tùy theo nhu cầu, tác vụ.
Về pin thì đây cũng là một con số khá tốt để bạn có thể thoải mái sử dụng cả ngày, thời gian sạc vừa phải và không quá lâu, có thể đảm bảo dùng ổn trong một ngày.
Nâng tầm trải nghiệm màn ảnh
Một mẫu điện thoại có màn hình lớn sẽ đem đến cho bạn một không gian hiển thị rộng rãi hơn, hạn chế tình trạng mỏi mắt khi sử dụng thời gian dài, nắm bắt những lợi ích trên, hãng đã trang bị cho POCO C40 màn hình có kích thước 6.71 inch, kèm với tấm nền IPS LCD và độ phân giải HD+ (720 x 1650 Pixels).
Hiển thị hình ảnh rõ ràng - POCO C40
Các thông số trên khá cơ bản trong tầm giá, đồng thời do sở hữu một màn hình lớn và chỉ dừng lại ở độ phân giải HD+ nên khi nhìn kỹ thì hình ảnh dừng ở mức tạm ổn, không bị rỗ nhiều, phù hợp cho các nhu cầu cơ bản của hầu hết mọi người dùng hiện nay.', 2, N'white-img.png', 3090000, N'xiaomi', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2020, N'Điện thoại Xiaomi Redmi Note 11 (6GB/128GB)', 15, 4990000, 15, N'Xiaomi-redmi-note-11-blue-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Redmi Note 11 (6GB/128GB) vừa được Xiaomi cho ra mắt, được xem là chiếc smartphone có giá tầm trung ấn tượng, với 1 cấu hình mạnh, cụm camera xịn sò, pin khỏe, sạc nhanh mà giá lại rất phải chăng.
Thiết kế bo cong đậm chất Xiaomi
Xiaomi Redmi Note 11 xuất hiện với màu sắc trẻ trung, tất cả đều rất thời trang, sang trọng, đẹp mắt. Thiết kế cạnh bo cong mềm mại, hiện đại cho tổng thể điện thoại, nổi bật ở cụm camera sau được đặt trong mô-đun lớn.
Màu sắc trẻ trung | Xiaomi Redmi Note 11
Màn hình Xiaomi Redmi Note 11 kích cỡ 6.43 inch với camera đục lỗ, sở hữu 2 cạnh bên và cạnh trên siêu mỏng, cho diện tích màn hình trải nghiệm tốt, đã mắt và tạo sự tập trung khi xem.
Màn hình đục lỗ - Xiaomi Redmi Note 11
Điện thoại được trang bị bảo mật vân tay cạnh viền hỗ trợ bảo mật tốt, độ nhạy cao để truy cập màn hình nhanh qua 1 chạm.
Cảm biến vân tay cạnh viền - Xiaomi Redmi Note 11
Hiệu năng mạnh mẽ với chip Snapdragon.', 2, N'white-img.png', 5090000, N'xiaomi', N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2021, N'Điện thoại Xiaomi Redmi 10A', 13, 2490000, 10, N'xiaomi-redmi-10a-thumb-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Xiaomi Redmi 10A ra mắt tại thị trường Việt Nam vào tháng 07/2022, với ưu điểm là sở hữu pin trâu cùng một màn hình kích thước lớn giúp máy trở thành một smartphone lý tưởng cho những bạn đang tìm mua một thiết bị phục vụ nghe gọi hay xem phim cả ngày. Cùng với đó là giá thành phải chăng để người dùng có thể dễ dàng tiếp cận và mua sắm.
Kiểu dáng thiết kế trẻ trung


', 2, N'white-img.png', 2890000, N'xiaomi', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2022, N'Điện thoại Xiaomi 12T 256GB', 15, 12490000, 20, N'xiaomi-12t-thumb-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Xiaomi 12T 256GB là smartphone đầu tiên trên thế giới trang bị con chip Dimensity 8100 Ultra nên máy thu hút được khá nhiều sự chú ý vào thời điểm ra mắt, bộ vi xử lý này không chỉ có hiệu năng mạnh mẽ mà nó còn tối ưu được giá thành cho thiết bị, điều này giúp 12T trở thành chiếc điện thoại quốc dân cực kỳ đáng sắm.
Vẻ đẹp đến từ sự hoàn thiện cao cấp
Ấn tượng đầu tiên đối với mình khi lần đầu trên tay Xiaomi 12T là nằm ở phần thiết kế, máy tạo cho mình một cảm giác khá quen thuộc khi gợi nhớ đến chiếc flagship Xiaomi 12. Đây được xem là ngôn ngữ thiết kế mà mình cực kỳ ưng ý nhờ có hai cạnh bên bo cong mềm mại.
Thiết kế đẹp mắt - Xiaomi 12T 256GB
Do tính chất công việc nên mình phải sử dụng điện thoại thường xuyên, vì thế cảm giác cầm nắm là một trong những yếu tố tiên quyết mà mình quan tâm trước khi chọn mua sản phẩm. Sau khi trên tay Xiaomi 12T một thời gian thì mình đã thực sự muốn mua chiếc máy này bởi phần bo cong của máy làm cho mình cầm nắm rất dễ chịu, dùng lâu cũng ít cảm thấy bị cấn hay khó chịu.
Mặt lưng bo cong - Xiaomi 12T 256GB
Ngoài ra, màu sắc cũng là một điểm nhấn của Xiaomi 12T bởi sự trẻ trung và hiện đại mà nó mang lại, bên cạnh đó thì phiên bản màu xám trên tay mình đây còn tạo cho điện thoại một cái nhìn cao cấp hơn, vì nó làm mình liên tưởng đến một mặt lưng như được làm từ kim loại.
Vẻ ngoài sang trọng - Xiaomi 12T 256GB
Nhằm giúp người dùng có thể phân biệt giữa Xiaomi 12T và Xiaomi 12 thì hãng cũng đã có thay đổi ở một vài chi tiết mà mình nhận thấy ở đây, đầu tiên và lớp bảo vệ camera chính đã được làm theo kiểu hình vuông và phía bên dưới có in thêm dòng chữ 108 MP.
Viền camera thay đổi - Xiaomi 12T 256GB
Tiếp đến là phần màn hình điện thoại với kiểu thiết kế phẳng thay vì bo cong ở hai cạnh như trên Xiaomi 12, tuy mất đi một chút gì đó cao cấp về cái nhìn nhưng đổi lại màn hình phẳng này lại tạo cho mình cảm giác sử dụng quen thuộc, khi nhìn ở những vị trí sát viền cũng dễ dàng hơn so với cạnh bo cong.
Thiết kế mang hình phẳng - Xiaomi 12T 256GB
Mặt lưng của điện thoại Xiaomi được làm từ kính nên khi cầm vào sẽ mang lại cái nhìn sang trọng hơn. Loại vật liệu này cũng có khả năng hạn chế các vết xước nhẹ nên mình cũng an tâm trong lúc dùng mà không cần ốp.', 2, N'white-img.png', 14490000, N'xiaomi', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2023, N'Điện thoại Xiaomi Redmi Note 10S 6GB', 10, 5290000, 10, N'xiaomi-redmi-note-10s-6gb-thumb-600x600.jpeg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Xiaomi Redmi Note 10S 6GB được xem là điện thoại thuộc phân khúc smartphone giá tầm trung nhưng chinh phục người tiêu dùng với thiết kế sang đẹp, cấu hình ấn tượng và cụm camera cực chất, sẽ là thiết bị liên lạc, chiến game giải trí và làm việc ổn định,… cho các nhu cầu sử dụng của bạn.
Hiệu năng mạnh mẽ, đáp ứng mọi tác vụ
Xiaomi Redmi Note 10S 6GB sở hữu chip xử lý MediaTek Helio G95 8 nhân được sản xuất trên tiến trình 12nm cho tốc độ lên đến 2.05 GHz, tích hợp chip đồ họa Mali-G76 MC4 xử lý đồ họa tốt cho phép người dùng chiến game ổn định, mượt mà ở những tựa game có mức cài đặt phù hợp.
Xiaomi Redmi Note 10S 6GB - Xiaomi Redmi Note 10S 6GB
Dung lượng RAM 6 GB giữ ổn định hiệu suất trên máy khi sử dụng liên tục nhiều giờ liền, chạy mọi tác vụ đều mượt mà. Bộ nhớ trong 128 GB cùng khe cắm thẻ MicroSD (hỗ trợ tối đa đến 1 TB) thoải mái cho bạn lưu trữ mọi ứng dụng mà mình muốn, tạo kho ảnh chụp và video cá nhân mà không ái ngại quá tải bộ nhớ.
Smartphone chạy trên hệ điều hành MIUI 12.5 mới nhất dựa trên Android 11 thân thiện, xử lý thông tin nhanh, thao tác ứng dụng ổn định.
Hệ điều hành MIUI 12.5 - Xiaomi Redmi Note 10S 6GB
Sáng tạo nghệ thuật với cụm camera chất lượng
Cụm camera trên Xiaomi Redmi Note 10S 6GB được đặt trong mô-đun nổi bật, nhìn sang chảnh và bắt mắt, bao gồm 4 camera đa chức năng cho phép ghi lại ấn tượng mọi khoảnh khắc và chi tiết cuộc sống.
Cụm camera xịn sò - Xiaomi Redmi Note 10S 6GB
Camera chính 64 MP khẩu độ f/1.79 cho khả năng lấy nét nhanh và chuẩn xác, thu lại chính xác khung hình thực lên màn hình điện thoại. Camera 8 MP khẩu độ f/2.2 chụp góc siêu rộng 118° bắt trọn khung cảnh hùng vĩ phía trước, để bạn chụp khung cảnh núi rừng, biển hay các sân chơi lớn đều thật dễ dàng, trọn vẹn.
Chụp góc siêu rộng - Xiaomi Redmi Note 10S 6GB.', 2, N'white-img.png', 5990000, N'xiaomi', N'/ 3GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2024, N'Điện thoại iPhone 11 64GB', 10, 11990000, 15, N'iphone-xi-xanhla-600x600.jpg', N'img-3.png', N'img-2.png', N'img-1.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.
Nâng cấp mạnh mẽ về camera
Nói về nâng cấp thì camera chính là điểm có nhiều cải tiến nhất trên thế hệ iPhone mới.
Điện thoại iPhone 11 64GB | Thiết kế nhiều màu sắc
Nếu như trước đây iPhone Xr chỉ có một camera thì nay với iPhone 11 chúng ta sẽ có tới hai camera ở mặt sau.
Điện thoại iPhone 11 64GB | Camera sau
Ngoài camera chính vẫn có độ phân giải 12 MP thì chúng ta sẽ có thêm một camera góc siêu rộng và cũng với độ phân giải tương tự.
Điện thoại iPhone 11 64GB | Ảnh chụp chế độ chân dung
Ảnh chụp chân dung với iPhone 11
Theo Apple thì việc chuyển đổi qua lại giữa hai ống kính thì sẽ không làm thay đổi màu sắc của bức ảnh.
Điện thoại iPhone 11 64GB | Ảnh chụp chế độ chân dung
Ảnh chụp chế độ chân dung với iPhone 11
Đây là một điều được xem là bước ngoặt bởi những chiếc smartphone Android có nhiều camera hiện nay sẽ thường bị sai lệch về màu sắc khi chuyển đổi qua lại giữa các ống kính gây cảm giác khá khó chịu cho người dùng.
Điện thoại iPhone 11 64GB | Ảnh chụp với Deep Fusion.', 2, N'hot-icon.gif', 12390000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2025, N'Điện thoại iPhone 13 Pro Max 128GB', 50, 25990000, 25, N'iphone-13-pro-max-xanh-la-thumb-1-600x600.jpg', N'img-3.png', N'img-1.png', N'img-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.
Thiết kế đẳng cấp hàng đầu
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.
Thiết kế vuông vức đặc trưng - iPhone 13 Pro Max 128GB
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.
Màn hình tai thỏ được tinh giản - iPhone 13 Pro Max 128GB
Điểm thay đổi dễ dàng nhận biết trên iPhone 13 Pro Max chính là kích thước của cảm biến camera sau được làm to hơn và để tăng độ nhận diện cho sản phẩm mới thì Apple cũng đã bổ sung một tùy chọn màu sắc Sierra Blue (màu xanh dương nhạt hơn so với Pacific Blue của iPhone 12 Pro Max).
Sierra Blue trẻ trung, thanh lịch - iPhone 13 Pro Max 128GB
Máy vẫn tiếp tục sử dụng khung viền thép cao cấp cho khả năng chống trầy xước và va đập một cách vượt trội, kết hợp với khả năng kháng bụi, nước chuẩn IP68.
Viền thép cao cấp - iPhone 13 Pro Max 128GB
Màn hình giải trí siêu mượt cùng tần số quét 120 Hz.', 2, N'hot-icon.gif', 28990000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2026, N'Điện thoại iPhone 14 Pro Max 128GB', 10, 33990000, 10, N'iphone-14-pro-max-bac-thumb-600x600.jpg', N'img-2.png', N'img-3.png', N'img-1.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng. Từ ngày 14/10/2022 người dùng đã có thể mua sắm các sản phẩm iPhone 14 series với đầy đủ phiên bản tại Thế Giới Di Động.
Thiết kế cao cấp và vẻ ngoài sành điệu
Sản phẩm có trong mình một diện mạo bắt mắt nhờ lối tạo hình vuông vức bắt trend tương tự thế hệ iPhone 13 series, đây được xem là kiểu thiết kế rất thành công trên các thế hệ trước khi tạo nên cơn sốt toàn cầu về kiểu dáng thiết kế điện thoại cho đến nay. 
Thiết kế vuông vức - iPhone 14 Pro Max 128GB
Mặt lưng làm từ kính cùng khung thép không gỉ giúp cho iPhone có thêm độ bền bỉ để đồng hành cùng bạn được lâu dài hơn, không những thế nó còn làm cho thiết bị của bạn trở nên sang trọng và đẳng cấp hơn.
Đột phá với thiết kế Dynamic island
Để tối ưu được không gian hiển thị thì Apple cũng đã chính thức loại bỏ tai thỏ huyền thoại để thay thế vào đó là kiểu bố trí hình viên thuốc độc đáo, vừa đem lại vùng hiển thị rộng rãi hơn mà đây còn là một đặc điểm nhận diện dễ dàng trên chiếc iPhone 14 Pro Max.
Hình notch mới mẻ - iPhone 14 Pro Max
Đây được xem là một điểm mới về phần màn hình trên dòng sản phẩm Pro Max năm nay vì cụm tai thỏ đã được lược bỏ và thay thế vào đó là thiết kế hình notch viên thuốc, đi kèm với đó sẽ là tính năng Dynamic Island để biến cụm này trở nên thú vị hơn qua những thông báo hay thông tin trạng thái.
iPhone 14 Pro Max với nhiều màu sắc rực rỡ
Tím - iPhone 14 Pro Max Deep Purple
Một điểm đặc biệt trên phiên bản này là màu Deep Purple (tím) mới chưa từng có trên những phiên bản trước đây, vì thế đây chắc hẳn là một đặc điểm nhận diện dễ dàng trên iPhone 14 Pro Max, điều này giúp bạn trở thành một người dùng rất có sức hút khi sở hữu cho mình một thiết bị mới nhất đến từ nhà Apple.
Phiên bản màu tím - iPhone 14 Pro Max.', 2, N'hot-icon.gif', 35590000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2027, N'Điện thoại iPhone 14 Pro 128GB', 10, 29590000, 10, N'iphone-14-pro-bac-thumb-600x600.jpg', N'img-3.png', N'img-1.png', N'img-2.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Tại sự kiện ra mắt sản phẩm thường niên diễn ra vào tháng 9/2022, Apple đã trình làng iPhone 14 Pro với những cải tiến về thiết kế màn hình, hiệu năng, sẵn sàng cùng bạn chinh phục mọi thử thách. Giờ đây người dùng đã có thể mua sắm những sản phẩm iPhone 14 từ ngày 14/10/2022 tại Thế Giới Di Động với đầy đủ các phiên bản.
Thuộc tính	Thông số
Màn hình	OLED, 6.1 inch, Super Retina XDR, 120 Hz
Hệ điều hành	iOS 16
Camera sau	Chính 48 MP & Phụ 12 MP, 12 MP
Camera trước	12 MP
Chip	Apple A16 Bionic
Dung lượng bộ nhớ	128 GB, 256 GB, 512 GB, 1 TB
Thanh lịch, hiện đại trong từng đường nét
Thừa hưởng phong cách thiết kế tối giản, hiện đại của thế hệ iPhone 13 series, iPhone 14 Pro vẫn sở hữu cạnh viền vát phẳng và hệ thống camera được bố trí một cách hợp lý trong một cụm hình vuông. Giờ đây cụm tai thỏ quen thuộc đã được loại bỏ và thay thế vào đó là hình notch độc đáo dễ nhận diện.
Thiết kế cao cấp - iPhone 14 Pro 128GB
Trang bị theo đó là bộ khung viền thép chắc chắn mang đến cho thiết bị một độ bền bỉ cực cao, cùng với đó sẽ là mặt lưng kính cường lực đẳng cấp và sang trọng.
Một điểm mới trong lần ra mắt này là về phiên bản màu sắc Deep Purple chưa từng có trên các dòng iPhone trước đây. Vì thế đây chắc hẳn sẽ là phiên bản hot nhất trên iPhone 14 Pro nhờ đặc điểm nhận diện cực cao.', 2, N'hot-icon.gif', 3090000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2028, N'Điện thoại iPhone 13 Pro 128GB', 10, 25990000, 15, N'iphone-13-pro-gold-1-600x600.jpg', N'img-1.png', N'img-3.png', N'img-2.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng. 
Thiết kế đặc trưng với màu sắc thời thượng
iPhone 13 Pro không có nhiều sự thay đổi về thiết kế, khi máy vẫn sở hữu kiểu dáng tương tự như điện thoại iPhone 12 Pro với các cạnh viền vuông vắn và hai mặt kính cường lực cao cấp. Sở hữu 5 phiên bản màu gồm xanh dương, bạc, vàng đồng, xám và xanh lá cho bạn tùy chọn theo sở thích của mình. 
Sở hữu 4 phiên bản màu sắc trẻ trung - iPhone 13 Pro 128GB
Máy đạt tiêu chuẩn kháng nước và bụi IP68 có khả năng chống lại một số hạt bụi, và được bảo vệ khi rơi xuống nước ở độ sâu đến 6 mét trong 30 phút theo chuẩn IEC 60529, thoải mái nhắn tin khi lỡ ra ngoài gặp mưa, chụp ảnh tự tin khi đi hồ bơi, bãi biển,...
Khả năng kháng bụi, nước - iPhone 13 Pro 128GB
Nâng cấp màn hình với tần số quét 120 Hz
Điện thoại iPhone 13 Pro vẫn được trang bị màn hình kích thước 6.1 inch, với phần tai thỏ được làm nhỏ hơn giúp hiển thị thêm nhiều thông tin cũng như tăng cường cảm giác trải nghiệm. Bề mặt có lớp phủ oleophobic chống bám vân tay, giữ cho màn hình luôn được sạch mới. 
Trang bị màn hình 6.1 inch - iPhone 13 Pro 128GB
iPhone 13 Pro đã được nâng cấp lên tần số quét 120 Hz, với ProMotion có thể làm mới từ 10 đến 120 khung hình/giây. Với tần số quét cao, mọi thao tác chuyển cảnh khi lướt ngón tay trên màn hình trở nên mượt mà hơn đồng thời hiệu ứng thị giác khi chúng ta dùng điện thoại chơi game hoặc xem video cũng cực kỳ mãn nhãn.
Chuyển động mượt mà nhờ tần số 120 Hz - iPhone 13 Pro 128GB
Tốc độ làm tươi tự động tăng lên để hiển thị hiệu suất đồ họa, tự động giảm xuống khi không sử dụng để tiết kiệm năng lượng và tốc độ làm mới cũng được tự tinh chỉnh linh động để phù hợp hơn tốc độ lướt của ngón tay bạn. 
Tốc độ làm tươi được tự động hóa - iPhone 13 Pro 128GB
Sử dụng tấm nền OLED có số điểm ảnh lên đến 1170 x 2532 Pixels cho hình ảnh và màu sắc hiển thị sâu, sắc sáng tươi tắn, khung hình sinh động như thực.', 2, N'hot-icon.gif', 26990000, N'iphone', N'/ 8GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2029, N'Điện thoại iPhone 12 64GB', 10, 16490000, 20, N'iphone-12-violet-1-600x600.jpg', N'img-3.png', N'img-2.png', N'img-1.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.
Hiệu năng vượt xa mọi giới hạn
Apple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.
Chip A14 Bionic mạnh mẽ | iPhone 12
Với CPU Apple A14 Bionic, bạn có thể dễ dàng trải nghiệm mọi tựa game với những pha chuyển cảnh mượt mà hay hàng loạt hiệu ứng đồ họa tuyệt đẹp ở mức đồ họa cao mà không lo tình trạng giật lag.
Chiến game siêu mượt, đồ họa tuyệt đẹp | iPhone 12
Chưa hết, Apple còn gây bất ngờ đến người dùng với hệ thống 5G lần đầu tiên được trang bị trên những chiếc iPhone, cho tốc độ truyền tải dữ liệu nhanh hơn, ổn định hơn.
Kết nối 5G truyền tải dữ liệu nhanh chóng | iPhone 12
iPhone 12 sẽ chạy trên hệ điều hành iOS 15 (12/2021) với nhiều tính năng hấp dẫn như hỗ trợ Widget cũng như những nâng cấp tối ưu phần mềm đáng kể mang lại những trải nghiệm thú vị mới lạ đến người dùng.
Khám phá những tính năng mới hấp dẫn trên iOS 14 | iPhone 12
Cụm camera không ngừng cải tiến
iPhone 12 được trang bị hệ thống camera kép bao gồm camera góc rộng và camera siêu rộng có cùng độ phân giải là 12 MP, chế độ ban đêm (Night Mode) trên bộ đôi camera này cũng đã được nâng cấp về phần cứng lẫn thuật toán xử lý, khi chụp những bức ảnh thiếu sáng bạn sẽ nhận được kết quả ấn tượng với màu sắc, độ chi tiết rõ nét đáng kinh ngạc.', 2, N'hot-icon.gif', 17790000, N'iphone', N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2031, N'Laptop Asus TUF Gaming FX506LHB i5', 10, 19990000, 25, N'asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg', N'laptopAsus-1.png', N'laptopAsus-2.png', N'laptopAsus-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Nếu bạn đang tìm kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức giá phải chăng thì laptop Asus TUF Gaming FX506LHB i5 (HN188W) sẽ là sự lựa chọn đáng cân nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ cùng phong cách thiết kế cứng cáp, độc đáo. 
• Chạy mượt mà các ứng dụng văn phòng trên Word, Excel, PowerPoint,... đến chiến những con game đình đám nhờ bộ vi xử lý Intel Core i5 10300H kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 4 GB mạnh mẽ. 
• Laptop Asus đa nhiệm mượt mà trên nhiều cửa sổ Chrome cùng lúc nhờ bộ nhớ RAM 8 GB, bên cạnh đó còn mang đến tốc độ khởi động máy và ứng dụng nhanh chóng với ổ cứng SSD 512 GB.   
• Laptop có kích thước màn hình 15.6 inch cùng tần số quét 144 Hz mang đến những trải nghiệm chiến game cực đỉnh, không bị giật lag hay xé hình khi chơi những tựa game có tốc độ cao.
• Laptop Asus TUF Gaming được bao bọc bởi lớp vỏ nhựa màu đen huyền bí, khối lượng 2.3 kg cho phép bạn chiến game ở mọi không gian.
• Máy được trang bị đèn bàn phím chuyển màu RGB độc đáo, tăng độ hăng hái cho game thủ mỗi khi chiến game.', 3, N'white-img.png', 21990000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2034, N'Laptop Acer Aspire 7 Gaming A715 42G', 10, 14990000, 20, N'acer-aspire-7-gaming-a715.jpg', N'laptopAsus-2.png', N'laptopAsus-3.png', N'laptopAsus-1.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Laptop Aspire 7 Gaming A715 42G R4XX R5 (NH.QAYSV.008) sở hữu hiệu năng khoẻ cùng thiết kế mạnh mẽ, là bạn đồng hành lý tưởng trong mọi cuộc hành trình.
• Laptop AMD Ryzen 5 5500U cùng card rời NVIDIA GeForce GTX 1650 4 GB, mang đến khả năng thiết kế 2D, render video ngắn,... ổn định trên các phần mềm Adobe hay giải trí với các tựa game kịch tính trên thị trường hiện nay một cách mượt mà.
• Chiếc laptop Acer Aspire còn sở hữu RAM 8 GB và SSD 256 GB đáp ứng tốt nhu cầu đa nhiệm, hỗ trợ bạn thao tác mọi việc nhanh chóng và hiệu quả hơn.
• Phiên bản laptop này với khối lượng 2.1 kg và dày 22.9 mm, được chế tác từ chất liệu nhựa bền bỉ, dễ dàng để bạn mang đi khắp mọi nơi.
• Bản lề mở 180 độ giúp chia sẻ thông tin nhanh chóng, tiện lợi. Cùng đèn nền đơn sắc được trang bị hỗ trợ bạn gõ phím chuẩn xác trong bóng tối.
• Laptop Acer này có 2 cổng USB 3.2, HDMI, LAN (RJ45), USB 2.0 và USB Type-C cho phép bạn truyền tải dữ liệu nhanh chóng.
• Công nghệ Acer ComfyView, chống chói Anti Glare và tấm nền IPS được trang bị trên màn hình 15.6 inch, mang đến những trải nghiệm rõ nét, góc nhìn mở rộng, hạn chế hiện tượng chói loá, bóng gương, bảo vệ thị giác của bạn.
• Chiếc laptop gaming này cho bạn cảm nhận chân thật âm nhạc sống động, ít bị biến dạng nhờ công nghệ âm thanh Acer TrueHarmony.', 3, N'white-img.png', 18890000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2035, N'Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB', 10, 31690000, 20, N'lenovo-legion-5-15iah7-i5-82rc003wvn-2.jpg', N'laptopAsus-2.png', N'laptopAsus-1.png', N'laptopAsus-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Laptop Lenovo Legion 5 15IAH7 i5 12500H (82RC003WVN) gây ấn tượng bởi lối thiết kế đậm chất thể thao, mạnh mẽ với khả năng vận hành mượt mà mọi tựa game từ nhẹ đến nặng, giúp các cao thủ chiến game đầy tự tin và tận hưởng những giây phút đỉnh cao trong chiến trường ảo.
• Bên trong chiếc laptop gaming này ẩn chứa một con quái vật đến từ bộ vi xử lý Intel Core i5 
', 3, N'white-img.png', 33390000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2036, N'Laptop HP VICTUS 16 d0292TX i5 11400H/8GB/512GB', 10, 26590000, 25, N'hp-victus-16-d0292tx-i5-5z9r3pa-thumb-600x600.jpg', N'laptopAsus-3.png', N'laptopAsus-1.png', N'laptopAsus-2.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Laptop HP VICTUS 16 d0292TX i5 (5Z9R3PA) sẽ là một người bạn đồng hành đắc lực trên mọi chiến trường ảo của game thủ nhờ ngoại hình sang trọng, hiện đại cùng những thông số kỹ thuật mạnh mẽ. 
• Trang bị chip Intel Core i5 11400H cùng card rời NVIDIA GeForce RTX3050Ti 4 GB, laptop HP Victus sẵn sàng cùng bạn chiến mọi tựa game đình đám như LOL, PUBG, CS:GO,... hay thỏa mãn đam mê sáng tạo với các ứng dụng đồ họa của nhà Adobe. 
• Vừa chiến game vừa nghe nhạc giải trí vẫn rất mượt mà, không giật lag nhờ bộ nhớ RAM 8 GB, ổ cứng 512 GB SSD (có thể tháo và lắp thanh khác tối đa 1 TB) mang đến không gian lưu trữ ổn định cùng tốc độ mở máy nhanh chóng hơn.  
• Quan sát di chuyển của đối thủ ở mọi góc cạnh nhờ kích thước màn hình 16.1 inch cùng tấm nền IPS tạo góc nhìn rộng rãi, độ phân giải Full HD cùng công nghệ Wled-backlit mang đến những khung ảnh chất lượng, sắc nét hơn. 
• Tần số quét 144 Hz cho mọi chuyển động có tốc độ nhanh được mượt mà hơn đáng kể, đồng thời vẫn bảo vệ thị giác của người dùng trước ánh sáng xanh của máy nhờ màn hình chống chói Anti Glare. 
• Công nghệ Audio by B&O kết hợp với Realtek High Definition Audio đắm chìm người dùng vào chính khung cảnh của trận chiến với chất âm sống động, chân thực.
• Chiếc laptop này được bao bọc bởi lớp vỏ nhựa cùng chiếc áo đen toát lên vẻ sang chảnh, mạnh mẽ. Cân nặng 2.46 kg vẫn có thể chấp nhận được trong phân khúc laptop gaming và sẵn sàng cùng bạn chiến đấu khắp mọi nơi.
• Laptop có bàn phím số giúp các thao tác nhập liệu chữ số được tiện lợi hơn rất nhiều, ngoài ra còn có thêm đèn nền phím giúp bạn thoải mái làm việc ở những nơi thiếu sáng.
• Laptop HP được trang bị các cổng kết nối bao gồm USB 3.1, Jack tai nghe 3.5 mm, HDMI, LAN (RJ45) và USB Type-C giúp kết nối với các thiết bị ngoại vi khác nhanh chóng hơn.', 3, N'white-img.png', 28890000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2038, N'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H', 10, 19490000, 30, N'Laptop Acer Aspire 3.png', N'laptopAsus-1.png', N'laptopAsus-2.png', N'laptopAsus-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Phá cách với diện mạo mạnh mẽ đến từ laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) mang đến cho người dùng hiệu năng ổn định, hỗ trợ bạn trong mọi tác vụ hằng ngày hay chiến những trận game cực căng một cách mượt mà.
Kiểu dáng nổi bật, thu hút mọi ánh nhìn
Laptop Acer Nitro với tính bền bỉ vượt bậc khi được trang bị lớp vỏ nhựa chắc chắn cùng khối lượng không quá nặng cho một chiếc laptop gaming 2.2 kg và dày 23.9 mm, sẵn sàng cùng bạn đi đến bất kỳ đâu, phục vụ tốt cho cả nhu cầu công việc hay giải trí, cho phép bạn chiến game ở khắp mọi nơi trong cuộc hành trình.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Thiết kế
Bàn phím Fullsize được thiết kế đèn nền chuyển màu RGB của laptop Acer được thiết kế tinh tế nhưng vẫn tôn lên nét mạnh mẽ của một chiếc gaming mạnh mẽ, với các phím có độ nảy tốt, cho bạn thoải mái sử dụng cả trong điều kiện ánh sáng kém mà không lo nhầm lẫn.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Bàn phím
Dọc hai bên laptop được trang bị các cổng giao tiếp thông dụng hỗ trợ tốt cho nhu cầu truyền xuất dữ liệu hay chia sẻ thông tin đến các thiết bị ngoại vi tương thích như 3 cổng USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45) và USB Type-C.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Cổng kết nối
Các chuẩn kết nối không dây Bluetooth 5.0 và Wi-Fi 6 (802.11ax) cung cấp đường truyền ổn định trong suốt quá trình làm việc hay giải trí ở cả trong nhà, ngoài trời, nâng cao năng suất công việc của bạn.
Đánh bại mọi đối thủ trong mọi trận chiến.', 3, N'white-img.png', 22490000, NULL, N'/ 12GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2040, N'Laptop MSI Gaming GF65 Thin 10UE i5 10500H/16GB', 10, 24290000, 10, N'msi-gamin-gf65-thin-10ue-i5.jpg', N'laptopAsus-1.png', N'laptopAsus-3.png', N'laptopAsus-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Tối ưu hóa cho mọi hoạt động từ đồ họa đến chiến game, laptop MSI GF65 Thin 10UE i5 (286VN) sẽ là người cộng sự đắc lực với thiết kế độc đáo và cấu hình mạnh mẽ, cùng bạn xông pha trên mọi chiến trường ảo.
Tự tin cùng bạn chinh chiến game với sức mạnh hiệu năng vượt trội
Xử lý mọi tác vụ văn phòng một cách ấn lượng hay thỏa mãn bạn với mọi tựa game kịch tính nhất hiện nay như Cyberpunk 2077, CS:GO, LOL, FIFA, PUBG: Battlegrounds,... nhờ hiệu năng vượt bật của bộ CPU Intel Core i5 10500H sở hữu cấu trúc 6 nhân 12 luồng, mang đến tốc độ xung nhịp cơ bản 2.50 GHz và đạt tối đa lên đến 4.5 GHz Turbo Boost.
Phiên bản laptop này mang đến cho người dùng trải nghiệm ấn tượng hơn nhờ khả năng đa nhiệm cực tốt đến từ bộ nhớ RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) với tốc độ bus RAM 3200 MHz, cho phép bạn mở và vận hành cùng lúc nhiều ứng dụng. Thêm vào đó, MSI còn hỗ trợ nâng cấp RAM tối đa lên đến 64 GB, tối ưu nhu cầu sử dụng.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Cấu hình
Máy được trang bị card đồ họa rời NVIDIA GeForce RTX 3060 Max-Q 6GB được thiết kế dựa trên kiến trúc Ampere tân tiến, cho phép người dùng thao tác mượt mà, loại bỏ tối đa các hiện tượng giật lag hay bóng ma, mang đến mọi chuyển động trơn tru kể cả game có mức cài đặt cao. Không dừng lại ở việc chiến game, laptop GF65 còn hỗ trợ bạn chỉnh sửa hình ảnh, render video,... một cách hiệu quả cùng các ứng dụng Photoshop, AI, Premiere,...
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Card đồ họa
Ổ cứng SSD 512 GB NVMe PCIe với không gian lưu trữ rộng lớn cùng khả năng truy cập và phản hồi nhanh chóng tức thời. Đồng thời, bạn có thể dễ dàng tháo rời ổ cứng và thay thế bằng thanh khác tối đa 2 TB, phục vụ tối ưu cho mọi nhu cầu của bạn.
Mở rộng bộ nhớ dễ dàng hơn nhờ laptop được trang bị thêm khe cắm SSD M.2 PCIe (nâng cấp tối đa 2 TB), cho bạn làm việc và giải trí thoải mái với không gian lưu trữ rộng lớn.', 3, N'white-img.png', 27790000, NULL, N'/ 8GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2041, N'Laptop Asus TUF Gaming FX517ZC i5', 10, 27990000, 10, N'asus-tuf-gaming-fx517zc-i5-hn077w.jpg', N'laptopAsus-3.png', N'laptopAsus-2.png', N'laptopAsus-1.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Sở hữu ngoại hình ấn tượng thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus TUF Gaming FX517ZC i5 12450H (HN077W) là lựa chọn xứng tầm cho mọi nhu cầu chiến game giải trí hay đồ hoạ - kỹ thuật của người dùng.
• Laptop Asus TUF mang hiệu năng vượt trội cho khả năng giải quyết trơn tru các tác vụ phức tạp như thiết kế hình ảnh, render video,... trên các ứng dụng nhà Adobe hay thoả sức chiến các tựa game hot như CS:GO, GTA V,... nhờ trang bị chip Intel Core i5 Alder Lake 12450H cùng card rời NVIDIA RTX 3050, 4 GB.
• RAM 8 GB chuẩn DDR5 tiên tiến, mang đến khả năng đa nhiệm mượt mà. SSD 512 GB hỗ trợ truy xuất dữ liệu nhanh, rút ngắn thời gian chờ. Ngoài ra, máy này cũng hỗ trợ nâng cấp để gia tăng năng suất làm việc của bạn.
• Màn hình 15.6 inch phủ tấm nền IPS có khả năng tái tạo màu tốt, mở rộng góc nhìn lên đến 178 độ. Công nghệ Anti Glare hỗ trợ chống chói, loá mờ trên màn hình, bảo vệ thị giác người dùng.
• Làm chủ mọi trận game, giảm độ trễ nhờ tần số quét 144 Hz kết hợp công nghệ Adaptive-Sync trên laptop Asus giúp loại bỏ những vấn đề như giật, xé hình mang lại cho bạn trải nghiệm giải trí, chơi game ổn định hơn bao giờ hết.
• Được chế tác từ vỏ nhựa cứng cáp đi kèm là sắc xám hiện đại với những đường cắt tinh xảo, khơi nguồn cảm hứng chiến game. Khối lượng chỉ 2 kg sẵn sàng bên cạnh phục vụ bạn mọi lúc, trên mọi chiến trường ảo.
• HD Webcam hỗ trợ các cuộc gọi video hay học trực tuyến dễ dàng hơn nhờ chất lượng hình ảnh ổn định. Đèn nền đơn sắc cũng được tích hợp trên bàn phím laptop.
• Đạt chuẩn Hi-Res Audio cùng công nghệ âm vòm Dolby Atmos cung cấp âm thanh sống động từ mọi hướng, lấp đầy không gian với độ rõ, chi tiết và chiều sâu đáng kinh ngạc.
• Truyền tải dữ liệu, kết nối nhanh với các thiết bị ngoại vi nhờ các cổng giao tiếp: USB 3.2 Gen 2 Type-C, 2 x USB 3.2, HDMI, LAN (RJ45), Thunderbolt 4.', 3, N'white-img.png', 28990000, NULL, N'/ 12GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2042, N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5', 10, 24190000, 10, N'lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn.jpg', N'laptopAsus-2.png', N'laptopAsus-1.png', N'laptopAsus-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) thuộc dòng laptop gaming mang vẻ đẹp ấn tượng, cuốn hút nhưng không kém phần mạnh mẽ nhờ vào CPU Intel Gen 12, sẵn sàng đồng hành cùng bạn trên mọi đấu trường game hiện nay.
Thiết kế hầm hố, cá tính với gam màu trắng cuốn hút
Lenovo IdeaPad Gaming 3 sở hữu một thiết kế góc cạnh cùng gam màu trắng pha lẫn các chi tiết xanh tạo nên một tổng thể vô cùng mạnh mẽ, hầm hố nhưng không kém phần sang trọng. Tuy có lớp vỏ từ nhựa nhưng cảm giác cầm nắm, xách lên di chuyển rất chắc chắn và không ọp ẹp.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - thiết kế
Thiết kế từ tản nhiệt của máy làm thiết bị này trở nên nổi bật hơn bao giờ, 2 khe hút gió và 2 khe tản nhiệt được đặt tinh tế đối xứng đi với tông màu xanh làm chiếc máy trông rất hầm hố và tương lai. Các trải nghiệm chơi game cũng được hệ thống tản nhiệt làm việc rất tốt giúp mình không có cảm giác bị hơi nóng tỏa ra làm khó chịu.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - khe tản nhiệt
Sở hữu cho mình cân nặng 2.315 kg và độ dày 21.8 mm, mức trọng lượng này có phần nặng hơn so với người đàn anh của mình tuy nhiên không nhiều. Với hiệu năng mạnh mẽ từ chiếc máy này, thêm một ít khối lượng cũng không làm chúng ta quá khó khăn khi di chuyển. Các thao tác gập lên, gập xuống của bản lề trên máy được hoàn thiện rất tốt, mình có thể cảm thấy được sự mượt mà và trơn tru. Tuy nhiên, bản lề chưa thật sự tạo cho mình cảm giác chắc chắn, màn hình có phần hơi rung nhẹ với các tác động.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - trọng lượng
Bàn phím của các chiếc laptop từ hãng Lenovo luôn mang đến một trải nghiệm gõ rất tuyệt vời. Với IdeaPad Gaming 3, bàn phím sử dụng layout FullSize với tông màu trắng liền mạch với màu của máy, tạo nên một tổng thể vô cùng sang trọng và bắt mắt. Hơn hết, hành trình phím và độ nảy của phím được Lenovo làm rất tốt, bạn có thể gõ văn bản hằng giờ liền mà không cảm thấy nhàm chán.', 3, N'white-img.png', 26690000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2043, N'Laptop Dell Gaming G15 5515 R5 5600H/16GB', 30, 23490000, 20, N'dell-gaming-g15-5515-r5-p105f004dgr.jpg', N'laptopAsus-1.png', N'laptopAsus-3.png', N'laptopAsus-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Bộ hiệu năng gây ấn tượng đến từ con chip AMD mạnh mẽ cùng thiết kế cá tính, nổi bật, laptop Dell Gaming G15 5515 R5 (P105F004DGR) sẽ đáp ứng tối ưu mọi nhu cầu từ các tác vụ văn phòng cơ bản đến những ứng dụng đồ họa, chơi game giải trí chuyên nghiệp.
Thiết kế đậm chất riêng, đầy ấn tượng
Laptop Dell Gaming hoàn thiện từ chất liệu nhựa cao cấp, bền bỉ, phủ gam màu xám thời thượng, thu hút bạn từ cái nhìn đầu tiên, thích hợp với đa dạng đối tượng người dùng bởi phong cách gaming hiện đại, không quá hầm hố.
Khối lượng 2.8 kg và độ dày 26.9 mm tạo cảm giác cứng cáp hơn cho máy, nhưng vẫn vừa vặn nằm gọn trong balo, tiện lợi cùng bạn di chuyển mọi lúc mọi nơi để học tập, làm việc cũng như chơi game giải trí hoàn hảo.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Thiết kế
Bàn phím có khoảng cách rộng rãi, hợp lý với hành trình phím sâu, nút bấm êm, độ nảy tốt tạo cảm giác nhạy bén, chuẩn xác, thoải mái khi nhập liệu, soạn thảo. Đặc biệt, trang bị đèn nền đơn sắc nổi bật tích hợp dưới bàn phím tạo thêm điểm nhấn cho chiếc laptop này vừa giúp người dùng thuận tiện làm việc hay chiến game ở những nơi thiếu sáng.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Bàn phím
Laptop Dell trang bị đa dạng các cổng kết nối thông dụng bao gồm: 2 x USB 2.0, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 3.2, USB Type-C giúp liên kết dễ dàng và truyền tải dữ liệu nhanh chóng đến các thiết bị ngoại vi tương thích như màn hình rời, máy chiếu, loa, chuột, máy in,... 
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Cổng kết nối
Hai chuẩn kết nối không dây Bluetooth 5.2, Wi-Fi 6 (802.11ax) cho tốc độ truyền tệp nhanh, giảm độ trễ giảm, đảm bảo cho đường truyền internet của bạn luôn trong trạng thái ổn định, hạn chế xảy ra hiện tượng ngắt quãng giữa chừng.
Chơi game cực mượt với hiệu năng vượt trội.', 3, N'white-img.png', 26690000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2044, N'Laptop Lenovo Gaming Legion 5 15ACH6 R5', 5, 23790000, 10, N'lenovo-gaming-legion-5-15ach6-r5-82jw00klvn.jpg', N'laptopAsus-2.png', N'laptopAsus-3.png', N'laptopAsus-1.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Với phong cách thiết kế độc đáo cùng card đồ họa NVIDIA GeForce mạnh mẽ, laptop Lenovo Gaming Legion 5 15ACH6 (82JW00KLVN) đáp ứng tốt mọi tác vụ từ học tập, văn phòng nhẹ nhàng đến đồ họa, kỹ thuật chuyên sâu.
• Xử lý mọi nhu cầu làm việc hay giải trí cơ bản nhờ bộ vi xử lý AMD Ryzen 5 5600H, hỗ trợ bạn chiến các tựa game như CS:GO, GTA V, PUBG, LOL,... với card đồ họa rời NVIDIA GeForce RTX3050 4 GB mạnh mẽ.
• Laptop AMD Ryzen 5 trang bị bộ nhớ RAM 8 GB cho phép bạn mở hàng loạt cửa sổ ứng dụng cùng lúc, ổ cứng SSD 512 GB cùng khe cắm SSD M.2 PCIe mở rộng mang đến không gian lưu trữ tốt, đáp ứng tối đa nhu cầu công việc. 
• Laptop gaming có tần số quét 165 Hz cho độ trễ thấp, màn hình 100% sRGB cùng công nghệ Dolby Vision tái tạo các gam màu sắc một cách chuẩn xác, tươi mới.
• Laptop màn hình 15.6 inch cùng tấm nền IPS hiện đại cho góc nhìn bao quát. Độ phân giải Full HD (1920 x 1080) và công nghệ Anti Glare cung cấp chất lượng hình ảnh rõ nét, bảo vệ thị giác người xem, giảm thiểu hiện tượng chói.
• Laptop Lenovo Gaming Legion sở hữu thiết kế độc đáo với chiếc logo nổi bật trên lớp vỏ nhựa bền chắc, khối lượng 2.4 kg luôn trong tư thế sẵn sàng chiến đấu bất cứ khi nào bạn cần.
• Máy được trang bị công tác khóa camera hiện đại. Laptop Lenovo còn trang bị đèn nền phím đơn sắc cho phép bạn làm việc hay chiến game ngay cả trong môi trường thiếu sáng.
• Đa dạng các cổng kết nối hiện đại được trang bị trên laptop như 1 x USB 3.2, 2 x USB Type-C, 3 x USB 3.2, HDMI và LAN (RJ45).', 3, N'white-img.png', 26690000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2045, N'Laptop HP 240 G8 i3 1005G1/4GB/512GB', 5, 9590000, 10, N'hp-240-g8-i3-519a8pa-021121-045431-600x600.jpg', N'laptopAsus-3.png', N'laptopAsus-1.png', N'laptopAsus-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Laptop HP 240 G8 i3 (519A8PA) là chiếc máy tính xách tay học tập căn bản với thiết kế đơn giản thanh lịch, cấu hình ổn và một mức giá tốt, là người bạn đồng hành lý tưởng cho học sinh, sinh viên.
Thiết kế đơn giản, trang nhã
Chiếc laptop HP có vỏ ngoài bằng nhựa với tông màu bạc hiện đại, bo cạnh mềm mại, logo hãng kim loại tạo điểm nhấn tinh tế, cho tổng thể sản phẩm trang nhã, cùng với khối lượng chỉ 1.47 kg và độ dày máy 19.9 mm dễ dàng để bạn mang theo sử dụng.
HP 240 G8 i3 1005G1 (519A8PA) - Thiết kế
Thiết kế bàn phím với hệ phím nhấn êm, khoảng cách tốt, độ nhạy cao, bề mặt nhám chống bám vân tay tốt, cho người dùng thao tác nhanh thật chuẩn xác.
HP 240 G8 i3 1005G1 (519A8PA) - Bàn phím
Bảo mật an toàn hơn với chip TPM 2.0 không những bạn có thể nâng cấp lên hệ điều hành mới Windows 11 mà còn ngăn chặn được việc hacker hay tin tặc xâm nhập vào các dữ liệu trên máy tính của bạn.
HP 240 G8 i3 1005G1 (519A8PA) - TPM 2.0
Laptop hỗ trợ đầy đủ các cổng giao tiếp cần thiết cho nhu cầu học tập, văn phòng, bao gồm cổng SuperSpeed USB A x 2, HDMI, jack tai nghe 3.5 mm, LAN (RJ45), USB Type-C. Kết nối không dây Bluetooth 4.2 và Wi-Fi 802.11 a/b/g/n/ac với đường truyền tốc độ cao, ổn định, không lo đứt kết nối khi đang học tập, làm việc hay giải trí.
HP 240 G8 i3 1005G1 (519A8PA) - Cổng kết nối
Ngoài ra, HD Webcam sẽ hỗ trợ tích cực cho nhu cầu học tập nhóm online, các buổi đàm thoại trực tuyến trên Zoom, Zalo, Google Meet, Microsoft Teams,...
HP 240 G8 i3 1005G1 (519A8PA) - Webcam
Hiệu năng tốt, đáp ứng nhu cầu học tập, văn phòng cơ bản.', 3, N'hot-icon.gif', 9880000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2047, N'Máy tính bảng Lenovo Tab M8', 5, 3990000, 10, N'lenovo-tab-m8-tb-8505x400x400-600x600.jpg', N'ipad-1.png', N'ipad-2.png', N'ipad-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Lenovo Tab M8 chiếc máy tính bảng giá rẻ, cấu hình ổn, thiết kế cao cấp trong tầm giá, hoàn toàn phù hợp với các nhu cầu cơ bản như đọc báo, xem phim, lướt web hằng ngày.
Thiết kế đơn giản, tinh tế
Máy tính bảng Lenovo Tab M8 có thiết kế cao cấp nhờ mặt lưng được làm bằng chất liệu nhựa nguyên khối, chắc chắn cho cảm giác cầm nắm vô cùng thích.
Máy tính bảng Lenovo Tab A22 | Thiết kế vỏ nhựa nguyên khối
Màn hình kích thước 8 inch nhỏ gọn, với tỉ lệ hiển thị đến 83% nhờ các cạnh viền được làm khá mỏng cho không gian hiển thị được nhiều thông tin mà nhưng vẫn cho trải nghiệm cầm nắm nhẹ nhàng, dễ dàng thao tác.
Máy tính bảng Lenovo sở hữu màn hình IPS LCD với độ phân giải 1280 x 800 Pixels , cho chất lượng hiển thị tốt, mặc dù không quá xuất sắc nhưng đủ dùng cho các nhu cầu cơ bản.Máy tính bảng Lenovo Tab A22 | Hiển thị rõ ràng ở mọi góc nhìn
Bằng việc tích hợp 2 loa ngoài cùng với công nghệ âm thanh Dolby Audio, giúp trải nghiệm xem phim, nghe nhạc trên chiếc máy tính bảng Lenovo này thêm sống động, tuyệt vời.
Hiệu năng ổn định cho các nhu cầu cơ bản hằng ngày
Lenovo Tab M8 sử dụng vi xử lý MediaTek Helio A22 với 4 nhân tốc độ 2.0 Ghz. Máy tính bảng có RAM 3 GB có thể đáp ứng đủ nhu cầu cơ bản, từ lướt web, xem phim, thậm chí chơi game.
Với cấu hình này máy chỉ có thể chơi các tựa game nhẹ như: Candy Crush, Plants vs Zombies 2, Minecraft: Pocket Edition,... hay xử lý các tác vụ văn phòng nhẹ.', 4, N'white-img.png', 4090000, NULL, N'/ 8GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2048, N'Máy tính bảng Nokia Tab T20 4G', 10, 4990000, 20, N'nokia-t20-2-600x600.jpg', N'ipad-2.png', N'ipad-3.png', N'ipad-1.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Máy tính bảng Nokia đánh dấu sự trở lại của hãng trên thị trường tablet sau nhiều năm vắng bóng bằng việc ra mắt Nokia Tab T20 máy có thiết kế kim loại sang trọng, hiệu năng ổn định cùng màn hình hiển thị sắc nét, mang đến một lựa chọn không thể bỏ qua trong phân khúc.
Thiết kế bền bỉ
Máy có thiết kế cứng cáp với mặt lưng được hoàn thiện từ kim loại mang đến cái nhìn sang trọng và đẳng cấp hơn trên một chiếc tablet, mặt lưng cũng được gia công hoàn thiện mờ giúp hạn chế bám dấu vân tay trong quá trình sử dụng hàng ngày.
Máy có thiết kế vuông vắn - Nokia Tab T20
Cạnh viền sản phẩm được Nokia thiết kế bo cong giúp mang lại cảm giác cầm nắm thoải mái, hạn chế các trường hợp cấn tay khi sử dụng thiết bị trong một khoảng thời gian dài.
Máy được bo cong cạnh viền - Nokia Tab T20
Sở hữu camera đơn 8 MP
Với camera 8 MP giúp người dùng ghi lại những khoảnh khắc đời thường hay phong cảnh với độ chi tiết tương đối ổn, hỗ trợ rất tốt cho các tác vụ chụp ảnh tài liệu, văn bản hay các nội dung không đòi hỏi độ chi tiết quá cao.
Đèn LED trang bị được đặt chung cụm với camera chính mang lại khả năng chụp ảnh tốt hơn trong những môi trường thiếu sáng hay sử dụng như một chiếc đèn pin cực kỳ tiện ích.
Trang bị đèn LED - Nokia Tab T20
Ở mặt trước, máy tính bảng Nokia Tab T20 4 GB có một camera với độ phân giải 5 MP hỗ trợ hình ảnh tốt hơn cho các tác vụ video call hay sử dụng các công cụ họp nhóm trực tuyến như: Google Meet, Zoom,... với hình ảnh chủ thể được đặt giữa khung hình khi sử dụng thiết bị nằm ngang.
Camera trước 5 MP - Nokia Tab T20.', 4, N'white-img.png', 5190000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2049, N'Máy tính bảng Samsung Galaxy Tab S7 FE WiFi', 5, 12990000, 0, N'samsung-galaxy-tab-s7-fe-wifi-600x600.jpg', N'ipad-2.png', N'ipad-1.png', N'ipad-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Samsung Galaxy Tab S7 FE WiFi - được Samsung cho ra mắt với vô vàn tính năng cùng nhiều ưu điểm nổi bật so hơn với các đối thủ trong tầm giá, tablet hỗ trợ bút S Pen nhằm phục vụ các công việc của bạn trở nên dễ dàng hay hiệu suất mạnh mẽ trên một con chip gaming đến từ nhà Qualcomm, khiến nó trở thành một sự lựa chọn không thể bỏ qua đối với người dùng.
Thiết kế sang trọng
Với lối thiết kế nguyên khối (unibody) cùng các cạnh được tạo dáng vuông vắn khiến cho Samsung Galaxy Tab S7 FE WiFi trở nên sang trọng khi cầm nắm trên tay bởi sự đơn giản và tinh tế trên một máy tính bảng chỉ nhẹ 610 g và mỏng 6.3 mm.
Samsung Galaxy Tab S7 FE WiFi
Với kích thước màn hình lên đến 12.4 inch mang lại không gian làm việc rộng lớn giúp bạn thỏa sức sáng tạo và làm việc hiệu quả hay giải trí tốt hơn khi máy đem đến khả năng bao quát tầm nhìn lớn trên các tác vụ chơi game, đắm chìm trong những khung hình khi thưởng thức các bộ phim bom tấn.
Samsung Galaxy Tab S7 FE WiFi
Với độ phân giải 1600 x 2560 pixels sử dụng công nghệ màn hình TFT cùng với 16 triệu màu giúp cho hình ảnh hiển thị được sắc nét và rực rỡ trên một máy tính bảng màn hình kích thước lớn.
Samsung Galaxy Tab S7 FE WiFi
Hỗ trợ chụp ảnh với camera 8 MP
Samsung đã trang bị trên máy cụm camera sau có độ phân giải 8 MP. Hỗ trợ quay video ở chế độ Full HD (1920 x 1080) 30 fps, giúp bạn ghi lại những nội dung công việc quan trọng hay các khung cảnh hàng ngày một cách tốt hơn.
Samsung Galaxy Tab S7 FE WiFi
Máy tính bảng Samsung Galaxy Tab S7 FE WiFi có camera trước 5 MP được trang bị, mang đến khả năng ghi hình trong các cuộc họp online hay video call,... với chất lượng hình ảnh mang lại khá tốt so với các đối thủ trong cùng tầm giá.
Samsung Galaxy Tab S7 FE WiFi.', 4, N'white-img.png', 14490000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2050, N'Máy tính bảng Huawei MatePad T10', 5, 4990000, 10, N'huawei-matepad-t10-1-600x600.jpg', N'ipad-3.png', N'ipad-2.png', N'ipad-1.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'Huawei MatePad T10 là một chiếc máy tính bảng có hiệu năng mạnh mẽ, màn hình lớn, đa năng với các tính năng bảo vệ người dùng, một lựa chọn thú vị với những người muốn tìm kiếm một chiếc máy tính bảng giá mềm dành cho gia đình.
Sản phẩm chạy hệ điều hành Android trên nền tảng Huawei Mobile Service (HMS):
- Tải ứng dụng trên cửa hàng Huawei AppGallery thay cho CH Play.
- Ngoài ra, khách hàng có thể tìm ứng dụng bằng Petal Search nếu các ứng dụng không có sẵn trên Huawei AppGallery.
- Không cài đặt sẵn các ứng dụng / game sử dụng dịch vụ, tài khoản Google như: Google Maps, Google Drive, Gmail,...
- Hướng dẫn cài đặt ứng dụng cho thiết bị Huawei.
Thiết kế nguyên khối, mức độ hoàn thiện cao
Máy tính bảng Huawei có thiết kế nguyên khối với mặt lưng có màu đơn sắc giúp máy có phần đơn giản nhưng vẫn toát lên vẻ sang trọng và lịch lãm. 
Máy tính bảng Huawei MatePad T10 | Thiết kế nguyên khối, mức độ hoàn thiện cao
Mức độ hoàn thiện máy khá tốt, cho cảm nhận cứng cáp, các chi tiết ghép nối được gắn kết với nhau một cách chính xác, dường như không có khe hở gây mất thẩm mỹ cho máy.
Máy tính bảng Huawei MatePad T10 | Thiết kế gọn nhẹ dễ dàng mang đi bất cứ đâu.', 4, N'white-img.png', 5220000, NULL, N'/ 12GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2051, N'Máy tính bảng Samsung Galaxy Tab S8', 2, 20990000, 10, N'samsung-galaxy-tab-s8-white-thumb-600x600.jpg', N'ipad-1.png', N'ipad-3.png', N'ipad-2.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Samsung Galaxy Tab S8 ra mắt và vẫn giữ được đặc trưng của dòng máy tính bảng Galaxy Tab S với cấu hình mạnh mẽ, màn hình hiển thị ổn cùng khả năng hỗ trợ bút S Pen hỗ trợ học tập làm việc tốt hơn.
Thiết kế đặc trưng Galaxy Tab S
Xét về mặt ngoại hình thì máy tính bảng Samsung Galaxy Tab S8 thừa hưởng những thiết kế nổi bật của Tab S7, về tổng thể thì Tab S8 là phiên bản nâng cấp phần cứng bên trong so với Tab S7.
Thiết kế đặc trưng - Samsung Galaxy Tab S8
Toàn bộ phần thân máy vẫn được làm từ kim loại nguyên khối sang trọng, đi cùng với viền màn hình mỏng, đem lại cảm giác hiện đại cũng như rộng rãi trong quá trình sử dụng.
Galaxy Tab S8 cũng được trang bị bút S Pen cải tiến mới, có độ nhạy 6.2 ms cho cảm giác giống như đang viết trên giấy.
Hỗ trợ bút S Pen - Samsung Galaxy Tab S8
Mạnh mẽ với chip Snapdragon
Tab S8 sử dụng CPU Snapdragon 8 Gen 1 mới, mang lại hiệu năng cực kỳ ổn định và vấn đề nhiệt độ đã được giải quyết và được kiểm soát hơn vì kích thước máy tính bảng khá lớn khi so với điện thoại, giúp khả năng tản nhiệt được tốt hơn.
Máy tính bảng có RAM 8 GB nên mọi tác vụ của bạn sẽ được khởi chạy mượt mà, đa nhiệm tốt hơn. Bộ nhớ trong 128 GB có hỗ trợ mở rộng qua thẻ Micro SD.
Hiệu năng mạnh mẽ - Samsung Galaxy Tab S8.', 4, N'white-img.png', 22990000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2052, N'Máy tính bảng Samsung Galaxy Tab A7 Lite', 5, 3990000, 20, N'samsung-galaxy-tab-a7-lite-gray-600x600.jpg', N'ipad-1.png', N'ipad-2.png', N'ipad-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Máy tính bảng Samsung Galaxy Tab A7 Lite là phiên bản rút gọn của dòng tablet "ăn khách" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền.
Thiết kế siêu mỏng nhẹ
Galaxy Tab A7 Lite sở hữu kiểu thiết kế đặc trưng của dòng Galaxy Tab A7. Thiết bị sử dụng chất liệu nhôm với thiết kế nguyên khối giúp cho máy trở nên cao cấp hơn dù chỉ thuộc phân khúc tầm trung giá rẻ.
Galaxy Tab A7 Lite | Thiết kế mặt lưng
Tuy được hoàn thiện từ nhôm nguyên khối, nhưng Galaxy Tab A7 Lite vẫn có độ mỏng nhẹ ấn tượng khi chỉ nặng 371 g và dày chỉ 8 mm, mang đến sự thoải mái khi cầm sử dụng trong thời gian dài.
Galaxy Tab A7 Lite | Thiết kế cạnh viền
Với kích thước chỉ tương đương với một quyển sổ nên Galaxy Tab A7 Lite sẽ vô cùng gọn gàng để bạn có thể mang theo khi cần thiết.
Galaxy Tab A7 Lite | Thiết kế gọn ràng, cầm nắm thoải mái
Màn hình lớn hiển thị nhiều hơn, rõ hơn
Máy tính bảng Galaxy Tab A7 Lite có màn hình kích thước 8.7 inch, độ phân giải cao 800 x 1340 pixel, cho chất lượng hiển thị khá, màu sắc tươi tắn, màn hình lớn sẽ giúp bạn xem được nhiều nội dung hơn, thoải mái kéo thả, chỉnh sửa hình ảnh, văn bản dễ dàng.
Galaxy Tab A7 Lite | Trang bị màn hình kích thước lớn 8.7 inch.', 4, N'white-img.png', 4190000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2054, N'Máy tính bảng iPad Pro M1 11 inch', 10, 41990000, 40, N'pad-pro-m1-11-inch-wifi-cellular.jpeg', N'ipad-3.png', N'ipad-2.png', N'ipad-1.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Trải nghiệm khung hình sống động cùng cảm giác chạm vuốt cực mượt
Máy tính bảng iPad Pro M1 11 inch WiFi Cellular 1TB (2021) thiết kế hình hộp vát cạnh vuông vức, hiện đại với thân máy bằng kim loại chắc chắn, hoàn thiện tỉ mỉ và sang trọng, trọng lượng nhẹ, kích cỡ hợp lý thuận tiện sử dụng và mang theo.
Màn hình 11 inch sử dụng tấm nền Liquid Retina cho khung hình iPad hiển thị rực rỡ, sống động, chân thực, độ phân giải đạt 1668 x 2388 Pixels hiển thị chi tiết sắc nét, kết hợp cạnh viền mỏng cho không gian trải nghiệm màn hình thật đã mắt.
Màn hình cao cấp - iPad Pro M1 11 inch WiFi Cellular 1TB (2021)
Công nghệ ProMotion hỗ trợ tần số quét tối đa 120 Hz cho cảm giác chạm vuốt cực mượt, các chi tiết chuyển động trên màn hình liền mạch, trơn tru, nhờ đó trải nghiệm được tối ưu, đặc biệt khi sử dụng màn hình cho tác vụ đồ họa hay cho các tựa game hành động, không bỏ lỡ cơ hội ghi điểm.
Chinh phục mọi tác vụ với sức mạnh từ chip M1
Sức mạnh hiệu năng trên iPad Pro M1 đạt được nhờ sự cộng hưởng của chip Apple M1 8 nhân mạnh mẽ và chip đồ họa Apple GPU và RAM 16 GB. Hiệu quả đa nhiệm mượt mà, duy trì sự ổn định của máy cả khi sử dụng trên các tác vụ nặng như đồ họa, chơi game trực tuyến,… Đồng thời, với bộ nhớ trong đến 1 TB, thật thoải mái để lưu trữ tất cả tài liệu và kho ảnh chụp, video yêu thích lên thiết bị cá nhân này.
Sức mạnh ấn tượng - iPad Pro M1 11 inch WiFi Cellular 1TB (2021)
Máy hỗ trợ 5G cho tốc độ kết nối cực nhanh để bạn có thể tải dữ liệu, xem video, thực hiện các tác vụ trực tuyến mượt mà.
Thỏa sức sáng tạo cùng cụm camera xịn sò.', 4, N'white-img.png', 42990000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2055, N'Máy tính bảng iPad Pro M2 12.9 inch', 10, 35990000, 30, N'ipad-pro-m2-129-wifi-cellular-128gb-231022.jpg', N'ipad-2.png', N'ipad-1.png', N'ipad-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Apple đang ngày càng bỏ xa nhiều đối thủ về mặt hiệu năng trên các dòng tablet, điều này được minh chứng cụ thể bằng sự xuất hiện của con chip Apple M2 siêu mạnh mẽ trên iPad Pro M2 12.9 inch WiFi Cellular 128GB. Bên cạnh đó thì máy còn có những nâng cấp như hệ điều hành iPadOS 16, viên pin 40.88 Wh.
Tinh tế trên từng đường nét thiết kế
Về ngoại hình của iPad Pro M2 sẽ có nét tương đồng với thế hệ trước khi thừa hưởng gần như toàn bộ vẻ đẹp vốn đã rất tốt và không cần phải nâng cấp gì thêm cả, vẫn là mặt lưng phẳng và các cạnh được vát phẳng tinh tế cùng 4 góc máy bo cong. Đi kèm với đó là bộ khung và cả phần mặt sau đều được làm từ kim loại bền bỉ.
Thiết kế sang trọng - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Các phím bấm nguồn và tăng/giảm âm lượng sẽ được đặt ở vị trí gần cụm camera, vậy nên người dùng có thể thuận tiện hơn trong việc ấn phím nhằm hạn chế tình trạng với tay mỗi khi thao tác.
Nổi bật nhất trên phần mặt lưng sẽ là logo hình quả táo sáng bóng được Apple bố trí ngay trung tâm, đây có thể coi là đặc điểm nhận diện dễ dàng giúp người dùng có thể tăng thêm phần đẳng cấp mỗi khi sử dụng máy tính bảng iPad Pro M2.
Sức mạnh đáng kinh ngạc đến từ thế hệ chip mới
Đúng như dự đoán từ trước trên nhiều diễn đàn công nghệ thì Apple M2 sẽ xuất hiện ở thế hệ máy tính bảng iPad mới nhất của hãng trong năm 2022, thiết bị này làm người dùng cực kỳ thỏa mãn khi chờ đợi mua iPad Pro M2.
Thế hệ chip mới này khi được trang bị trên iPad Pro M2 sẽ có 8 lõi CPU và 10 lõi GPU, điều này giúp tăng cường hiệu suất thêm 15% và 35% về tác vụ xử lý đồ họa khi so với Apple M1.', 4, N'white-img.png', 45590000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2056, N'Máy tính bảng iPad Pro M1 12.9 inch', 5, 29290000, 40, N'ipad-pro-2021-129-inch-gray-600x600.jpg', N'ipad-3.png', N'ipad-1.png', N'ipad-2.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Bạn có đang mong chờ những sản phẩm chất lượng đến từ Apple? Sau hàng loạt các sản phẩm đình đám như iPhone 12 series thì hãng đã tung ra chiếc iPad Pro M1 12.9 inch Wifi Cellular 128GB (2021) trang bị những tính năng ngày càng vượt trội và thời thượng.
Màn hình Liquid Retina XDR 12.9 inch rực rỡ
iPad Pro M1 12.9 inch 2021 sở hữu màn hình Liquid Retina XDR mini-LED LCD, áp dụng công nghệ mini-LED với 10.000 bóng được tuỳ chỉnh nhỏ hơn 120 lần so với thế hệ trước nên độ sáng có thể lên đến 1600 nits ngay cả ngoài trời vẫn có thể sử dụng tốt.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Sở hữu màn hình Liquid Retina XDR, áp dụng công nghệ mini-LED
Màn hình có kích thước 12.9 inch cung cấp chế độ xem mở rộng hơn, trải nghiệm HDR tuyệt đẹp trên màn hình rõ ràng giúp cho mọi hoạt động, thao tác trên máy thêm cuốn hút và đắm chìm theo thời gian.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Màn hình có kích thước 12.9 inch cùng trải nghiệm HDR tuyệt đẹp
Mọi chi tiết hiển thị trên màn hình sống động như thật với tỷ lệ tương phản 1.000.000: 1 cùng các công nghệ tiên tiến như P3 wide color, True Tone và ProMotion giúp iPad Pro 12.9 inch 2021 tỏa sáng ngoạn mục.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Màn hình trang bị nhiều công nghệ tiên tiến.', 4, N'white-img.png', 33390000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2057, N'Máy tính bảng iPad Air 5 M1 Wifi Cellular 64GB', 20, 20490000, 10, N'ipad-air-5-m1-wifi-cellular-64gb-09032.jpg', N'ipad-1.png', N'ipad-3.png', N'ipad-2.png', N'4sao.png', CAST(N'1900-01-01' AS Date), N'So với chiếc iPad Air 5 M1 Wifi 64GB thì chiếc iPad Air 5 M1 Wifi Cellular 64GB đã có một điểm khác biệt đáng kể đó là phương thức kết nối khi bạn vừa có thể sử dụng Wifi và vừa sử dụng mạng di động một cách bình thường nhưng vẫn cho một trải nghiệm rất tuyệt vời.
Màn hình to, xem phim, làm việc đã hơn
Máy tính bảng được trang bị một màn hình lớn lên đến 10.9 inch vừa đủ không quá to những cũng không nhỏ cho bạn dễ dàng trải nghiệm, sử dụng. Đi kèm với đó chiếc màn hình Retina IPS LCD này sẽ mang lại cho bạn những trải nghiệm về màu sắc tốt hơn.
Trải nghiệm siêu đã với màn hình lớn - iPad Air 5 M1 Wifi Cellular 64
Thiết kế thời thượng
Thiết kế gọn nhẹ và được Apple làm vuông vức ở các cạnh mang lại cảm giác sang trọng, đẳng cấp, nhiều người dùng rất thích điều này. Màu sắc đa dạng cũng sẽ giúp bạn có nhiều sự lựa chọn phù hợp để sử dụng hơn.
Thiết kế thời thượng - iPad Air 5 M1 Wifi Cellular 64GB
Hiệu năng mạnh mẽ.', 4, N'white-img.png', 24490000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2058, N'Đồng hồ MATHEY TISSOT 30 mm Nữ D450ABU', 10, 1527000, 10, N'mathey-tissot-d450abu-nu-1-1-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Mang kiểu dáng nữ tính và thanh lịch, sản phẩm dành cho các quý cô dịu dàng, quý phái
Là một sản phẩm của hãng đồng hồ Mathey Tissot của Thụy Sĩ, chiếc đồng hồ nữ Mathey Tissot D450ABU mang nhiều ưu điểm đến từ hãng đồng hồ lớn.
Đồng hồ nữ Mathey Tissot D450ABU có thiết kế thanh lịch
Có lớp vỏ bên ngoài bền chắc
- Mặt kính của mẫu đồng hồ kim này có độ trong suốt cao, cứng cáp, dễ dàng đánh bóng khi trầy xước nhẹ.
- Chiếc đồng hồ nữ này được trang bị khung viền cứng cáp, chống ăn mòn, chống oxy hóa hiệu quả, hạn chế hư hỏng cho đồng hồ.
Đồng hồ nữ Mathey Tissot D450ABU có mặt kính cứng cáp, khung viền chắc chắn
Có thông số chống nước 5 ATM, yên tâm đeo đồng hồ khi đi mưa, tắm rửa, không đeo đồng hồ khi bơi lội và lặn.', 5, N'white-img.png', 1887000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2059, N'Đồng hồ ADRIATICA 36 mm Nữ A3812.1183QZ', 5, 2320000, 15, N'adriatica-a38121183qz-1-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Thiết kế chiếc đồng hồ kim sang trọng với các chữ số La Mã cổ điển, thích hợp với các cô nàng quý phái, thời thượng
Đồng hồ nữ Adriatica A3812.1183QZ mang thương hiệu Adriatica của Thụy Sĩ, sẽ khiến bạn hài lòng về chất lượng mà mẫu đồng hồ quartz này đem lại.
Đồng hồ nữ Adriatica A3812.1183QZ với thiết kế nữ tính và tinh tế
Kết cấu của chiếc đồng hồ nữ chắc chắn và bền bỉ
- Mặt kính trong suốt với độ cứng cực cao, giúp chống trầy xước và chống nứt vỡ hiệu quả và tối ưu.
- Khung viền sáng bóng bền bỉ nhờ khả năng chống ăn mòn và chống oxi hóa cao, khả năng chịu va đập tốt.
Đồng hồ nữ Adriatica A3812.1183QZ có lớp vỏ ngoài bền chắc
Mẫu đồng hồ Adriatica nữ này có hệ số chống nước 30m, an toàn khi rửa tay và đi mưa, không nên đeo khi đi tắm hay bơi lội
Đồng hồ nữ Adriatica A3812.1183QZ có hệ số chống nước 3 ATM.', 5, N'white-img.png', 2520000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2060, N'Đồng hồ MATHEY TISSOT 30 mm Nữ D450BI', 3, 1698000, 35, N'mathey-tissot-d450bi-nu-1-1-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Sang trọng và thanh lịch với sự phối màu hài hòa, thích hợp cho các quý cô nữ tính và quý phái
Đồng hồ nữ Mathey Tissot D450BI là một sản phẩm của hãng đồng hồ Mathey Tissot của Thụy Sĩ, nổi tiếng với nhiều chiếc đồng hồ sang trọng.
Đồng hồ nữ Mathey Tissot D450BI có thiết kế trẻ trung
Hạn chế hư hỏng khi va chạm
- Mặt kính khoáng của mẫu đồng hồ kim này có độ trong suốt cao, cứng cáp, cho khả năng hạn chế trầy xước tốt.
- Chiếc đồng hồ nữ này được trang bị khung viền cứng cáp, chống ăn mòn, bảo vệ tốt các chi tiết máy bên trong.
Đồng hồ Nữ Mathey Tissot D450BI - Mặt kính khoáng, khung viền thép
Có thông số chống nước 5 ATM, yên tâm đeo đồng hồ khi đi mưa, tắm rửa, không đeo đồng hồ khi bơi lội và lặn
Đồng hồ nữ Mathey Tissot D450BI có hệ số chống nước 5 ATM.', 5, N'white-img.png', 1998000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2061, N'Đồng hồ ADRIATICA 36 mm Nữ A3812.5183Q', 5, 2220000, 10, N'adriatica-a3812-5183q-nu-1-1-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Chiếc đồng hồ này mang màu sắc sang trọng, hiện đại, phù hợp với các quý cô trẻ trung, quý phái
Mang thương hiệu đồng hồ Adriatica nổi tiếng của Thụy Sĩ, đồng hồ nữ Adriatica A3812.5183Q sẽ khiến bạn an tâm về chất lượng của nó.
Đồng hồ nữ Adriatica A3812.5183Q với thiết kế nữ tính, sang trọng
Trang bị lớp vỏ bền bỉ, chịu lực tốt
- Mặt kính cao cấp có độ trong suốt cao, độ cứng cao, khó trầy xước khi có va chạm mạnh.
- Khung viền của mẫu đồng hồ kim này có độ bền cao, chống ăn mòn, dễ dàng đánh bóng như mới khi bị trầy xước.
Đồng hồ nữ Adriatica A3812.5183Q sở hữu mặt kính Sapphire, khung viền bằng thép chống gỉ
Hệ số chống nước 3 ATM, thoải mái đeo đồng hồ khi rửa tay, đi mưa mà không lo vào nước, không mang đồng hồ khi tắm hay bơi, lặn
Đồng hồ nữ Adriatica A3812.5183Q có độ chống nước 3 ATM
Chiếc đồng hồ Adriatica nữ này được tích hợp lịch ngày giúp bạn làm chủ thời gian của mình.', 5, N'white-img.png', 2520000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2062, N'Đồng hồ Q&Q 28.5 mm Nữ S393J212Y', 5, 293000, 20, N'q-q-s393j212y-nu-1-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Là mẫu đồng hồ kim có kiểu dáng hiện đại, tinh tế, dành riêng cho các cô nàng thanh lịch, nữ tính
Đồng hồ nữ Q&Q S393J212Y đến từ thương hiệu đồng hồ Q&Q uy tín và chất lượng của Nhật Bản.
Đồng hồ nữ Q&Q S393J212Y có kiểu dáng sang trọng
Bộ khung bền chắc, chịu va đập hiệu quả
- Mặt kính của chiếc đồng hồ nữ này có độ trong suốt cao, chịu lực tốt, dễ dàng đánh bóng như mới khi bị trầy xước.
- Khung viền mẫu đồng hồ quartz này cứng cáp, chống ăn mòn, thoải mái lau chùi, vệ sinh khi bị bám bụi bẩn.
Đồng hồ nữ Q&Q S393J212Y có mặt kính cứng cáp, khung viền chống ăn mòn
Người dùng yên tâm đeo đồng hồ khi tắm, đi mưa vì nó có hệ số chống nước 50m, không mang khi bơi, lặn
Đồng hồ nữ Q&Q S393J212Y có hệ số chống nước 5 ATM.', 5, N'white-img.png', 313000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2063, N'Đồng hồ CASIO 39.7 mm Nam AE-1200WHD-1AVDF', 5, 1029000, 10, N'casio-ae-1200whd-1avdf-bac-6-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'- Thương hiệu đồng hồ Casio của Nhật Bản, uy tín và chất lượng nổi tiếng thế giới
- Chiếc đồng hồ nam có đường kính mặt 39.7 mm, độ rộng dây 24.3 mm, phù hợp kích thước cổ tay trung bình
- Khung viền nhựa chắc chắn, chống va đập hiệu quả, dây đeo hợp kim chống ăn mòn tốt, độ bền cao
- Thoải mái đeo đồng hồ đi tắm, bơi lội với độ chống nước tới 10 ATM, không nên mang khi lặn
- Đồng hồ sở hữu các tiện ích: Lịch thứ, ngày, báo thức và bấm giờ thể thao
- Trang bị đèn nền giúp bạn xem giờ trong bóng tối', 5, N'white-img.png', 1429000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2064, N'Đồng hồ Casio 34 mm Nữ LTP-VT01L-5BUDF', 10, 855000, 10, N'casio-ltp-vt01l-5budf-nu-thumbb-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'• Đây là món phụ kiện thời trang lý tưởng đến từ hãng đồng hồ Casio nổi tiếng của Nhật Bản. Nổi bật với thiết kế đơn giản và tinh tế phù hợp với mọi cô nàng.
• Đồng hồ Casio 34 mm nữ LTP-VT01L-5BUDF sở hữu đường kính mặt 34 mm.
• Khung viền được làm từ thép không gỉ bền bỉ với thời gian, chống oxi hoá, chống chịu mọi thời tiết. Dây đeo đồng hồ được làm từ da tổng hợp, tạo cảm giác thoải mái khi đeo, ôm sát cổ tay.
• Thoải mái khi rửa tay mà không lo hư hỏng vì đồng hồ nữ này có hệ số kháng nước là 1 ATM. Không nên đeo khi đi tắm, đi bơi, lặn.', 5, N'white-img.png', 905000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2065, N'Đồng hồ G-SHOCK 45.4 mm Nam GM-2100-1ADR', 10, 5440000, 15, N'g-shock-gm-2100-1adr-nam-1-1-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'• Vừa bóng bẩy, sắc nét lại vừa táo bạo với chiếc đồng hồ G-Shock tiêu chuẩn, của thương hiệu Casio nổi tiếng và uy tín Nhật Bản. Chiếc đồng hồ này thực sự được xem như là một món thời trang thực thụ vì vẻ ngoài được thiết kế cực kì và ấn tượng.
• Mẫu đồng hồ G-SHOCK 45.4 mm Nam GM-2100-1ADR có đường kính mặt 45.4 mm, độ rộng dây là 25.7 mm. Gây chú ý vì thiết kế mặt hình bát giác với chất liệu mặt kính khoáng toát lên vẻ cứng cáp, chống va đập cực tốt.
• 20 ATM là hệ số chống nước của mẫu đồng hồ này, với thông số này, đồng hồ thường được thiết kế núm xoáy vít vặn, mang tới khả năng chống nước cực tốt. Người dùng có thể tự tin đeo đồng hồ khi bơi lặn hay những hoạt động thể thao khám phá dưới biển. Lưu ý: không bấm các nút điều khiển khi bơi, lặn.
• Casio đã tỉ mỉ và chi tiết trong khâu lựa chọn vật liệu với khung viền làm từ thép không gỉ mạ Ion sáng bóng, bền bỉ với thời gian. Dây đeo được làm từ nhựa, bền bỉ, chống nước tốt. Những vật liệu này giúp người dùng khi đeo cảm thấy thoải mái, êm ái.
• Người dùng không cần đem điện thoại vì đã có thể xem lịch ngày, lịch tháng trên mặt đồng hồ một cách nhanh chóng. Đồng hồ còn hỗ trợ âm bấm phím, đèn led, kim dạ quang xem giờ trong bóng tối cực dễ dàng.
• Đồng hồ nam này cũng sở hữu nhiều tiện ích như những chiếc đồng hồ G-Shock khác như: báo thức, bấm giờ thể thao, bấm giờ đếm ngược, giờ thế giới, đồng hồ 24 giờ, sẽ giúp bạn xem giờ tiện lợi hơn.', 5, N'white-img.png', 5540000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2066, N'Đồng hồ Casio 36.3 mm Unisex A168WER-2ADF', 10, 1224000, 20, N'casio-a168wer-2adf-unisex-thumbb-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'• Đồng hồ Casio 36.3 mm Unisex A168WER-2ADF là món phụ kiện thời trang lý tưởng đến từ hãng đồng hồ Casio nổi tiếng của Nhật Bản. 
• Đồng hồ có đường kính mặt 38.6 x 36.3 mm.
• Chất liệu của khung viền được làm từ nhựa resin và dây đeo của đồng hồ được làm từ thép không gỉ cứng cáp, bền bỉ với thời gian.
• Đồng hồ unisex sở hữu độ chống nước 1 ATM: An toàn khi rửa tay. Không nên sử dụng khi đi mưa, đi tắm hay bơi, lặn.
• Báo thức, bấm giờ thể thao, lịch ngày, lịch thứ, đèn nền và đồng hồ 24 giờ là những tiện ích của đồng hồ, giúp người dùng chủ động hơn trong cuộc sống.', 5, N'white-img.png', 1324000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2067, N'Đồng hồ G-SHOCK 40.4 mm Nữ GM-S2100-3ADR', 5, 5111000, 30, N'g-shock-gm-s2100-3adr-nu-thumbb-600x600.jpg', N'dongho-1.png', N'dongho-2.png', N'dongho-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'• Mẫu đồng hồ này phù hợp cho những bạn nữ ưa chuộng sự cá tính và năng động với kiểu dáng thiết kế thể thao, màu sắc trẻ trung. Đồng hồ G-SHOCK 40.4 mm Nữ GM-S2100-3ADR thuộc dòng G-Shock đến từ thương hiệu Casio - Nhật Bản, nổi tiếng với những chiếc đồng hồ chống sốc bền bỉ.
• Bộ khung viền gia công chắc chắn từ chất liệu thép không gỉ giúp hạn chế hư hỏng khi xảy ra va đập mạnh, kết hợp dây đeo bằng nhựa nhẹ nhàng, khó đứt, bền bỉ mang lại cho bạn sự thoải mái.
• Đồng hồ sỡ hữu đường kính mặt 40.4 mm cùng chất liệu là kính khoáng trên mặt kính cho độ trong suốt, độ cứng cao, dễ dàng đánh bóng lại như mới sau khi đeo một thời gian.
• Chịu được áp lực nước ở độ sâu 200 m tương đương với hệ số chống nước 20 ATM giúp bạn an tâm đeo đồng hồ khi đi tắm, bơi lội hay đi lặn cũng như tham gia các hoạt động thể thao dưới nước. Lưu ý: Không bấm nút điều khiển khi đang bơi hoặc lặn dưới nước.
• Chiếc đồng hồ G-Shock này được tích hợp nhiều tính năng hỗ trợ bạn trong cuộc sống hàng ngày như: Đèn nền, xem giờ thế giới, báo thức, bấm giờ đếm ngược, bấm giờ thể thao, lịch ngày - thứ - tháng, đồng hồ 24 giờ thuận tiện hơn khi theo dõi thời gian mọi lúc. ', 5, N'white-img.png', 5511000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2069, N'Pin sạc dự phòng Polymer 10.000 mAh Type C', 5, 455000, 20, N'sac-du-phong-10000mah-type.jpeg', N'pin-1.png', N'pin-2.png', N'pin-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST xanh có kích thước gọn gàng cùng màu sắc đẹp mắt, dễ dàng mang theo đến nhiều nơi và sử dụng khi cần.
Có màu sắc tươi tắn - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Sạc dự phòng có dung lượng pin 10.000 mAh, có thể sạc được nhiều lần cho các thiết bị di động phổ biến trên thị trường hiện nay.
Dung lượng 10.000 mAh - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Pin dự phòng Xmobile PJ JP190ST có 3 nguồn ra, gồm 2 cổng USB và 1 cổng USB Type-C đạt công suất 5V - 2.4A, cho tốc độ sạc nhanh, tiết kiệm thời gian và không gian khi sạc.
Có 3 nguồn ra tiện ích - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Sạc dự phòng Xmobile dễ dàng được sạc lại khi sử dụng hai nguồn vào là Micro USB và Type-C đều có công suất 5V - 2A, khi sạc nhanh chỉ mất 5 đến 6 giờ với cổng USB type-C.
Sạc lại pin nhanh chóng - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh..', 8, N'white-img.png', 475000, NULL, N'/ 4GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2070, N'Pin sạc dự phòng Polymer 10.000 mAh QC3', 10, 360000, 25, N'sac-du-phong-polymer-10000mah.jpeg', N'pin-1.png', N'pin-2.png', N'pin-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Pin sạc dự phòng eValu PA F1 Air có vỏ được gia công bằng nhôm rất chắc chắn, không bám vân tay
Kích thước pin nhỏ hơn chiếc iPhone X, các cạnh được bo cong nhằm giúp cầm thoải mái hơn, không bị cấn tay.
Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
Kích thước pin của sạc dự phòng không quá to cũng giúp cho vô túi xách hay ví cầm tay cũng rất dễ dàng.
Lõi pin Polymer (Li-Po) sử dụng an toàn, hạn chế chai pin, cho pin có trọng lượng nhẹ.
Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
Thông tin chi tiết cổng sạc
Pin sạc dung lượng 10.000 mAh trang bị 2 cổng sạc vào, giúp nạp lại pin nhanh hơn.
- Cổng sạc Micro USB: 5V - 2A.', 8, N'white-img.png', 380000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2071, N'Pin sạc dự phòng Polymer 20.000 mAh', 5, 1190000, 20, N'polymer-20000mah-type-c-25w-samsung.jpeg', N'pin-1.png', N'pin-2.png', N'pin-3.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'Kiểu dáng đơn giản, nhỏ gọn, màu đen thời trang
Lớp vỏ nhựa cao cấp kháng vỡ, giúp giảm trọng lượng sạc dự phòng, cầm nắm hơi đầm tay nhưng không nặng với 392 gram.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Kiểu dáng đơn giản, nhỏ gọn, màu đen thời trang
Bắt kịp nhịp sống nhanh của bạn với công nghệ sạc nhanh Super Fast Charging, Power Delivery, Quick Charge 2.0
Đáp ứng các tiêu chuẩn sạc nhanh hiện đại, dòng sạc có thể lên đến 25W, làm đầy năng lượng cho thiết bị trong tích tắc và đảm bảo quá trình kết nối, sạc nhanh, an toàn đầy tin cậy. 
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Bắt kịp nhịp sống nhanh của bạn với công nghệ sạc nhanh Super Fast Charging, Power Delivery, Quick Charge 2.0
Trên Samsung EB-P5300 có 1 cổng vào Type-C (5V - 3A, 9V - 2.77A, 12V - 2.1A, 15V - 1.66A, 20V - 1.25A) và 2 cổng ra USB (5V - 2A, 9V - 2A, 12V - 2.1A) và Type C (5V - 3A, 9V - 2.77A, 15V - 1.66A, 20V - 1.25A), 1 nút nguồn và đèn LED báo hiệu lượng pin còn lại dễ dàng theo dõi. 
Để sạc lại cho sạc dự phòng bạn có thể dùng adapter riêng hoặc laptop, thời gian đầy pin từ 12 - 14 giờ khi dùng adapter 2A.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - 3 cổng kết nối.', 8, N'white-img.png', 1290000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2072, N'Pin sạc dự phòng Polymer 10000mAh AVA', 5, 250000, 20, N'pin-polymer-10000mah-ava.jpeg', N'pin-1.png', N'pin-2.png', N'pin-3.png', N'4sao.png', CAST(N'1900-01-01' AS Date), N'Kích thước nhỏ gọn, màu sắc tinh tế, dễ dùng cho mọi người
Pin sạc dự phòng Polymer 10000mAh AVA+ DS006 có 2 màu xanh rêu hoặc xanh navy để lựa chọn theo đối tượng, sở thích người dùng, kích thước nhỏ nhắn, trọng lượng nhẹ chỉ 225 g rất thuận tiện mang theo sử dụng mọi lúc, mọi nơi.
Nhỏ gọn - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
Chia sẻ nguồn năng lượng từ sạc dự phòng AVA+ cho 2 thiết bị cùng lúc
Trang bị 2 cổng ra USB, bạn dễ dàng để sử dụng sạc dự phòng sạc đồng thời cho 2 thiết bị, nhanh chóng nạp lại pin cho điện thoại, tablet, tai nghe… cách an toàn và tiết kiệm thời gian.
2 cổng ra - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
Sử dụng thoải mái, thuận tiện nhờ dung lượng sạc dự phòng 10.000 mAh
Với dung lượng dự trữ này, thật dễ dàng để sạc đến 2.5 lần cho iPhone 12 Pro Max hoặc 2 lần cho OPPO A74, thoải mái sử dụng thiết bị di động với tần suất cao khi du lịch, công tác… mà không lo cạn năng lượng bất chợt.
10.000 mAh - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006.', 8, N'white-img.png', 260000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2074, N'Pin sạc dự phòng Polymer 10.000 mAh W37Y5', 10, 420000, 10, N'sac-du-phong-polymer-10000mah.jpg', N'pin-1.png', N'pin-2.png', N'pin-3.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PW37Y5B trắng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Thiết kế đẹp mắt - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Pin dự phòng PW37Y5B có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Có 3 cổng sạc - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Sạc dự phòng Xmobile tương thích với nhiều thiết bị khác nhau, sạc được cho hầu hết các loại điện thoại có mặt trên thị trường hiện nay.
Tương thích nhiều thiết bị - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có dung lượng 10.000 mAh - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng.', 8, N'white-img.png', 450000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2075, N'Chuột Có dây Gaming MSI Clutch GM08 Đen', 10, 420000, 25, N'chuot-co-day-gaming-msi.jpeg', N'chuot-1.png', N'chuot-2.png', N'chuot-3.png', N'4sao.png', CAST(N'1900-01-01' AS Date), N'Chuột có dây Gaming MSI Clutch GM08 Đen được thiết kế đối xứng khiến cho chuột thân thiện với cả người dùng thuận tay trái.
• Chuột MSI này được chế tạo tỉ mỉ với lớp vảy rồng độc quyền đem đến độ cầm chắc tay khi sử dụng chuột. Thiết kế đa dác đặc biệt trên các nút cho phép bạn bấm nhanh và dễ dàng.
• Chuột có mức thiết lập mặc định DPI của phần cứng từ 200 - 3200, thông số tối đa tốc độ DPI lên đến 4200 điều chỉnh bằng phần mềm.
• Ngay lập tức chuyển đổi giữa 5 mức thiết lập tốc độ DPI để điều chỉnh độ chính xác cho mọi tình huống.
• Khối lượng chuột gaming này có thể điều chỉnh được, làm cho chuột nhẹ hơn hay nặng hơn qua 2 tạ 3 gam và 1 tạ 5 gam tích hợp trong chuột.
• Tận hưởng khả năng chơi game trong nhiều năm với công tắc có độ bền lên đến 10 triệu lần nhấn và cổng USB mạ vàng.
• Chuột có dây kết nối với các thiết bị PC, laptop qua cổng USB thông dụng.', 8, N'hot-icon.gif', 429000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2076, N'Chuột Có dây Gaming MSI Clutch GM11 Đen', 5, 590000, 20, N'chuot-co-day-gaming-msi-clutch.jpeg', N'chuot-1.png', N'chuot-2.png', N'chuot-3.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'Chuột có dây Gaming MSI Clutch GM11 Đen được gia công tỉ mỉ với độ bền cao, màu đen nhám làm nổi bật vẻ sang trọng đường nét bên ngoài của GM11.
• Chuột MSI này sở hữu thiết kế đối xứng, phù hợp với cả người dùng thuận tay phải và thuận tay trái.
• Chuột gaming này kết hợp công tắc từ OMRON đạt độ bền hơn 10 triệu cú nhấn chuột cùng mắt đọc quang học của Pixart với tốc độ lên đến 5000 DPI.
• Nút cuộn của chuột được khắc tuyến tính và gờ bám ở cạnh bên giúp bạn nắm chuột chắc chắn hơn khi chơi game.
• Tất cả các thiết lập chi tiết như điều khiển ánh sáng, gán chức năng cho nút, thiết lập mức tốc độ DPI và lưu trữ tổ hợp macro có thể được tiến hành nhờ vào phần mềm Dragon Center.
• Bên cạnh đó, bạn không cần thông qua ứng dụng mà có thể tùy chỉnh DPI, màu sắc đèn LED, độ sáng trực tiếp qua các nút bấm trên chuột có dây.', 8, N'hot-icon.gif', 600000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2077, N'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen', 10, 970000, 20, N'co-day-gaming-msi-vigor-gk30.jpeg', N'banphim-1.png', N'banphim-2.png', N'banphim-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen với chân đế gaming vững vàng ngay bên dưới phím Space Bar đem đến sự vững vàng, chống trượt khi chơi game.
• Thiết kế phím nổi chống nước không chỉ giúp bàn phím đẹp hơn, mà còn giúp cho bạn dễ dàng lau chùi bàn phím hơn khi dính bẩn.
• Bàn phím MSI được trang bị các switch tịnh tiến tương tự switch cơ học với ba bộ phận đem đến trải nghiệm gõ phím chắc chắn với độ bền hơn 12 triệu lần nhấn.
• Thông qua phần mềm MSI Center bạn có thể tuỳ biến bàn phím gaming với hàng triệu màu sắc và đến 7 hiệu ứng đèn trên 6 khu vực.
• Ngoài ra, với các phím tắt tiện lợi bạn dễ dàng thay đổi nhanh tốc độ, hướng hay chế độ đèn mà không cần cài đặt phần mềm. Phía trên của bàn phím là dãy phím tắt điều chỉnh âm lượng.
• Bàn phím có dây kết nối nhanh chóng với PC, Laptop qua cổng USB với đầu nối mạ vàng, dây dài 1.85 m.', 8, N'hot-icon.gif', 979000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2078, N'Bàn phím Có dây Gaming MSI Vigor GK20 US Đen', 10, 700000, 20, N'co-day-gaming-msi-vigor.jpeg', N'banphim-1.png', N'banphim-2.png', N'banphim-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Là một sản phẩm mới của nhà MSI trong năm 2022, bàn phím Có dây Gaming MSI Vigor GK20 US Đen sở hữu thiết kế gaming đẹp mắt, trang bị đèn LED RGB nổi bật và nhiều tính năng thú vị khác hứa hẹn sẽ đem đến cho bạn một trải nghiệm tuyệt vời.
Thiết kế bề ngoài của bàn phím đẹp mắt, đậm chất gaming
Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Thiết kế đẹp mắt
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Đèn LED RGB chất lượng
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Chân đế.', 8, N'hot-icon.gif', 750000, NULL, N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2079, N'Chuột Có dây Gaming Asus Keris', 10, 1060000, 10, N'chuot-co-day-gaming-asus-keris-thumb.jpeg', N'chuot-1.png', N'chuot-2.png', N'chuot-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Chuột có dây Gaming Asus Keris có kiểu dáng gọn nhẹ, thiết kế mạnh mẽ, vừa lòng bàn tay khi cầm nắm, tạo cảm giác thoải mái khi chơi game.
• Chuột có thiết kế dạng tổ ong bên trong cung cấp độ cứng cho cấu trúc và giúp giảm trọng lượng tổng thể xuống chỉ 62 gram.
• Các nút PBT trái và phải có bề mặt trượt bền, chống mài mòn, sáng bóng, đảm bảo cảm giác sử dụng luôn đồng nhất.
• Chuột Asus có cảm biến quang học với độ nhạy lên đến 16000 DPI được tối ưu hóa cho các trò chơi FPS, thiết kế công thái học được nghiên cứu từ các chuyên gia thể thao điện tử.
• Tính năng DPI On The Scroll cho phép điều chỉnh độ nhạy của chuột gaming mà không cần truy cập menu. Chỉ cần nhấn và giữ nút DPI và xoay con lăn để thay đổi mức độ nhạy. Ngoài ra, nhấp vào nút sẽ chuyển qua bốn mức DPI.
• Hệ thống chiếu sáng RGB tích hợp trong logo và bánh xe cuộn có thể được tùy chỉnh với dải màu gần như vô tận và một loạt các hiệu ứng động.
• Thêm vào đó, thông qua phần mềm Armory Crate cho phép người dùng dễ dàng tùy chỉnh cài đặt hiệu suất và hiệu chỉnh các nút nhấn, tùy chỉnh hiệu ứng ánh sáng,...', 8, N'hot-icon.gif', 1360000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2080, N'HP AIO ProOne 240 G9 i5 1235U/8GB/512GB', 10, 19190000, 10, N'hp-aio-proone-240-g9-i7.jpg', N'manhinh-1.png', N'manhinh-2.png', N'manhinh-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Máy tính để bàn HP AIO ProOne 240 G9 i5 (6M3V2PA) chinh phục người dùng là dân văn phòng hay thiết kế khi sở hữu một ngoại hình sang trọng, bắt mắt cùng cấu hình mạnh mẽ đến từ bộ vi xử lý Intel Gen 12, đảm bảo không làm bạn thất vọng. 
• Bộ vi xử lý Intel Core i5 1235U kết hợp cùng card đồ họa Intel UHD Graphics giúp xử lý mượt mà các tác vụ văn phòng trên Office, Google,... hay chỉnh sửa ảnh, thiết kế video cơ bản bằng Photoshop, Figma, Canva,... Bạn vẫn có thể nâng cấp lên card Iris Xe để xử lý công việc nhiều hơn bằng cách lắp thanh RAM khác và kích hoạt Dual-Channel.
• Khả năng đa nhiệm mượt mà nhờ bộ nhớ RAM 8 GB cho phép bạn vừa xử lý file Excel nặng vừa nghe nhạc thư giãn trên Spotify mà vẫn không xảy ra tình trạng giật lag. Không gian lưu trữ ổn định nhờ ổ cứng SSD 512 GB giúp tải các tệp tài liệu học tập mà không lo tốn quá nhiều dung lượng. 
• Kích thước màn hình 23.8 inch kết hợp tấm nền IPS mang đến cho chiếc máy tính để bàn này một góc nhìn rộng rãi, cho phép bạn nhìn trực diện hay nhìn nghiêng lên đến 178 độ mà vẫn giữ nguyên chất lượng ảnh, hạn chế tối đa hiện tượng mờ hình. Độ phân giải Full HD (1920 x 1080) hiển thị hình ảnh sắc ảnh hơn trên từng chi tiết.
• Độ sáng 250 nits cùng công nghệ Anti Glare giúp bạn quan sát rõ hình ảnh ở nhiều môi trường ánh sáng khác nhau nhưng vẫn đảm bảo bảo vệ thị giác người dùng, hạn chế tối đa hiện tượng bị chói sáng.
• Công nghệ âm thanh High Definition (HD) Audio cho chất âm rõ ràng, chân thực giúp bạn thư giãn sau những giờ làm việc căng thẳng.
• Chiếc máy tính để bàn HP có lớp vỏ màu đen sang trọng với cân nặng 5.37 kg giúp bạn dễ dàng lắp đặt ở nhiều vị trí khác nhau từ văn phòng, bàn tiếp tân,... mà vẫn toát lên vẻ đẹp sang trọng, thu hút mọi ánh nhìn. Máy đi kèm chuột và bàn phím hỗ trợ người dùng làm việc tốt hơn.
• Chiếc máy tính để bàn đồ họa này được trang bị nhiều cổng kết nối phổ biến như USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2 hỗ trợ tối đa cho quá trình kết xuất và truyền tải dữ liệu đến các thiết bị ngoại vi của người dùng.', 2005, N'white-img.png', 20190000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2081, N'Asus ExpertCenter AIO E5402WHAT i5 11500B', 10, 21490000, 20, N'asus-expertcenter-aio-e5402what-i5.jpg', N'manhinh-1.png', N'manhinh-2.png', N'manhinh-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Đến với Asus ExpertCenter AIO E5402WHAT (BA017W), bạn sẽ sở hữu chiếc máy tính nguyên bộ cùng hiệu năng đáp ứng mọi nhu cầu học tập, văn phòng và thiết kế nhỏ gọn tiết kiệm diện tích sử dụng.
• Máy tính AIO được trang bị CPU Intel Core i5 11500B mạnh mẽ tích hợp card Intel UHD Graphics mang lại trải nghiệm làm việc trên các phần mềm Office hay chỉnh sửa ảnh cơ bản diễn ra trơn tru.
• Máy tính để bàn Intel core i5 có RAM 8 GB cho khả năng đa nhiệm mượt mà, SSD 512 GB tăng tốc độ truy xuất dữ liệu, thời gian phản hồi trên máy tính nhanh chóng.
• Màn hình cảm ứng 23.8 inch trang bị 100% sRGB cung cấp màu sắc sống động, có độ chuẩn xác cao, tấm nền Wide View mang lại góc nhìn rộng.
• Phiên bản máy tính để bàn đồ hoạ - kỹ thuật này có Camera IR cho phép người dùng đăng nhập bằng khuôn mặt nhanh chóng. Công tắc khoá camera, TPM 2.0 tăng cường bảo mật cho dữ liệu cá nhân.
• Đa dạng cổng giao tiếp trên máy tính bàn Asus AIO USB 3.2 Gen 2 Type-C, HDMI, Thunderbolt 4, LAN,...
• Micro array tích hợp giúp khả năng thu âm tốt hơn cho mọi buổi họp hay học trực tuyến.', 2005, N'hot-icon.gif', 22490000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2084, N'HP AIO ProOne 240 G9 i7 1255U/8GB/512GB', 10, 22590000, 20, N'hp-aio-proone-240-g9-i7.jpg', N'manhinh-1.png', N'manhinh-2.png', N'manhinh-3.png', N'3sao.png', CAST(N'2022-11-11' AS Date), N'Máy tính để bàn HP AIO ProOne 240 G9 i7 (6M3V4PA) gây ấn tượng bởi sự tinh tế đến từ lối thiết kế thanh lịch cùng hiệu năng vượt trội nhờ bộ vi xử lý Intel Core i7 Gen 12 mạnh mẽ, đáp ứng hoàn hảo mọi nhu cầu của người dùng từ các tác vụ văn phòng cho đến đồ họa - kỹ thuật.
• Bộ vi xử lý Intel Core i7 1255U và card đồ họa tích hợp Intel UHD hỗ trợ vận hành mượt mà công việc văn phòng trên các ứng dụng như Word, Excel, PowerPoint,... cũng như thực hiện các thao tác chỉnh sửa hình ảnh đơn giản trên Photoshop, Canva, Lightroom,... Bạn có thể nâng cấp lên card Iris Xe để nâng cao hiệu quả công việc bằng cách lắp thêm một thanh RAM khác và kích hoạt Dual Channel.
• Máy tính để bàn RAM 8 GB hỗ trợ đa nhiệm trơn tru kể cả với những tác vụ nặng, hỗ trợ nâng cấp lên tối đa 16 GB nhờ 1 khe trống để bạn có thể xử lý nhiều khối lượng công việc hơn. Kết hợp cùng ổ cứng SSD 512 GB giúp truy xuất dữ liệu cực nhanh, không gian lưu trữ thoải mái. 
• Màn hình rộng với kích thước 23.8 inch cùng góc nhìn lên đến 178 độ nhờ tấm nền IPS giúp bạn có thể xem được ở mọi góc độ khác nhau. Độ phân giải Full HD (1920 x 1080) cùng công nghệ chống chói Anti Glare đảm bảo nội dung hiển thị luôn có độ sắc nét cao, màu sắc chân thực và không bị hắt sáng gây khó chịu khi bạn làm việc ở văn phòng có cường độ ánh đèn điện cao. 
• Công nghệ High Definition (HD) Audio cho bạn đắm chìm trong không gian âm nhạc sống động và chân thật khi chơi game hay xem phim, nghe nhạc giải trí. 
• Máy tính để bàn HP đi kèm chuột và bàn phím có cùng tông màu đen sang trọng, vừa mang đến sự tiện lợi khi sử dụng vừa phù hợp để bố trí ở mọi không gian văn phòng.
• Máy tính để bàn có Webcam 5 MP đảm bảo chất lượng hình ảnh sắc nét khi bạn tham gia các lớp học, cuộc họp trực tuyến trên các nền tảng như Zoom, Meet, Teams,...
• Chiếc máy tính để bàn đồ hoạ - kỹ thuật này được cài sẵn hệ điều hành Windows 11 Home SL mang đến sự tiện lợi cho quá trình sử dụng, hỗ trợ bạn hoàn thành công việc tốt hơn trong thời gian ngắn hơn.
• Hàng loạt cổng kết nối thông dụng đáp ứng đa nhu cầu sử dụng với thiết bị ngoại vi như: USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2.', 2005, N'white-img.png', 24490000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2085, N'Lenovo IdeaCentre AIO 3 24ITL6 i3 1115G4/4GB', 10, 15990000, 20, N'lenovo-ideacentre-aio-3-24itl6-i3-f0g000xc.jpg', N'manhinh-1.png', N'manhinh-2.png', N'manhinh-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Lenovo IdeaCentre AIO 3 24ITL6 i3 (F0G000XCVN) là phiên bản máy tính để bàn All in One tiện lợi khi tích hợp CPU, loa, ổ cứng vào chung một màn hình, đi kèm thêm chuột và bàn phím phù hợp cho người dùng là dân văn phòng. 
• Máy tính để bàn 23.8 inch cùng tấm nền IPS cho không gian làm việc rộng rãi, giúp bạn quan sát đầy đủ mọi nội dung hiển thị trên màn hình. 
• Độ phân giải Full HD (1920 x 1080) cùng độ sáng 250 nits cho màu sắc hiển thị rõ nét, tươi tắn hơn, đắm chìm người dùng vào không gian giải trí chân thực.
• Máy tính để bàn Intel core i3 trang bị bộ vi xử lý Intel Core i3 Tiger Lake cùng card Intel UHD Graphics vận hành tốt mọi ứng dụng học tập và làm việc cơ bản trên Word, Excel, PowerPoint,... 
• RAM 4 GB cho khả năng đa nhiệm tương đối ổn định, vừa làm việc vừa nghe nhạc vẫn rất mượt mà. Ổ cứng 256 GB SSD cung cấp không gian lưu trữ vừa đủ, tốc độ mở máy được cải thiện nhanh chóng.
• Chiếc áo màu đen đơn giản nhưng không kém phần hiện đại cùng cân nặng 6.81 kg thích hợp để trong không gian văn phòng hoặc các bàn lễ tân trong nhà hàng, khách sạn,...
• Máy tính để bàn học tập - văn phòng này đi kèm thêm chuột và bàn phím cho các thao tác học tập, làm việc hay giải trí được tiện lợn hơn.
• Đa dạng cổng kết nối được trang bị trên máy tính để bàn như USB 2.0, LAN (RJ45), HDMI và USB 3.2 giúp bạn truyền tải tốt hơn với các thiết bị ngoại vi khác. ', 2005, N'white-img.png', 18890000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2086, N'HP AIO 22 dd2002d i5 1235U/8GB/512GB', 10, 20590000, 20, N'hp-aio-22-dd2002d-i5-6k7g1pa-thumb-1-600x600.jpg', N'manhinh-1.png', N'manhinh-2.png', N'manhinh-3.png', N'5sao.png', CAST(N'2022-11-11' AS Date), N'Nếu bạn đang cần một trợ thủ đắc lực sở hữu đầy đủ mọi ưu điểm từ cấu hình mạnh mẽ đến màn hình lớn, ngoại hình đẹp mắt, máy tính để bàn HP AIO 22 dd2002d i5 (6K7G1PA) sẽ là sản phẩm All-in-one mà bạn không nên bỏ lỡ, cực kỳ phù hợp cho mọi đối tượng là sinh viên, dân văn phòng hay thậm chí là người dùng sáng tạo.
• Mang trên mình bộ vi xử lý Intel Core i5 1235U mạnh mẽ kết hợp với card Intel UHD Graphics giúp bạn vận hành tốt mọi tác vụ học tập - văn phòng từ cơ bản đến nâng cao hay chỉnh sửa hình ảnh, giải trí với các tựa game nhẹ nhàng. Nếu muốn xử lý khối lượng công việc nhiều hơn, bạn hoàn toàn có thể lắp thêm thanh RAM khác và kích hoạt Dual-Channel để nâng cấp lên card Iris Xe.
• Bộ nhớ RAM 8 GB cho phép người dùng xử lý công việc trên nhiều cửa sổ ứng dụng cùng lúc nhưng vẫn đảm bảo trơn tru, hạn chế tình trạng giật lag. Ổ cứng 512 GB SSD mang đến không gian lưu trữ ổn định khi tải các tệp tài liệu, học tập cần thiết đồng thời gia tăng tốc độ khởi động máy chỉ trong vài giây. 
• Làm việc tốt hơn trên kích thước màn hình 21.5 inch cho phép bạn quan sát bao quát nội dung được hiển thị trên máy, độ sáng 250 nits cùng độ phân giải Full HD (1920 x 1080) cung cấp chất lượng khung ảnh sắc nét ở nhiều điều kiện ánh sáng khác nhau với gam màu sắc chuẩn xác trên từng chi tiết. Thời gian làm việc trên máy lâu dài nhưng vẫn bảo vệ tốt cho thị lực của người dùng nhờ màn hình Anti Glare, giảm thiểu độ chói sáng ở những nơi ánh sáng cao.
• Công nghệ High Definition (HD) Audio cho chất âm to rõ, chân thực trên từng thước phim hay bản nhạc.
• Máy tính để bàn học tập được bao bọc bởi chiếc áo màu trắng tinh khôi, toát lên vẻ đẹp tinh tế và sang trọng khi đặt ở mọi vị trí khác nhau, cân nặng 5.7 kg dễ dàng bưng bê và lắp đặt cố định ở không gian văn phòng, bàn lễ tân nhà hàng, khách sạn,...
• Tính năng mở khóa bằng khuôn mặt tích hợp với Camera IR hồng ngoại hiện đại được trang bị trên chiếc máy tính để bàn này giúp bạn mở khóa nhanh chóng và an toàn hơn rất nhiều so với các kiểu bảo mật truyền thống dù ở những nơi có điều kiện ánh sáng thấp.
• Mặt sau máy tính để bàn HP được trang bị đa dạng các cổng kết nối như USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2 cho khả năng kết xuất và truyền tải dữ liệu đến các thiết bị ngoại vi nhanh chóng, dễ dàng hơn.', 2005, N'white-img.png', 21590000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2087, N'Lenovo IdeaCentre AIO 3 24ITL6 i5', 20, 19390000, 10, N'lenovo-ideacentre-aio-3-24itl6-i5.jpg', N'manhinh-1.png', N'manhinh-2.png', N'manhinh-3.png', N'4sao.png', CAST(N'2022-11-11' AS Date), N'Nếu bạn đang tìm kiếm một chiếc máy tính nguyên bộ để phục vụ cho công việc, học tập hay giải trí cơ bản thì máy tính Lenovo IdeaCentre AIO 3 24ITL6 i5 (F0G000XBVN) sẽ là người bạn đồng hành đắc lực cho điều đó. 
• Máy tính để bàn Intel core i5 được trang bị bộ vi xử lý Intel Core i5 1135G7 cùng card Intel UHD Graphics, máy tính để bàn Lenovo cho phép người dùng xử lý tốt các tác vụ học tập, làm việc trên Office hay giải trí với các tựa game nhẹ nhàng. 
• Máy tính để bàn học tập - văn phòng có khả năng đa nhiệm mượt mà hơn đáng kể nhờ bộ nhớ RAM 8 GB, đồng thời gia tăng tốc độ mở máy chỉ trong vài giây với ổ cứng 256 GB SSD (Có thể tháo ra, lắp thanh khác tối đa 512 GB).
• Làm việc hay giải trí tốt hơn với máy tính để bàn 23.8 inch rộng rãi kết hợp với tấm nền IPS cho góc nhìn rộng lên đến 178 độ, độ phân giải Full HD cùng độ sáng 250 nits giúp các chi tiết hình ảnh hiển thị sắc nét hơn. 
• Xem phim, nghe nhạc với chất âm to rõ hơn nhờ công nghệ âm thanh High Definition. Máy còn đi kèm chuột và bàn phím giúp bạn thao tác thuận tiện hơn.
• Phong cách thiết kế đơn giản nhưng không kém phần hiện đại, chiếc máy tính để bàn này phù hợp cho không gian văn phòng làm việc hay các quầy lễ tân phục vụ. 
• Máy tính để bàn học tập - văn phòng được trang bị các cổng kết nối như USB 2.0, LAN (RJ45), HDMI và USB 3.2 giúp kết nối với các thiết bị ngoại vi khác dễ dàng hơn.', 2005, N'white-img.png', 19990000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2088, N'Mac Mini 2020 M1 8-core/256GB', 10, 19990000, 10, N'mac-mini-m1-mgnr3saa-thumb-600x600.jpg', N'mac-1.png', N'manhinh-2.png', N'mac-3.png', N'2sao.png', CAST(N'2022-11-11' AS Date), N'Mac mini 2020 M1 (MGNR3SA/A) là dòng Mac nhỏ gọn, linh hoạt và đa năng khi có thể đáp ứng cả các nhu cầu giải trí và làm đồ họa mạnh mẽ với hiệu năng đột phá từ chip M1.
Bộ vi xử lý M1 mạnh mẽ vượt trội
Apple Mac mini M1 sở hữu chip M1 được chính Apple thiết kế, mang đến hiệu năng vượt trội với 8 nhân CPU mang đến tốc độ xử lý gấp 3 lần và 8 nhân GPU cho khả năng thiết kế đồ họa mạnh mẽ, phục vụ tốt cho việc chỉnh sửa ảnh, làm video trên các phần mềm như Photoshop, AI, Pr,... 
Apple M1 còn mang đến 16 nhân Neural Engine và đầy đủ các công nghệ máy học tiên tiến cho khả năng xử lý các tác vụ về tính toán, phân tích video, nhận dạng giọng nói và nhiều hơn nữa.
Bộ nhớ RAM 8 GB độ trễ thấp giúp đa nhiệm mượt mà, cho phép các ứng dụng chia sẻ dữ liệu giữa CPU, GPU và Neural Engine một cách hiệu quả, làm việc đa tác vụ cùng lúc mà không lo đơ máy, đứng máy.
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cấu hình
Ổ cứng SSD 256 GB mang đến khả năng xử lý nhanh chóng và không gian lưu trữ dữ liệu, bạn có thể tải được nhiều ứng dụng, tài liệu, phục vụ nhu cầu học tập, làm việc hằng ngày hay các file âm nhạc, phim ảnh giải trí.
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - SSD.', 8, N'white-img.png', 20990000, N'', N'/ 8GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2089, N'PC Gaming Asus ROG Strix G15CF-71270F110W', 10, 42990000, 15, N'asus-rog-strix-g15cf-71270f110w.jpg', N'msi-mag-infinite-s3-12tc-i5.jpg', N'msi-mag-infinite-s3-12tc-i5.jpg', N'msi-mag-infinite-s3-12tc-i5.jpg', N'4sao.png', CAST(N'2022-11-11' AS Date), N'PC Gaming Asus ROG Strix G15CF-71270F110W i7 sinh ra để dành cho các game thủ chuyên nghiệp với cấu hình bùng nổ từ con chip Intel Gen 12 kết hợp cùng card đồ họa NVIDIA GeForce RTX 3070 8 GB và phong thái thiết kế hầm hố, mạnh mẽ chuẩn gaming.
• Với thiết kế dựa trên kiến trúc Turing hàng đầu của nhà NVIDIA, card đồ họa NVIDIA GeForce RTX 3070 8 GB chinh phục mọi game thủ với hiệu ứng hình ảnh thể hiện cực sắc nét, độ sâu của màu sắc được tái tạo cực tốt cho mọi tựa game, kết hợp với CPU Intel Core i7 12700F cân hoàn hảo các tác vụ sáng tạo như thiết kế, chỉnh ảnh,...
• Máy tính để bàn Intel core i7 nâng tầm đa nhiệm vượt trội với bộ nhớ RAM 16 GB (nâng cấp tối đa 64 GB) cho phép người dùng vừa phát sóng chơi game trực tiếp vừa sử dụng các nền tảng xã hội như FaceBook, Twitter, Instagram,... một cách mượt mà. 
• Máy tính để bàn đồ hoạ - kỹ thuật sở hữu ổ cứng SSD 512 GB với 2 khe cắm hỗ trợ PCIe x16 và 4 khe cắm hỗ trợ HDD SATA cung cấp không gian lưu trữ rộng rãi cho bạn chiến được nhiều tựa game đình đám cũng như gia tăng tốc độ khởi động máy, truy cập game,... một cách toàn diện.
• PC Gaming có thiết kế thông minh với quai cầm tích hợp trực tiếp vào vỏ máy cùng giá treo tai nghe ngay trên thùng máy giúp bạn di chuyển thuận tiện hơn cũng như dễ dàng sử dụng tai nghe mọi lúc bạn cần.
• Một cạnh bên hông máy tính để bàn Asus được thiết kế mặt kính trong suốt cho thấy đèn RGB cùng các chi tiết bo mạch bên trong đầy bắt mắt, bạn hoàn toàn có thể điều chỉnh màu sắc theo ý thích nhờ phần mềm Aura Sync hiện đại.
• Trọn vẹn những trải nghiệm chiến game chân thực và sống động nhất với khả năng tùy ý tinh chỉnh cài đặt âm thanh để phù hợp với các chế độ chơi game, chất âm cũng được trong trẻo và to rõ hơn nhờ công nghệ âm thanh High Definition 7.1 Channel Audio được trang bị trên chiếc máy tính để bàn này.
• Đảm bảo cho các thiết bị của bạn luôn trong quá trình kết nối tối đa, PC Gaming Asus ROG Strix trang bị hàng loạt các cổng kết nối như Display port, LAN (RJ45), HDMI, USB Type-C, USB 3.2, USB 2.0, Audio jacks, Headphone, Mic in,... với tốc độ truyền tải và kết xuất nhanh chóng.', 2005, N'white-img.png', 44990000, NULL, N'/ 6GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2091, N'PC Gaming MSI MAG Infinite S3 12TC i5', 10, 32990000, 25, N'msi-mag-infinite-s3-12tc-i5.jpg', N'asus-rog-strix-g15cf-71270f110w.jpg', N'asus-rog-strix-g15cf-71270f110w.jpg', N'asus-rog-strix-g15cf-71270f110w.jpg', N'4sao.png', CAST(N'2022-11-11' AS Date), N'PC MSI MAG Infinite S3 12TC i5 12400F (251MYS) được thiết kế để mang lại trải nghiệm chiến game tốt nhất cho người dùng, là sản phẩm hoàn hảo dành cho các game thủ chuyên nghiệp cần hiệu năng mạnh mẽ và một thiết kế hầm hố đậm chất gaming.
• Tăng cường trải nghiệm chơi game với bộ vi xử lý Intel Core i5 12400F thế hệ thứ 12 tiên tiến, sở hữu cấu trúc lai để nâng cao sức mạnh tính toán cũng như tối ưu mức độ tiêu thụ điện năng. 
• Máy tính để bàn Intel core i5 được trang bị card đồ họa rời GeForce RTX 3060 Ventus 2X 12 GB với kiến trúc NVIDIA Ampere tích hợp các nhân RT, Tensor và các bộ đa xử lý, đem đến cho game thủ cũng như các nhà sáng tạo nội dung khả năng xử lý đồ họa chuyên nghiệp.
• Máy tính để bàn RAM 16 GB hỗ trợ người dùng xử lý đa tác vụ một cách mượt mà, dễ dàng nâng cấp lên đến tối đa 64 GB để nâng cao trải nghiệm sáng tạo, chơi game.
• Ổ cứng SSD 512 GB với khả năng nâng cấp tối đa 2 TB mang đến không gian lưu trữ ấn tượng đồng thời gia tăng tốc độ cao hơn, khởi động game trong tíc tắc.
• PC Gaming có tính năng Air cooling giúp máy tản nhiệt tốt hơn bằng không khí, từ đó cho các game thủ chiến game trong thời gian dài nhưng vẫn hạn chế tối đa hiện tượng nóng máy.
• Máy tính để bàn MSI được thiết kế để tối ưu luồng gió, giữ cho máy luôn chạy ở hiệu năng đỉnh. Thiết kế một mặt hông trong suốt có thể thấy được các chi tiết bên trong thùng máy giúp khơi nguồn cảm ứng và thể hiện phong cách cá nhân mạnh mẽ của riêng bạn.
• Chuẩn Wi-Fi 6E mới nhất trên máy tính để bàn cho tốc độ truyền tải cao trong khi vẫn đảm bảo kết nối mượt mà, ổn định ngay cả khi có nhiều người cùng sử dụng. 
• Đa dạng cổng kết nối như Display port, LAN (RJ45), HDMI, USB 3.2, USB Type-C 3.2 hai chiều để bạn liên kết với mọi thiết bị ngoại vi cùng lúc.', 2005, N'white-img.png', 33990000, N'', N'/ 8GB')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2102, N'Tai nghe chụp tai bluetooth P17', 30, 299000, 20, N'Tai-nghe-chup-tai.png', N'tainghe-1.png', N'tainghe-2.png', N'tainghe-3.png', N'5sao.png', CAST(N'2022-11-18' AS Date), N'Tai nghe chụp tai bluetooth P17 Chống Ồn, Micro Gắn Trong, Cổng Jack 3,5mm, Đệm Tai Êm Ái Không Gây Đau Tai. Hàng Chính Hãng.', 8, N'white-img.png', 309000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2116, N'Tai Nghe ATM-40', 35, 3100000, 10, N'Tai-nghe-ATM-40.png', N'tainghe-1.png', N'tainghe-2.png', N'tainghe-3.png', N'4sao.png', CAST(N'2022-11-18' AS Date), N'Với hơn 50 năm phát triển, Audio-Technica đã trở thành thương hiệu tai nghe số 1 Nhật Bản và là 1 trong những thương hiệu uy tín nhất trên thế giới về chất lượng tuyệt vời và thiết kế thời thượng, sắc sảo', 8, N'white-img.png', 3200000, N'', N'')
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [TheFirm], [RAM]) VALUES (2118, N'IphoneX 64GB', 34, 11399000, 15, N'ipX.jpg', N'ipx1.png', N'ipx2.png', N'ipx3.png', N'5sao.png', CAST(N'2022-11-18' AS Date), N'Màn hình: OLED5.8"Super Retina, Hệ điều hành: iOS 12, Camera sau: 2 camera 12 MP, Camera trước: 7 MP, Chip: Apple A11 Bionic, RAM: 3 GB, Dung lượng lưu trữ: 64 GB, SIM: 1 Nano SIM, Pin Sạc: 2716 mAh.', 2, N'white-img.png', 12299000, N'iphone', N'/ 4GB')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'CUST', N'Customers')
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'DIRE', N'Directors')
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK23fux5pe6yss1vck8iv9juegn]    Script Date: 3/30/2023 9:22:53 AM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UK23fux5pe6yss1vck8iv9juegn] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKef7fbpy09qu6267gf071q71we]    Script Date: 3/30/2023 9:22:53 AM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UKef7fbpy09qu6267gf071q71we] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_Accounts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Statitic]  WITH CHECK ADD  CONSTRAINT [FK_Statitic_OrderDetails] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetails] ([OrderDetailId])
GO
ALTER TABLE [dbo].[Statitic] CHECK CONSTRAINT [FK_Statitic_OrderDetails]
GO
ALTER TABLE [dbo].[Statitic]  WITH CHECK ADD  CONSTRAINT [FK_Statitic_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Statitic] CHECK CONSTRAINT [FK_Statitic_Orders]
GO
