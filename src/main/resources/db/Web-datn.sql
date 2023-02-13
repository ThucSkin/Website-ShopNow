USE [WebsiteShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/25/2022 8:55:16 PM ******/
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
	[TelePhone] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 11/25/2022 8:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Authorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/25/2022 8:55:16 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 11/25/2022 8:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 11/25/2022 8:55:16 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/25/2022 8:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NULL,
	[Status] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
	[Discription] [nvarchar](100) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/25/2022 8:55:16 PM ******/
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
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/25/2022 8:55:16 PM ******/
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
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/25/2022 8:55:16 PM ******/
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
/****** Object:  Table [dbo].[Statitic]    Script Date: 11/25/2022 8:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statitic](
	[OrderId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'admin', N'123', N'admin', N'admin@gmail.com', N'6a26e19d85b175ef2ca0.jpg', N'50 Nguyễn Thị Thập, Hòa Minh, Liên Chiểu, Đà Nẵng.', 93333333)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ba', N'567890', N'Ong Chu Ba', N'tonthuhuyen581@hotmail.com', NULL, N'Xã Lãng Ngâm, Huyện Gia Bình, Bắc Ninh.', 814058921)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ca', N'34567', N'Ca ca', N'hnianhunga560@hotmail.com', NULL, N'Xã Long Cốc, Huyện Tân Sơn, Phú Thọ', 823452961)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Can', N'567890', N'Can Tao Di', N'chuvylan546@yahoo.com', NULL, N'Phường Tân An, Quận Ninh Kiều, Cần Thơ', 594297158)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'demo', N'123', N'Thuc Skin', N'demo@gmail.com', N'1.png', N'54 snv', 34893464)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ha', N'123', N'Banh Thi Ha', N'ngocmongvy346@gmail.com', NULL, N'Xã Ba Cụm Nam, Huyện Khánh Sơn, Khánh Hòa', 791904536)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Hai', N'123', N'Ly Hai', N'deothuviet949@facebook.com', NULL, N'Xã Gio Việt, Huyện Gio Linh, Quảng Trị', 770419378)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Hi', N'4567890', N'Ahihhi', N'nghiemthaovan641@facebook.com', NULL, N'Xã Ngọc Linh, Huyện Vị Xuyên, Hà Giang', 330931468)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Hoan', N'234', N'Cong Hoan', N'aovietson265@facebook.com', NULL, N'Xã Tân Thới, Huyện Tân Phú Đông, Tiền Giang', 784198053)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Hoang', N'3245678', N'Duong Ma Ma', N'hoaphihai961@icloud.com', NULL, N'Xã Tân Phước, Huyện Tân Thành, Bà Rịa - Vũng Tàu', 394763912)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Huy', N'123', N'Ly Van Huy', N'danggiangthanh771@google.com', NULL, N'Xã Phương Khoan, Huyện Sông Lô, Vĩnh Phúc', 832167843)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Huyn', N'e45678970', N'Huyn La', N'khieutruongthanh141@gmail.com', NULL, N'Xã Pom Lót, Huyện Điện Biên, Điện Biên', 362784091)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Khang', N'123', N'Lý Thường Khang', N'ungthuynhu76@hotmail.com', NULL, N'Xã Nhơn Mỹ, Thị xã An Nhơn, Bình Định', 766093574)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ky', N'eyuikjhgfds', N'Ly Nha Ky', N'diemlechi468@microsoft.com', NULL, N'Phường Tiên Cát, Thành phố Việt Trì, Phú Thọ', 782765403)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Lan', N'456789', N'Ninh Duong Lan ', N'leuvietnga606@naver.com', NULL, N'Xã An Hải, Huyện Lý Sơn, Quảng Ngãi', 565137968)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Lay', N'4567890', N'TaoLayMay', N'vuthanhphong168@gmail.com', NULL, N'Xã Rô Men, Huyện Đam Rông, Lâm Đồng', 594310956)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Luc', N'e567890', N'LucTieuKy', N'laviethai0@facebook.com', NULL, N'Phường Lãm Hà, Quận Kiến An, Hải Phòng', 972451370)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Luoc', N'34567890', N'Lược Văn Cảnh', N'phihaivan687@yahoo.com', NULL, N'Xã An Thanh, Huyện Quỳnh Phụ, Thái Bình', 932803547)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ly', N'123', N'Ho Ly', N'lenhanhong446@google.com', NULL, N'Xã Tân Mỹ, Thành phố Bắc Giang, Bắc Giang', 397503261)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ma', N'456789', N'Ma Gaming', N'giapthanhnga737@gmail.com', NULL, N'Phường Hiệp Thành, Thị xã Ngã Bảy, Hậu Giang', 918510972)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Manh', N'456789', N'Manh Duc Cuong', N'leunhathung307@microsoft.com', NULL, N'Xã Thanh Sơn, Huyện Kim Bảng, Hà Nam', 931082593)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Mi', N'456789', N'LaMiDo', N'diepuctai144@google.com', NULL, N'Xã Ngọc Đường, Thành phố Hà Giang, Hà Giang', 358453271)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Mip', N'45678', N'Minh Mip', N'ungtamhang472@gmail.com', NULL, N'Xã Hưng Phú, Huyện Phước Long, Bạc Liêu', 798473625)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Mit', N'1234', N'Mu Mit Toi Tam', N'xakimngan677@microsoft.com', NULL, N'Phường Ngọc Hà, Thành phố Hà Giang, Hà Giang', 783460158)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Na', N'4567890', N'Tra Bong Na', N'trinhxuanhieu204@microsoft.com', NULL, N'Xã Trà Giang, Huyện Trà Bồng, Quảng Ngãi', 834983571)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Nhanh', N'4567890', N'Nhanh Nhanh Len', N'quananhao580@naver.com', NULL, N'Phường Hòa Thọ Tây, Quận Cẩm Lệ, Đà Nẵng', 843062958)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ni', N'2345678', N'Ni Co Lat Cau', N'doanlinhphuong427@naver.com', NULL, N'Xã Thượng Long, Huyện Yên Lập, Phú Thọ', 768362045)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ninh', N'67890-', N'Minh Tieu Ha', N'cabichhai812@icloud.com', NULL, N'Xã Nâm N''Jang, Huyện Đắk Song, Đắc Nông', 914178509)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Oi', N'4567890', N'Oi Con Ran Kia', N'tonthattuankhanh378@facebook.com', NULL, N'Xã Tam Hiệp, Huyện Phúc Thọ, Hà Nội', 385743268)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Pho', N't6666666', N'Giang A Pho', N'biminhloan91@microsoft.com', NULL, N'Xã Thanh Hải, Huyện Ninh Hải, Ninh Thuận', 329268457)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Phu', N'22222', N'Phu Le', N'trinhhaphuong315@google.com', NULL, N'Xã Yên Lỗ, Huyện Bình Gia, Lạng Sơn', 813714695)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Phung', N'67890-', N'Cung Phung', N'giangthanhao29@google.com', NULL, N'Phường 2, Thành phố Tuy Hoà, Phú Yên', 779734521)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Qui', N'12345678', N'Ho Qui Kong Ly', N'tonguyetha291@yahoo.com', NULL, N'Xã An Phú, Huyện Lục Yên, Yên Bái', 337451390)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Quynh', N'123', N'Ly Thi Quynh', N'Qunhh@gmail.com', NULL, N'Xã Nghĩa Hà, Thành phố Quảng Ngãi, Quảng Ngãi', 852360194)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ri', N'24546578', N'Ca Ri', N'machyenthanh421@google.com', NULL, N'Xã Cam Lập, Thành phố Cam Ranh, Khánh Hòa', 365780136)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Rin', N'67890-', N'Rin Rin Kuout', N'xaquynhthanh140@facebook.com', NULL, N'Xã Độc Lập, Huyện Quảng Uyên, Cao Bằng', 857584139)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'staff', N'123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'f3.jpg', N'123 nguyen thi thap', 969794458)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Su', N'600000', N'Xã Ia Din Su', N'sonkieuminh11@facebook.com', NULL, N'Xã Ia Din, Huyện Đức Cơ, Gia Lai', 975398617)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'T1', N'123', N'Nguyen Van Thuc', N'thucfc2002@gmail.com', N'f3.jpg', N'21 Phu Thanh 1, Hoa minh, Lien Chieu, Da Nang', 969794458)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'T11', N'123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'f3.jpg', N'123 nguyen thi thap', 969794458)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'T111', N'123', N'Nguyen Van Thuc', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'T2', N'123', N'Thuc Skin', N't2@gmail.com', NULL, N'54 snv', 34893464)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'T3', N'123', N'Thuc Skin', N't3@gmail.com', NULL, N'54 snv', 34893464)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ta', N'456789', N'Ta Day La Vo Dich', N'nhuhuyha870@yahoo.com', NULL, N'Xã Hồng Châu, Huyện Yên Lạc, Vĩnh Phúc', 974809653)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Tan', N'r42386', N'Lâm Đồng Tân', N'khuuhongthuy464@gmail.com', NULL, N'Xã Nam Ninh, Huyện Cát Tiên, Lâm Đồng', 847049285)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Thai', N'5dd3123', N'Tuần Giáo Thái', N'phinhathanh844@yahoo.com', NULL, N'Xã Pú Nhung, Huyện Tuần Giáo, Điện Biên', 840542683)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Thinh', N'123', N'Lai Châu', N'vienthuyen819@icloud.com', NULL, N'Xã Nậm Khao, Huyện Mường Tè, Lai Châu', 334759023)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Thuc', N'123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'f3.jpg', N'21 Phú Thanh1, Hòa Minh, Liên Chiểu, Đà Nẵng', 969794458)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'ThucSkin', N'123', N'Nguyen Thuc', N'thucfc2002@gmail.com', N'c89e299133bdc3e39aac.jpg', N'123 nguyen thi thap', 969794458)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Ti', N'123', N'Nguyen Van Ti', N'chunginhnguyen452@microsoft.com', NULL, N'Xã Hưng Phú, Huyện Phước Long, Bạc Liêu', 382165480)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Tim', N't555555', N'Tim Tim Xanh Xanh', N'himyhiep907@naver.com', NULL, N'Xã Suối Trai, Huyện Sơn Hòa, Phú Yên', 567635198)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Tung', N'1342567687', N'Nghiem ThanhTTung', N'lothienngon447@yahoo.com', NULL, N'Xã Thanh Sơn, Huyện Kim Bảng, Hà Nam', 902814759)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'user', N'123', N'Thuc Skin', N'thucfc2002@gmail.com', N'6a26e19d85b175ef2ca0.jpg', N'21 Phu Thanh Da nang', 969794458)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Uyen', N'123', N'Nguyen Hai Uyen', N'UyenNC@gmail.com', NULL, N'Lý Thường Kiệt, An Phú, Hòa Tân', 35213212)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Va', N'3245678', N'Va Cham', N'tiephuukhang981@naver.com', NULL, N'Xã Quảng Hoà, Huyện Đăk Glong, Đắc Nông', 568170453)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Van', N'123', N'Hải Dương', N'vuuainhan637@naver.com', NULL, N'Phường Trần Hưng Đạo, Thành phố Hải Dương, Hải Dương', 997023698)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'VienNC', N'123', N'Nguyễn Công Viên', N'congvien.0123@gmail.com', NULL, N'Lâm Tây, Đại Đồng, Đại Lộc, Quảng Nam', 935563702)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Vu', N'123', N'Ngô Hạo Vũ', N'ngohaonhi288@naver.com', NULL, N'Xã Nhơn Sơn, Huyện Ninh Sơn, Ninh Thuận', 331705692)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone]) VALUES (N'Yen', N'133', N'Le Hai Yen', N'lacphinhung105@naver.com', NULL, N'Xã Thụy Hùng, Huyện Văn Lãng, Lạng Sơn', 789042635)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'admin', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (26, N'demo', N'CUST')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'demo', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (23, N'T1', N'DIRE')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (24, N'T2', N'STAF')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (25, N'T3', N'CUST')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (22, N'user', N'CUST')
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
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (1, N'admin', 2015, N'Sản phẩm chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (2, N'Uyen', 2016, N'Sản phẩm rẻ')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (3, N'Quynh', 2017, N'Sản phẩm bền')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (4, N'Uyen', 2018, N'Sản phẩm không tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (5, N'Ti', 2019, N'Sản phẩm rẻ, đáng mua')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (6, N'Huy', 2020, N'Sản phẩm không giống trong hình')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (7, N'Hai', 2021, N'Sản phẩm bền rẻ')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (8, N'Su', 2022, N'Sản phẩm tốt, giao hàng nhanh')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (10, N'Van', 2024, N'Sản phẩm tốt, tôi sẽ ủng hộ tiếp')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (11, N'Khang', 2025, N'Giá cả phải chăng, phù hợp cho tôi')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (12, N'Vu', 2026, N'Giao hành nhanh, tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (13, N'Ly', 2027, N'Đóng gói bao bì rất đẹp, sản phẩm tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (14, N'Ha', 2028, N'sản phẩm tốt xứng đáng 10 điểm')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (15, N'Yen', 2029, N'Tôi chưa bao giờ mua được sản phẩm rẻ mà tốt thế này')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (17, N'Phu', 2031, N'+1000 like cho shop')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (20, N'Ni', 2034, N'Mua hàng được tặng thêm móc khóa, rất thích')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (21, N'Ri', 2035, N'Mắc nhưng đáng để bỏ tiền ra mua')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (22, N'Ca', 2036, N'Anh shipper đep trai, chưa sử dụng nhiều nên chưa biết chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (24, N'Oi', 2038, N'Giao hành nhanh, tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (26, N'Lan', 2040, N'Sản phẩm quá rẻ, mà lại đảm bảo chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (27, N'Qui', 2041, N'Sản phẩm chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (28, N'Ta', 2042, N'Sản phẩm không giống trong hình')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (29, N'Hi', 2043, N'Sản phẩm bền')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (30, N'Mi', 2044, N'Sản phẩm tốt, tôi sẽ ủng hộ tiếp')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (31, N'Va', 2045, N'Mắc nhưng đáng để bỏ tiền ra mua')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (33, N'Ba', 2047, N'Điểm 10 cho sản phẩm')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (34, N'Ma', 2048, N'Sản phẩm chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (35, N'Hoang', 2049, N'Giao hành nhanh, tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (36, N'Phung', 2050, N'Rất thích sản phẩm, sẽ ủng hộ thêm')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (37, N'Nhanh', 2051, N'Sản phẩm quá rẻ, mà lại đảm bảo chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (38, N'Manh', 2052, N'Sản phẩm tốt chất lượng thì chưa biết')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (40, N'Rin', 2054, N'Sản phẩm rẻ, tạm chấp nhận được')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (41, N'Can', 2055, N'Sản phẩm chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (42, N'Mip', 2056, N'Giao hành nhanh, tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (43, N'Huyn', 2057, N'Đóng gói bao bì rất đẹp, sản phẩm tốt')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (44, N'Luc', 2058, N'Tôi chưa bao giờ mua được sản phẩm rẻ mà tốt thế này')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (45, N'Ky', 2059, N'Sản phẩm chất lượng')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (46, N'Tung', 2060, N'Giá cả phải chăng, phù hợp cho tôi')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (47, N'Tan', 2061, N'Sản phẩm đạt yêu cầu sở thích của tôi')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (48, N'Thai', 2062, N'Cho 9 trên 10 điểm')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (49, N'Tim', 2063, N'Sản phẩm màu sắc quá đẹp')
GO
INSERT [dbo].[Comments] ([CommentId], [Username], [ProductId], [Description]) VALUES (50, N'Pho', 2064, N'Sản phẩm quá tệ')
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (5, 5, 2020, 340000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (6, 6, 2021, 890000, 10, N'Đang giao hàng', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (7, 7, 2022, 230000, 10, N'Đang giao hàng', 3, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (8, 8, 2023, 340000, 10, N'Đang vận chuyển', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (9, 9, 2024, 450000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (10, 10, 2025, 800000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (11, 11, 2026, 5400000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (12, 12, 2027, 900000, 10, N'Đang vận chuyển', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (13, 13, 2028, 120000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (14, 14, 2029, 2300000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (16, 16, 2031, 5600000, 10, N'Đang giao hàng', 3, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (19, 19, 2034, 5000000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (20, 20, 2035, 2300000, 10, N'Đang giao hàng', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (21, 21, 2036, 4500000, 10, N'Đang vận chuyển', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (23, 23, 2038, 3000000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (25, 25, 2040, 5300000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (26, 26, 2041, 5100000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (27, 27, 2042, 900000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (28, 28, 2043, 2500000, 10, N'Đang giao hàng', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (29, 29, 2044, 7000000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (30, 30, 2045, 2000000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (32, 32, 2047, 5000000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (33, 33, 2048, 1000000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (34, 34, 2049, 2000000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (35, 35, 2050, 3000000, 10, N'Đang giao hàng', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (36, 36, 2051, 4000000, 10, N'Đang chờ xác nhận', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (37, 37, 2052, 3400000, 10, N'Đang giao hàng', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (39, 39, 2054, 1100000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (40, 40, 2055, 1200000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (41, 41, 2056, 1300000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (42, 42, 2057, 1400000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (43, 43, 2058, 2100000, 10, N'Đang giao hàng', 3, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (44, 44, 2059, 2300000, 10, N'Đang vận chuyển', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (45, 45, 2060, 2400000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (46, 46, 2061, 3200000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (47, 47, 2062, 1200000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (48, 48, 2063, 1800000, 10, N'Đang vận chuyển', 3, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (49, 49, 2064, 4100000, 10, N'Đang giao hàng', 1, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (50, 50, 2065, 1000000, 10, N'Đang chờ xác nhận', 2, N'Duyệt')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (125, 161, 8, 10790000, 880000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (126, 161, 2116, 3100000, 399000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (127, 161, 2077, 970000, 2, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (128, 161, 9, 36290000, 4300000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (129, 162, 10, 19990000, 4500000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (130, 162, 2061, 2220000, 10, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (131, 162, 2102, 299000, 39000, NULL, 3, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (132, 163, 4, 3990000, 300000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (133, 163, 8, 10790000, 880000, NULL, 5, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (134, 164, 11, 16690000, 399000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (135, 164, 22, 15490000, 1250000, NULL, 2, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (136, 165, 9, 36290000, 4300000, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (137, 166, 11, 16690000, 399000, NULL, 13, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (138, 167, 2028, 25990000, 5, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (139, 167, 9, 36290000, 4300000, NULL, 9, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (143, 170, 22, 15490000, 15, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (144, 170, 2120, 349000, 35, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (145, 174, 8, 10790000, 15, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (146, 175, 8, 10790000, 15, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (147, 176, 8, 10790000, 15, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (148, 176, 14, 43590000, 10, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (149, 176, 9, 36290000, 25, NULL, 1, NULL)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Status], [Quantity], [Discription]) VALUES (150, 177, 8, 10790000, 15, NULL, 999, NULL)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (1, NULL, CAST(N'2022-02-11' AS Date), N'387187069', N'Thôn Lâm Tây, Xã Đại Đồng, Huyện Đại Lộc, Tỉnh Quảng Nam.', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (2, N'user', CAST(N'2022-02-10' AS Date), N'932263510', N'60 Ngô Thị Nhậm, Phường Hòa Minh, Liên Chiểu, TP Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (3, N'user', CAST(N'2022-02-10' AS Date), N'932263510', N'60 Ngô Thị Nhậm, Phường Hòa Minh, Liên Chiểu, TP Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (4, N'user', CAST(N'2022-01-02' AS Date), N'935563702', N'120 Tôn Đức Thắng, Hòa Minh, Liên Chiểu, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (5, N'user', CAST(N'2022-01-02' AS Date), N'935563702', N'120 Tôn Đức Thắng, Hòa Minh, Liên Chiểu, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (6, N'Quynh', CAST(N'2022-05-19' AS Date), N'223187069', N'243 Tân Thảo, Phường Phú Sơn , Thị Xã Bỉm Sơn , Thanh Hóa', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (7, N'Ti', CAST(N'2022-02-07' AS Date), N'987223702', N'77 Võ Nguyên Giáp, Phường Quảng Thọ, Thị Xã Ba Đồn, Quảng Bình', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (8, N'Huy', CAST(N'2022-02-19' AS Date), N'222187069', N'299 Thái Thị Bôi, Phường , Liên Chiểu, TP Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (9, N'demo', CAST(N'2022-11-15' AS Date), N'823452961', N'Xã Ngọc Linh, Huyện Vị Xuyên, Hà Giang', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (10, N'demo', CAST(N'2022-11-15' AS Date), N'814058921', N'Xã Tân Thới, Huyện Tân Phú Đông, Tiền Giang', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (11, N'demo', CAST(N'2022-11-15' AS Date), N'791904536', N'Xã Tân Phước, Huyện Tân Thành, Bà Rịa - Vũng Tàu', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (12, N'demo', CAST(N'2022-11-15' AS Date), N'394763912', N'Xã Pom Lót, Huyện Điện Biên, Điện Biên', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (13, N'demo', CAST(N'2022-11-15' AS Date), N'832167843', N'Phường Tiên Cát, Thành phố Việt Trì, Phú Thọ', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (14, N'demo', CAST(N'2022-11-16' AS Date), N'362784091', N'Xã An Hải, Huyện Lý Sơn, Quảng Ngãi', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (15, N'demo', CAST(N'2022-11-16' AS Date), N'766093574', N'Xã Rô Men, Huyện Đam Rông, Lâm Đồng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (16, N'demo', CAST(N'2022-11-16' AS Date), N'782765403', N'Phường Lãm Hà, Quận Kiến An, Hải Phòng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (17, N'demo', CAST(N'2022-11-16' AS Date), N'565137968', N'Xã An Thanh, Huyện Quỳnh Phụ, Thái Bình', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (18, N'Yen', CAST(N'2022-08-01' AS Date), N'333263510', N'89 Lý Nam Đế, Phường Hàng Mã, Quận Hoàn Kiếm, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (19, N'Hoan', CAST(N'2022-11-04' AS Date), N'456456456', N'1020 Nguyễn Tất Thành, Phường Thanh Khê Đông, Thanh Khê, Tp Đà NẴng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (20, N'Phu', CAST(N'2022-08-04' AS Date), N'870456456', N'44 Trần Cung, Phường Nghĩa Tân, Quận Cầu Giấy, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (21, N'Na', CAST(N'2022-09-11' AS Date), N'318706901', N'33 Thi Sách, Phường Hòa Thuận Tây, Quận Hòa Thuận Tây, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (22, N'Ma', CAST(N'2022-02-10' AS Date), N'935263510', N'71 Ngô Văn Sở, Phường Hòa Minh, Liên Chiểu, TP Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (23, N'Ni', CAST(N'2022-08-02' AS Date), N'936563702', N'120 Bạch Mai, Phường 5, Quận Gò Vấp, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (24, N'Ri', CAST(N'2022-12-19' AS Date), N'228187069', N'654 Ngọc Hà, Phường Ngọc Hà , Quận Ba Đình, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (25, N'Ca', CAST(N'2022-02-07' AS Date), N'422563702', N'51 Văn Cao, Phường Liễu Giai, Quận Ba Đình, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (26, N'Mit', CAST(N'2022-11-06' AS Date), N'334456456', N'81 Vũ Chí Thắng , Phường Nghĩa Xá, Quận Lê Chân, Hải Phòng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (27, N'Oi', CAST(N'2022-12-11' AS Date), N'844187069', N'12 Phan Tứ, Phường Mỹ An , Quận Sơn Trà, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (28, N'Luoc', CAST(N'2022-10-10' AS Date), N'565263510', N'256 Lương Hữu Khánh, Phường Phạm Ngũ Lão, Quận 1, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (29, N'Lan', CAST(N'2022-09-02' AS Date), N'466563702', N'99 Bạch Đằng , Thượng Lý, Quận Hồng Bàng, Hải Phòng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (30, N'Qui', CAST(N'2022-11-04' AS Date), N'779456456', N'35 Ngự Bình , An Cựu, Quận Thành phố Huế, Huế', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (31, N'Ta', CAST(N'2022-06-08' AS Date), N'333233510', N'311 Bà Triệu, Phường Bắc Sơn, Thành Phố Sầm Sơn, Thanh Hóa', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (32, N'Hi', CAST(N'2022-12-06' AS Date), N'870446456', N'101 Đồng Văn Cống, Phường An Thới, Quận Bình Thủy, Cần Thơ', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (33, N'Mi', CAST(N'2022-01-01' AS Date), N'774133069', N'12 Duy Tân, Phường Thuận Đông , Quận Hải Châu, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (34, N'Va', CAST(N'2022-02-10' AS Date), N'865240110', N'40 Tây Thạnh, Phường Tây Thạnh, Quận Tân Phú, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (35, N'Lay', CAST(N'2022-04-04' AS Date), N'909001456', N'32 Ba Vì, Phường 15, Quận Phú Nhuận, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (36, N'ba', CAST(N'2022-12-29' AS Date), N'873004069', N'220 Bùi Thị Xuân, Phạm Ngũ Lão , Quận 1, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (37, N'ma', CAST(N'2022-08-01' AS Date), N'333200510', N'189 Lý Nam Đế, Phường Hàng Mã, Quận Hoàn Kiếm, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (38, N'Hoang', CAST(N'2022-11-04' AS Date), N'450066456', N'1022 Nguyễn Tất Thành, Phường Thanh Khê Đông, Thanh Khê, Tp Đà NẴng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (39, N'Phung', CAST(N'2022-08-14' AS Date), N'870077456', N'40 Trần Cung, Phường Nghĩa Tân, Quận Cầu Giấy, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (40, N'Nhanh', CAST(N'2022-09-11' AS Date), N'318722900', N'30 Thi Sách, Phường Hòa Thuận Tây, Quận Hòa Thuận Tây, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (41, N'Manh', CAST(N'2022-02-10' AS Date), N'935200510', N'181 Ngô Văn Sở, Phường Hòa Minh, Liên Chiểu, TP Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (42, N'Ninh', CAST(N'2022-08-02' AS Date), N'936003702', N'110 Bạch Mai, Phường 5, Quận Gò Vấp, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (43, N'Rin', CAST(N'2022-12-19' AS Date), N'228100069', N'65 Ngọc Hà, Phường Ngọc Hà , Quận Ba Đình, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (44, N'Can', CAST(N'2022-01-07' AS Date), N'422500702', N'50 Văn Cao, Phường Liễu Giai, Quận Ba Đình, Hà Nội', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (45, N'Mip', CAST(N'2022-12-06' AS Date), N'334300456', N'80 Vũ Chí Thắng , Phường Nghĩa Xá, Quận Lê Chân, Hải Phòng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (46, N'Huyn', CAST(N'2022-12-11' AS Date), N'844100069', N'120 Phan Tứ, Phường Mỹ An , Quận Sơn Trà, Đà Nẵng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (47, N'Luc', CAST(N'2022-10-10' AS Date), N'560063510', N'26 Lương Hữu Khánh, Phường Phạm Ngũ Lão, Quận 1, Hồ Chí Minh', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (48, N'ky', CAST(N'2022-09-02' AS Date), N'466007702', N'125 Bạch Đằng , Thượng Lý, Quận Hồng Bàng, Hải Phòng', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (49, N'Tung', CAST(N'2022-11-04' AS Date), N'700886456', N'350 Ngự Bình , An Cựu, Quận Thành phố Huế, Huế', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (50, N'Tan', CAST(N'2022-06-08' AS Date), N'330099510', N'31 Bà Triệu, Phường Bắc Sơn, Thành Phố Sầm Sơn, Thanh Hóa', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (161, N'T1', CAST(N'2022-11-22' AS Date), N'0969794458', N'123 Nguyễn Văn Thoại, Sơn Trà, Đà Nẵng', N'Thức Skin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (162, N'ThucSkin', CAST(N'2022-11-22' AS Date), N'093464366', N'21 Phú Thanh1, Liên Chiểu, Đà Nẵng', N'Thức Skin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (163, N'ThucSkin', CAST(N'2022-11-22' AS Date), N'092345233', N'123 Nguyễn Thị Xương, Liên Chiểu, Đà Nẵng', N'Thức Skin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (164, N'Thuc', CAST(N'2022-11-23' AS Date), N'0943543545', N'123 Nguyễn Văn Linh, Thanh Khuê, Đà Nẵng', N'Thức Skin', N'')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (165, N'staff', CAST(N'2022-11-23' AS Date), N'0932094324', N'123 bingchiling', N'Staff', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (166, N'T1', CAST(N'2022-11-23' AS Date), N'09987687687', N'123 Phu thanh1 Da Nang', N'Thuc Skin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (167, N'T11', CAST(N'2022-11-23' AS Date), N'094444444444', N'123 luong minh chau, Ha Noi', N'Thuc SKin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (170, N'T11', CAST(N'2022-11-24' AS Date), N'094444444444', N'21 phu thanh 1', N'Thuc Skin', N'thucdc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (174, N'T11', CAST(N'2022-11-24' AS Date), N'', N'', N'', N'')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (175, N'T11', CAST(N'2022-11-24' AS Date), N'0933333333', N'21 phu thanh', N'Thuc Skin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (176, N'user', CAST(N'2022-11-25' AS Date), N'093534545', N'21 phu thanh1 da nang', N'Thuc Skin', N'thucfc2002@gmail.com')
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email]) VALUES (177, N'user', CAST(N'2022-11-25' AS Date), N'09444444444', N'99 Phu Thanh, Hoa Khanh Bac, Da Nang', N'Thuc Skin', N'thucfc2002@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (4, N'Realme C35', 120, 4990000, 20, N'realme-9-pro.jpg', N'realme1.png', N'realme-2.png', N'realme-3.png', NULL, CAST(N'2022-11-10' AS Date), N'Chip A13 Bionic, hệ điều hành IOS 13 kết hợp hoàn hảo - 
RAM 4GB, bộ nhớ trong 64GB hoạt động mượt mà, đa nhiệm -
Hệ thống camera kép mới 12 MP cho góc chụp siêu rộng -
Camera selfie 12 MP chụp hình ở chế độ chuyển động chậm -
Màn hình IPS LCD 6.1 inch Liquid Retina hiển thị sắc nét -
Pin chuẩn Li-Ion, dung lượng pin tốt, thời gian lướt web lâu.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (8, N'Iphone 11 64GB', 100, 10790000, 15, N'ip11.png', N'ip11-1.png', N'ip11-2.png', N'ip11-3.png', NULL, CAST(N'2022-01-01' AS Date), N'Chip A13 Bionic, hệ điều hành IOS 13 kết hợp hoàn hảo - 
RAM 4GB, bộ nhớ trong 64GB hoạt động mượt mà, đa nhiệm -
Hệ thống camera kép mới 12 MP cho góc chụp siêu rộng -
Camera selfie 12 MP chụp hình ở chế độ chuyển động chậm -
Màn hình IPS LCD 6.1 inch Liquid Retina hiển thị sắc nét -
Pin chuẩn Li-Ion, dung lượng pin tốt, thời gian lướt web lâu.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (9, N'iPhone 13 Pro Max 256GB Vàng Đồng', 50, 36290000, 25, N'ip13MaVang.png', N'img-1.png', N'img-2.png', N'img-3.png', NULL, CAST(N'2022-01-01' AS Date), N'Chip Apple A15 Bionic xử lý tác vụ mạnh mẽ, trải nghiệm game mượt mà. -
Màn hình OLED 6.7'''' Super Retina XDR hiển thị hình ảnh sắc nét, chân thực. -
Tần số quét 120Hz cho thao tác chạm lướt mượt mà, xem video mãn nhãn. -
Cụm 3 camera 12MP: camera tele, Wide, Ultra Wide chụp ảnh chuyên nghiệp. -
iPhone 13 Pro Max kháng nước bụi chuẩn IP68 cho bạn yên tâm sử dụng.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (10, N'iPhone 12 64GB Xanh lá', 100, 19990000, 10, N'ipXanhLa.png', N'img-1.png', N'img-2.png', N'img-3.png', NULL, CAST(N'2022-01-01' AS Date), N'Mặt lưng của điện thoại được làm bằng kính tạo nên sự thanh lịch và đẳng cấp. -
Màn hình 6.1 inch cho không gian trải nghiệm hoàn hảo. -
Tấm nền Super Retina XDR mang đến hình ảnh sắc nét. -
Cụm camera kép cho phép chụp ảnh góc rộng và siêu rộng. -
Chip Apple A14 Bionic cho hiệu năng mạnh hơn đến 50%. -
Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường. -
Chất liệu kính Ceramic Shield giúp bền hơn gấp 4 lần. -
Bộ nhớ trong 64GB đủ đáp ứng nhu cầu lưu trữ dữ liệu. ', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (11, N'Laptop HP 14-DV2051TU i3', 20, 16690000, 15, N'Laptop HP 14-DV2051TU i3.png', NULL, NULL, NULL, NULL, CAST(N'2022-11-10' AS Date), N'Thiết kế sang trọng, tinh tế, hiện đại với trọng lượng nhẹ chỉ 1.41 kg. -
Bộ vi xử lý Intel Core i3-1215U xử lý tốt các tác vụ học tập và văn phòng. -
Ổ cứng SSD 256GB xử lý nhanh các tác vụ, cho không gian lưu trữ tốt. -
Màn hình FHD 14 inch với góc nhìn 178° mang đến khung nhìn tuyệt vời.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (14, N'Iphone14', 450, 43590000, 10, N'iphone-14-pro-max-bac-thumb-600x600.jpg', N'img-1.png', N'img-2.png', N'img-3.png', NULL, CAST(N'2020-10-19' AS Date), N'RAM 4GB, bộ nhớ trong 64GB hoạt động mượt mà, đa nhiệm
Hệ thống camera kép mới 12 MP cho góc chụp siêu rộng
Camera selfie 12 MP chụp hình ở chế độ chuyển động chậm
Màn hình IPS LCD 6.1 inch Liquid Retina hiển thị sắc nét', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (17, N'Laptop Acer Aspire 3 A315-59-381E i3', 20, 13490000, 15, N'Laptop Acer Aspire 3.png', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-1.png', NULL, CAST(N'2022-10-19' AS Date), N'Sở hữu thiết kế nhỏ gọn, kiểu dáng thời thượng với màu bạc cuốn hút. -
Bộ vi xử lý Intel Core i3-1215U với hiệu năng ổn định, xử lý tốt nhiều tác vụ. -
Màn hình FHD 15.6inch đường viền hẹp hiển thị hình ảnh sắc nét, chân thật. -
Trang bị công nghệ BlueLightShield bảo vệ mắt khỏi ánh sáng xanh có hại. -
RAM 8GB kết hợp cùng ổ cứng 512GB cho không gian lưu trữ rộng lớn hơn. -
Đa dạng các cổng kết nối thông dụng đáp ứng tốt nhu cầu làm việc và giải trí.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (18, N'NULMacbook Air M2 2022L', 50, 17800000, 10, N'Macbook Air M2 2022.png', NULL, NULL, NULL, NULL, CAST(N'2022-10-20' AS Date), N'
Macbook Air M2 2022 13.6 inch Apple M2 16GB 256GB', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (19, N'Macbook Pro 16', 40, 17490000, 10, N'Macbook Pro 16.png', NULL, NULL, NULL, NULL, CAST(N'2022-10-20' AS Date), N'Macbook Pro 16 inch 2021 【Apple M1 Pro 10-core CPU, 16-core GPU】16GB 1TB', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (22, N'iPad Pro 11 2020', 150, 15490000, 15, N'iPad Pro 11 2020.png', NULL, NULL, NULL, NULL, CAST(N'2022-10-28' AS Date), N'Đánh giá iPad Pro 11 2020 Wifi – Tablet với hệ thống camera sau và con chip A12Z ấn tượng', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2015, N'Điện thoại Xiaomi Redmi Note 11 Pro', 10, 6790000, 20, N'Xiaomi-redmi-note-11-blue-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', NULL, CAST(N'2022-11-11' AS Date), N'Xiaomi Redmi Note 11 Pro 4G mang trong mình khá nhiều những nâng cấp cực kì sáng giá. Là chiếc điện thoại có màn hình lớn, tần số quét 120 Hz, hiệu năng ổn định cùng một viên pin siêu trâu.
Thiết kế cứng cáp, cầm nắm rất đầm tay
Điểm nổi bật ở phần thiết kế của Redmi Note 11 Pro chính là cụm camera khá lớn và lồi so với mặt lưng, mặt lưng có chất liệu bằng kính đã được làm phẳng đi. Khung viền bằng nhựa cũng được bo tròn và vát phẳng rất liền mạch, mức độ hoàn thiện tốt, không có hiện tượng ọp ẹp khi mình sử dụng chiếc máy này..
Khung viền phẳng - Xiaomi Redmi Note 11 Pro 4G
', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2016, N'Điện thoại Xiaomi 12 Pro', 10, 25990000, 30, N'xiaomi-12-pro-1-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', NULL, CAST(N'2022-11-11' AS Date), N'Xiaomi 12 Pro - chiếc điện thoại đến từ nhà Xiaomi sở hữu một thiết kế thanh lịch và vô cùng đẳng cấp, mang trong mình một hiệu năng "khủng long" cùng cụm 3 camera 50 MP mang lại khả năng chụp ảnh, quay phim chất lượng hàng đầu phân khúc.
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
Chụp ảnh vào ban đêm - Xiaomi 12 Pro
Tiếp đến là tính năng chụp ảnh xóa phông trên Xiaomi 12 Pro, ảnh cho ra có độ chi tiết cực cao, xử lý hình ảnh rất tốt nhờ cảm biến xóa phông 50 MP giúp nhận diện chủ thể một cách chính xác, tình trạng lẹm ảnh đã được giảm xuống mức thấp nhất, khả năng chụp ở môi trường thiếu sáng cũng đã tốt hơn.
Chụp ảnh xóa phông - Xiaomi 12 Pro
Xiaomi có đề cập đến nhiều công nghệ mới mẻ nhằm hỗ trợ quay phim một cách chuyên nghiệp, trong đó có Chống rung quang học (OIS), mình có sử dụng máy cho việc quay video phố phường trong lúc di chuyển cho thấy video mang lại có độ mượt mà, tình trạng rung lắc được khắc phục rất tốt.
Ảnh từ video - Xiaomi 12 Pro*Ảnh được cắt từ video
Cuối cùng là camera selfie 32 MP và nhiều tính năng làm đẹp hay bộ lọc với đa dạng chủ đề, các bức ảnh mà mình thử qua đều có độ chi tiết tốt, màu da được tái hiện chân thực.
Chụp ảnh selfie - Xiaomi 12 Pro
Hỗ trợ nhiều công nghệ hình ảnh tiên tiến 
Điểm nổi bật có thể kể đến tiếp theo là về phần màn hình với tấm nền AMOLED có độ tương phản cao lên đến 8.000.000:1, hình ảnh hiển thị tươi tắn, màu sắc không thay đổi nhiều khi mình di chuyển góc nhìn, khả năng cho ra màu đen sâu tạo cho mình cảm giác sống động và chân thực khi chơi các tựa game hành động đồ họa cao.
Xem thêm: Màn hình AMOLED là gì? Có gì nổi bật? Thiết bị nào có màn hình AMOLED?
Sở hữu màn hình AMOLED - Xiaomi 12 Pro
Với độ phân giải 2K+ (1440 x 3200 Pixels) cùng mật độ điểm ảnh 522 PPI cho ra nội dung trình chiếu vô cùng rõ nét đến từng chi tiết nhỏ, hỗ trợ cho mình chơi các tựa game sinh tồn, bắn súng dễ dàng hơn.
Màn hình hiển thị chi tiết - Xiaomi 12 Pro
Hỗ trợ tần số quét 120 Hz giúp mình thao tác vuốt chạm trên màn hình một cách trơn tru, uyển chuyển trông rất thích mắt hay hỗ trợ chơi game với hình ảnh hiển thị mượt mà. Màn hình có khả năng điều chỉnh tần số quét thông minh trong phạm vi từ 1 Hz đến 120 Hz giúp tối ưu điện năng hơn.
Hỗ trợ tần số quét cao - Xiaomi 12 Pro
Chơi mọi tựa game với cấu hình hàng đầu
Trang bị bên trong Xiaomi 12 Pro là con chip mạnh mẽ thuộc top đầu thế giới (04/2022) Snapdragon 8 Gen 1 8 nhân với hiệu suất tối đa đạt 3.0 GHz mang đến khả năng xử lý ổn định gần như các tác vụ mà bạn cần như: Chơi game, làm việc, giải trí với mạng xã hội.
Hiệu năng mạnh mẽ - Xiaomi 12 Pro
Nhằm kiểm chứng sức mạnh trên chon chip này, mình có đánh giá hiệu năng của máy qua hai phần mềm chuyên dụng với kết quả như sau: 1159 (đơn nhân), 3433 (đa nhân) trên Benchmark và 12395 điểm ở PCMark.
Điểm đánh giá hiệu năng - Xiaomi 12 Pro
Mình chơi game Liên Quân Mobile trên Xiaomi 12 Pro với mức cấu hình max setting, trải nghiệm mang lại hết sức ấn tượng khi tình trạng giật lag gần như không xảy ra cho dù mình thực hiện những pha combat tổng đòi hỏi hiệu năng cao, tốc độ khung hình luôn được duy trì ổn định ở mức 60 cho đến 63 FPS.
Trải nghiệm Liên Quân Mobile - Xiaomi 12 Pro
Còn trên tựa game PUBG Mobile thì mức cấu hình tối đa máy có thể bật được là Ultra HD cùng tốc độ khung hình cực cao, cho ra hình ảnh sống động và chân thực giúp mình nhận biết được kẻ địch cho dù ở khoảng cách xa, không thấy xuất hiện tình trạng giật lag hay khựng màn hình nhờ tốc độ khung hình được duy trì ổn định loanh quanh 40 FPS.
Cấu hình PUBG Mobile - Xiaomi 12 Pro
Với 12 GB RAM được trang bị thì không có gì phải bàn cãi về trải nghiệm hết sức mượt mà mà nó mang lại cho từng tác vụ vuốt, chạm khi chơi game hay lướt xem tin tức, dù mình có đa nhiệm nhiều ứng dụng cùng một lúc thì tình trạng load lại app đã được giảm xuống mức thấp nhất và gần như rất ít khi xảy ra.
Tính năng mở rộng RAM - Xiaomi 12 Pro
Đáp ứng nhu cầu sử dụng cho cả ngày dài
Máy mang lại cho mình thời lượng sử dụng lên đến 7 tiếng* cho các tác vụ giải trí như lướt web, xem phim, chơi game và dùng mạng xã hội một cách thoải mái nhờ viên pin 4600 mAh.
Thời lượng sử dụng - Xiaomi 12 Pro
Mất khoảng 40 phút* để lấp đầy viên pin từ 0 - 100% nhờ công nghệ sạc pin nhanh 120 W, giúp mình quay lại công việc hay giải trí một cách nhanh chóng và liền mạch.
Xem thêm: Tìm hiểu chi tiết Công nghệ sạc nhanh 120W của Xiaomi
Thời gian sạc - Xiaomi 12 Pro
*Thời gian sử dụng/sạc có thể thay đổi tùy vào tác vụ hay nhiệt độ thiết bị.
Với một bộ thông số cực kỳ ấn tượng và những trải nghiệm tuyệt vời qua những đánh giá bên trên, cho thấy Xiaomi 12 Pro rất xứng đáng với mức giá mà nó trang bị, rất phù hợp đối với những ai muốn chọn mua cho mình một thiết bị chơi game đồ họa cao, chụp ảnh, quay video chuyên nghiệp hay đơn giản chỉ muốn nâng cấp trải nghiệm của bản thân lên một tầm cao mới.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2017, N'Điện thoại Xiaomi 12', 5, 16490000, 10, N'Xiaomi-12-xanh-duong-thumb-mau-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', NULL, CAST(N'2022-11-11' AS Date), N'Điện thoại Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.
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
Nhìn đã mắt với màn hình sắc nét
Xiaomi 12 được trang bị tấm nền AMOLED có kích thước 6.28 inch, mang lại màu sắc rực rỡ, hiển thị vùng tối có chiều sâu hơn cùng một không gian trình chiếu rộng lớn, giúp mình trải nghiệm các tác vụ xem phim, chơi game cực kỳ đã mắt.
Sử dụng màn hình AMOLED - Xiaomi 12
Trước lúc cầm qua máy thì mình khá hụt hẫng khi biết độ phân giải màn hình trên Xiaomi 12 được “cải lùi” so với thế hệ tiền nhiệm, nhưng khi cầm thiết bị trên tay thì mình thấy máy hiển thị rất chi tiết và gần như không kém cạnh quá nhiều so với điện thoại Xiaomi 11 (màn hình 2K+).
Được biết, thì đây là do kích thước màn hình của Xiaomi 12 nhỏ hơn giúp mật độ điểm ảnh tăng cao lên đến 419 ppi, kết hợp cùng những công nghệ hiển thị tiên tiến được nâng cấp, cho ra hình ảnh vô cùng sắc nét và đẹp mắt.
Màn hình hiển thị chi tiết - Xiaomi 12
Xiaomi 12 có các thông số về màu sắc như: Công nghệ True Color, độ bao phủ màu DCI-P3, cùng khả năng hiển thị 68 tỷ màu, đem lại độ chính xác về màu khá cao giúp mình an tâm hơn trên các công việc chỉnh sửa hình ảnh, hỗ trợ việc in ấn cực tốt.
Xem thêm: Độ bao phủ màu DCI-P3 là gì?
Độ chính xác màu sắc cao - Xiaomi 12
Hỗ trợ tần số quét 120 Hz mang lại cho mình cảm giác vuốt chạm rất trơn tru cho các tác vụ lướt web, đa nhiệm hay chơi game với hình ảnh hiển thị trông mượt mà và bắt mắt hơn.
Vuốt chạm mượt mà - Xiaomi 12
Máy trang bị 3 camera có độ phân giải cao
Ở chế độ chụp ảnh 50 MP cho ra các bức hình có độ chi tiết cao, màu sắc được tái hiện chân thực, ảnh sau khi zoom vẫn mang một chất lượng khá ổn, hỗ trợ cho việc hậu kỳ ảnh một cách tốt hơn.
Chụp ảnh ở chế độ thường - Xiaomi 12
Máy mang lại các bức ảnh chụp ở buổi tối rất tốt nhờ ống kính chính có diện tích lớn giúp thu được nhiều ánh sáng hơn, để nâng cao chất lượng thì mình có bật "Chế độ chụp đêm" giúp bức ảnh thu lại có độ chính xác về màu sắc cao hơn mà không bị hòa vào với nhau, hiện tượng lóe sáng cũng được cải thiện đáng kể.
Tính năng chụp đêm - Xiaomi 12
Nhờ trang bị camera góc siêu rộng 13 MP nên kết quả thu được có độ bao quát rộng lớn và sắc nét hơn, các góc của bức ảnh được máy xử lý khá tốt khi vật thể và quang cảnh không bị bóp méo quá nhiều làm mất đi tính chân thực.
Chụp ảnh góc siêu rộng - Xiaomi 12
Camera thứ 3 mà hãng trang bị là camera macro 5 MP giúp mình có được các bức hình chụp cận có độ chi tiết tốt, bắt nét nhanh và màu sắc mang lại rất chân thực.
Chụp ảnh macro - Xiaomi 12
Phần mặt trước trang bị camera selfie độ phân giải lên đến 32 MP, nước ảnh rất trong trẻo, màu da được tái tạo chân thực mà không bị bệt, cho ra những tấm hình làm mình cảm thấy rất là ưng ý.
Chụp ảnh selfie - Xiaomi 12
Trải nghiệm mượt hầu hết các tác vụ
Cung cấp sức mạnh cho Xiaomi 12 là con chip thuộc top đầu trên bảng xếp hạng chipset mạnh mẽ dành cho smartphone (04/2022) đến từ nhà Qualcomm mang tên Snapdragon 8 Gen 1 8 nhân.
Để kiểm chứng sức mạnh trên máy thì mình có test qua hai phần mềm đo hiệu năng với số điểm như sau: 1205 (đơn nhân), 3405 (đa nhân) trên Benchmark và 12936 điểm cho ứng dụng PCMark.
Điểm số hiệu năng - Xiaomi 12
*Benchmark bên trái và PCMark bên phải
Với mức hiệu năng khủng như vậy giúp cho thiết bị thừa sức mang đến những trải nghiệm mượt mà trên các công việc hàng ngày như lướt web, xem phim, đọc tin tức. 
Đa nhiệm mượt mà - Xiaomi 12
Để đi sâu vào khả năng xử lý trên máy mạnh mẽ đến đâu thì mình đã chơi game trên Xiaomi qua 2 trò chơi phổ biến hiện nay như Liên Quân Mobile và PUBG Mobile, được xem là hai tựa game đòi hỏi về hiệu năng khá cao ở thời điểm hiện tại.
Đầu tiên là Liên Quân Mobile, mình chơi với mức cấu hình cao nhất, hình ảnh hiển thị vô cùng đẹp mắt, đổ bóng nhân vật chân thực, không xuất hiện tình trạng khựng hay giật lag, tuy nhiên máy nóng lên khá nhanh khi chơi khoảng từ 15 - 20 phút ở mức cấu hình cao như vậy.
Trải nghiệm Liên Quân Mobile - Xiaomi 12
Tiếp theo đó là tựa game PUBG Mobile với mức đồ họa tối đa có thể bật được là Ultra HD cùng tốc độ khung hình cực cao, mang lại hình ảnh sống động và chân thực, giúp mình nhận diện được kẻ địch ở khoảng cách xa, quan sát rõ nét từng chuyển động của đối thủ.
Cấu hình PUBG Mobile - Xiaomi 12
Tình trạng khựng nhẹ đôi lúc vẫn còn xuất hiện nhưng không đáng kể với tốc độ khung hình dao động loanh quanh 40 FPS, máy khá nóng ở vị trí gần cụm camera khi chơi lâu, để cho thiết bị được mát mẻ thì mình có chuyển mức cấu hình xuống HDR, cho thấy máy hoạt động ở mức FPS cao hơn, ổn định hơn và nhiệt độ cũng giảm đi đáng kể. 
Chiến tốt PUBG Mobile - Xiaomi 12
Điện thoại có RAM 8 GB đem lại khả năng xử lý đa nhiệm phải gọi là “mướt mườn mượt”, khựng máy khi mở nhiều ứng dụng cùng một lúc là điều dường như không xuất hiện ở sản phẩm này trong lúc mình sử dụng.
Trang bị 8 GB RAM - Xiaomi 12
Thời lượng sử dụng lâu dài
Điện thoại trang bị viên pin có dung lượng 4500 mAh được xem là khá ổn, đáp ứng thời lượng on screen hơn 7 tiếng* cho các tác vụ chơi game, lướt YouTube, Facebook và sử dụng trình duyệt.
Thời lượng sử dụng - Xiaomi 12
Với công nghệ sạc nhanh 67 W có khả năng lấp đầy viên pin từ 0 - 100% chỉ trong 50 phút*, giúp bạn quay lại công việc hay các tác vụ giải trí một cách nhanh chóng mà không mất quá nhiều thời gian chờ đợi.
Hỗ trợ sạc pin nhanh - Xiaomi 12
*Thời gian sử dụng/sạc có thể thay đổi tùy vào tác vụ và nhiệt độ của máy
Qua những trải nghiệm bên trên, Xiaomi 12 hoàn toàn xứng đáng với mức giá trang bị bởi những trải nghiệm tuyệt vời mà nó mang lại, là một người dùng quen thuộc với hệ điều hành Android, đam mê chơi game hiệu năng cao và yêu thích một thiết bị có vẻ ngoài cao cấp thì đây là một lựa chọn không thể bỏ qua.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2018, N'Điện thoại Xiaomi 11T 5G 256GB', 3, 10990000, 15, N'xiaomi-11t-256gb-thumb-600x600.jpg', N'xiaomi-1.png', N'xiaomi-3.png', N'xiaomi-2.png', NULL, CAST(N'2022-11-11' AS Date), N'Xiaomi 11T 5G sở hữu màn hình AMOLED, viên pin siêu khủng cùng camera độ phân giải 108 MP, điện thoại Xiaomi sẽ đáp ứng mọi nhu cầu sử dụng của bạn, từ giải trí đến làm việc đều vô cùng mượt mà. 
Cho ra những tác phẩm đầy chân thật với camera 108 MP
Xiaomi đã trang bị cho máy cụm 3 camera sau gồm camera chính 108 MP, camera góc rộng có độ phân giải 8 MP cùng camera telemacro 5 MP kết hợp cùng phần cứng bên trong cho khả năng lấy nét, thu sáng và zoom cực tốt để cho ra những bức ảnh chi tiết dù bạn chụp gần hay chụp xa. 
Cụm camera sau chất lượng - Xiaomi 11T 5G 256GB
Việc chụp ảnh phong cảnh khi đi du lịch cũng diễn ra vô cùng dễ dàng thông qua camera góc rộng 120 độ, mang đến cho bạn tấm hình toàn cảnh đầy ấn tượng, các góc của ảnh cũng không bị bóp hay méo quá nhiều.
Không dừng lại ở đó máy còn được trang bị thêm khả năng chụp đêm siêu rõ nét, làm cho khung cảnh ban đêm thông qua bức ảnh càng thêm chân thực.
Chế độ chụp đêm - Xiaomi 11T 5G 256GB
Bạn sẽ có những bức ảnh chụp cận cảnh cực chi tiết, màu sắc trung thực thông qua ống kính telemacro với tiêu điểm chụp thích hợp khoảng 3 - 7 cm, khơi gợi sự sáng tạo của bạn bằng những tấm ảnh chụp cận cực chất, làm bật lên những nét đẹp ẩn đằng sau những chi tiết siêu nhỏ.
Ảnh chụp từ ống kính telemacro - Xiaomi 11T 5G 256GB
Ghi lại những điều thú vị trong cuộc sống của bạn tựa như một bộ phim điện ảnh với nhiều chế độ quay như Audio Zoom, Magic Zoom, Time Freeze,... thao tác điều chỉnh nhanh chóng với một cái chạm. 
Quay video chuyên nghiệp - Xiaomi 11T 5G 256GB
Camera trước 16 MP cùng các tính năng thông minh như: Làm đẹp, xóa phông, selfie ban đêm,... cho những bức ảnh của bạn thêm phần tươi mới, xinh đẹp không cần qua ứng dụng chỉnh sửa.
Ảnh chụp từ camera selfie - Xiaomi 11T 5G 256GB
Sẵn sàng “chiến” mọi tựa game 
Điện thoại trang bị con chip MediaTek Dimensity 1200 8 nhân, được sản xuất trên tiến trình 6 nm cho mức xung nhịp tối đa là 3 GHz, mang đến một hiệu năng mạnh mẽ giúp máy chạy mượt các tựa game như: PUBG Mobile, Tốc Chiến,... hay chạy các phần mềm chỉnh sửa ảnh như: VSCO, PicsArt, Snapseed, Lightroom,...
Trang bị chip MediaTek Dimensity 1200 - Xiaomi 11T 5G 256GB
Chip đồ họa Mali-G77 MC9 giảm 30% năng lượng tiêu thụ hơn thế hệ trước là Mali-G76. Chip này sử dụng các tập lệnh mới và hỗ trợ đầy đủ cho các API đồ họa, ví dụ như Vulkan API để bạn trải nghiệm game đồ hoạ đã mắt hơn.
Trải nghiệm đồ họa mượt mà - Xiaomi 11T 5G 256GB
Điện thoại Xiaomi 11T 5G còn trang bị kết nối 5G bắt kịp xu thế của thị trường công nghệ, có tốc độ truy cập mạng nhanh và ổn định, đáp ứng nhu cầu truy cập internet tra cứu thông tin, giải trí, chơi game online mọi lúc mọi nơi.
Hỗ trợ kết nối 5G hiện đại - Xiaomi 11T 5G 256GB
Một chiếc điện thoại ngoài CPU thì không thể nào thiếu RAM và chiếc máy này sở hữu RAM 8 GB cho khả năng đa nhiệm mượt mà, và góp phần nâng cao khả năng xử lý của cả chiếc điện thoại.
Bộ nhớ trong 256 GB chuẩn UFS 3.1 cho tốc độ truy xuất dữ liệu nhanh chóng và có một không gian lưu trữ lớn để bạn có thể tha ga tải game, lưu ảnh hay video yêu thích mà không lo nhanh đầy bộ nhớ.
Dung lượng bộ nhớ - Xiaomi 11T 5G 256GB
Xiaomi 11T 5G được tích hợp MIUI 12.5 hoạt động dựa trên trên Android 11 với khả năng tối ưu hiệu năng, bộ nhớ nền được sử dụng ít hơn 35% và năng lượng tiêu thụ cũng được giảm 25% giúp kéo dài thời gian sử dụng của bạn.
Giao diện MIUI 12.5 - Xiaomi 11T 5G 256GB
Sử dụng cả ngày dài chỉ với một lần sạc
Xiaomi 11T được trang bị viên pin 5000 mAh bạn có thể làm việc, chơi game, nghe nhạc hay xem phim trong khoảng một ngày với tần suất sử dụng cao. Không chỉ có thế điện thoại hỗ trợ công nghệ sạc pin nhanh 67 W cho thời gian sạc đầy pin nhanh hơn. Theo hãng công bố thì với công suất sạc này thì thời gian sạc đầy là 36 phút, vô cùng nhanh chóng đối với viên pin 5000 mAh.
Dung lượng pin 5000 mAh, hỗ trợ sạc nhanh 67 W - Xiaomi 11T 5G 256GB
Màn hình lớn, độ phân giải cao cho hình ảnh sắc nét
Sử dụng màn hình AMOLED có kích thước cực lớn đến 6.67 inch kết hợp cùng camera selfie “đục lỗ” tạo không gian hiển thị rộng mở hơn. Màn hình đạt độ phân giải Full HD+ với mật độ điểm ảnh dày đặt giúp hiện rõ nét, màu sắc của nội dung cũng được căn chỉnh hợp lý, cực kỳ hút mắt khi xem.
Màn hình AMOLED 6.67 inch - Xiaomi 11T 5G 256GB
Màn hình điện thoại có thể đạt độ sáng tối đa 1000 nits giúp hình ảnh hiển thị rõ ràng, hạn chế tình trạng màn hình bị mờ, lóe sáng khi bạn sử dụng ở nơi cường độ ánh sáng cao. Tích hợp thêm công nghệ TrueColor tái tạo màu sắc thêm phần chính xác, khi xem phim giúp bạn cảm nhận được những gì mà đạo diễn muốn truyền tải.
Độ sáng đạt 1000 nits - Xiaomi 11T 5G 256GB
Màn hình trên 11T có độ độ làm mới 120 Hz là một trang bị tuyệt vời dành cho các game thủ, nó đem đến những màn chuyển cảnh vô cùng mượt mà, tạo một lợi thế tốt khi chơi game hay xem phim trên điện thoại cũng vô cùng thích mắt. Xiaomi 11T được hỗ trợ tính năng AdaptiveSync giúp tự động điều chỉnh tần số màn hình cho phù hợp với nội dung bạn đang xem giúp tối ưu điện năng tiêu thụ.
Tần số 120 Hz cho chuyển động mượt mà - Xiaomi 11T 5G 256GB
Màn hình của máy được phủ một lớp kính cường lực Gorilla Glass Victus có độ bền khá cao, khả năng chống trầy tốt, sử dụng thoải mái hơn không cần lúc nào cũng lo lắng màn hình bị xước hay vỡ.
Được phủ kính cường lực Gorilla Glass Victus - Xiaomi 11T 5G 256GB
Ấn tượng với vẻ ngoài cao cấp
Vỏ ngoài của 11T được tạo nên từ khung kim loại và mặt lưng kính cường lực cho độ bền cao cùng vẻ ngoài vô cùng cao cấp. Các chi tiết máy đều được hoàn thiện tỉ mỉ, chắc chắn. Trọng lượng máy chỉ 203 g và mỏng 8.8 mm khi cầm khá vừa tay, không quá nặng nề.
Thiết kế trẻ trung, hiện đại - Xiaomi 11T 5G 256GB
Cụm camera sau được xếp thẳng hàng nhưng lại có kích thước to nhỏ khác nhau nhìn khá độc đáo. Máy có 3 phiên bản màu sắc là Xám thiên thạch, Trắng ánh trăng và Xanh thiên hà dù bạn là người cá tính hay nhẹ nhàng đều có màu sắc phù hợp nhé.
Có nhiều màu sắc để lựa chọn - Xiaomi 11T 5G 256GB
Máy được trang bị tính năng bảo mật vân tay với cảm biến được đặt ngay cạnh viền, vừa cho khả năng bảo mật tốt vừa đảm bảo tính thẩm mỹ, nét sang trọng cho máy.
Cảm biến vân tay cạnh viền - Xiaomi 11T 5G 256GB
Có một mức giá chỉ thuộc dòng cận cao cấp, nhưng Xiaomi 11T lại cho bạn một hiệu năng đầy mạnh mẽ với chip Dimensity 1200 có kết nối 5G, một màn AMOLED sắc nét hay khả năng sạc nhanh 67 W vô cùng ấn tượng. Với Xiaomi 11T thiết bị sẵn sàng cùng bạn khám phá mọi thứ.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2019, N'Điện thoại POCO C40', 10, 2990000, 30, N'xiaomi-poco-c40-thumb-vang-600x600.jpg', NULL, NULL, N'xiaomi-2.png', NULL, CAST(N'2022-11-11' AS Date), N'Tháng 06/2022 điện thoại POCO C40 đã chính thức được cho ra mắt tại thị trường Việt Nam, sở hữu màn hình kích thước lớn, viên pin dung lượng khủng và một con chip JR510 mới lạ trên thị trường công nghệ hiện nay.
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
Các thông số trên khá cơ bản trong tầm giá, đồng thời do sở hữu một màn hình lớn và chỉ dừng lại ở độ phân giải HD+ nên khi nhìn kỹ thì hình ảnh dừng ở mức tạm ổn, không bị rỗ nhiều, phù hợp cho các nhu cầu cơ bản của hầu hết mọi người dùng hiện nay.
Màn hình rộng lớn - POCO C40
Mình đã sử dụng điện thoại để xem bản đồ khi đi ngoài đường, thì nhờ điện thoại có độ sáng 400 nits nên các chi tiết hiển thị ổn và dễ nhìn, tuy nhiên khi xem ở ánh nắng trực tiếp thì chất lượng có giảm đi chút ít nhưng vẫn có thể sử dụng được.
Điểm làm mình ấn tượng khi sử dụng C40 là về phần âm thanh của máy, mình đã nghe nhạc cũng như xem YouTube thì cảm thấy chất lượng âm thanh to, không bị rè.
Chiến game thả ga, không lo gián đoạn
Để trải nghiệm những tựa game hot trên thị trường hiện nay thì không chỉ sở hữu một màn hình lớn và viên pin khủng, đồng thời bạn phải có một hiệu năng ổn định. Chính vì vậy POCO C40 được trang bị con chip đến từ nhà JLQ có tên gọi JR510 với mức xung nhịp khoảng 2.0 GHz khá ổn định.
Tác vụ mượt mà - POCO C40
Tuy là mẫu điện thoại giá rẻ nhưng POCO C40 lại được trang bị thêm tính năng RAM ảo, tuy nhiên dung lượng RAM mở rộng chỉ dừng lại ở mức 1 GB, về bộ nhớ trong thì máy hỗ trợ mở rộng không gian lưu trữ qua thẻ nhớ ngoài lên đến 1 TB.
Các tác vụ hằng ngày như lướt web, mạng xã hội, họp online thì máy cho một tốc độ ổn, các thao tác chạm, mở ứng dụng được phản hồi khá nhanh. Mình có chơi tựa game Liên Quân Mobile thì máy cho trải nghiệm game khá tốt, không tụt FPS khi chơi ở mức đồ họa tiêu chuẩn. Các thao tác di chuyển mượt, hình ảnh trong game tái tạo đẹp mắt, combat tổng hơi giật lag một ít nhưng không đáng kể. FPS giao động trung bình khoảng 55 và bạn sẽ chiến tựa game này một cách vi vu mà không gặp bất kỳ khó khăn gì.
Chơi game ổn định - POCO C40
Khi đến với tựa game PUBG Mobile thì mình đã thử bật đồ họa ở mức cao nhất mà máy cho phép (đồ họa HD và tốc độ khung hình cao), hiện tượng giật lag đã xảy ra từ lúc vào game cho đến những pha đấu súng, FPS tụt xuống liên tục và hầu như mình không thao tác được gì nhiều khi bật ở mức cấu hình này. Nếu chơi tựa game này thì bạn nên để ở mức cấu hình mượt, tốc độ khung hình cao để trải nghiệm game chất lượng hơn nhé!
Cấu hình tiêu chuẩn - POCO C40
Hãng cũng đã làm rất tốt phần tản nhiệt, mình đã chơi game liên tục trong vòng 1 tiếng 30 phút ở nhiệt độ thông thường thì máy chỉ nóng nhẹ tại vị trí cụm camera sau và không ảnh hưởng gì nhiều đến việc trải nghiệm của mình.
Máy chạy hệ điều hành Android 11 và tùy biến trên MIUI 13 đem đến bạn một giao diện thân thiện với người dùng, tối ưu công việc, không còn tình trạng trễ tin nhắn như trước.
Giao diện thân thiện - POCO C40
Camera kép hỗ trợ AI
Tuy không đánh mạnh vào hệ thống chụp ảnh nhưng bộ đôi camera sau của máy 13 MP & 2 MP cho ra những bức ảnh rất ổn. Bạn sẽ cảm thấy hài lòng khi dùng POCO C40 để chụp ảnh.
Camera hỗ trợ AI - POCO C40
Mình đã chụp ảnh từ máy ở điều kiện đầy đủ sáng và bật chế độ HDR, bức ảnh cho ra có độ chi tiết khá tốt, hình ảnh hài hòa và khá chân thực. Hãng có xu hướng làm màu đậm hơn so với thực tế một chút, độ tương phản cao, những yếu tố như cân bằng sáng, màu sắc đều được đảm bảo ở mức ổn.
Ảnh chụp từ camera sau - POCO C40
* Ảnh chụp bật chế độ HDR
Khi tắt chế độ HDR đi thì ảnh cho ra màu hơi tối so với thực tế, tuy nhiên hình ảnh khá sắc nét và màu chân thực. Mình nghĩ khi chụp ảnh trên POCO C40 bạn nên bật chế độ HDR lên để có được những tấm hình ưng ý nhất trên chiếc điện thoại này.
Ảnh chụp không có HDR - POCO C40
*Ảnh chụp không bật chế độ HDR
Về phần camera trước với độ phân giải 5 MP sẽ phù hợp cho việc học tập và hội họp online, máy cũng hỗ trợ tính năng làm đẹp giúp loại bỏ những khuyết điểm nhỏ trên khuôn mặt để bạn tự tin hơn mỗi khi selfie.
Camera trước 5MP - POCO C40
Ngoại hình đầy màu sắc
Mình rất thích thiết kế lần này mà hãng đã dành riêng cho POCO C40, đây là một sự lột xác hoàn toàn về mặt ngoại hình khi mặt lưng của máy được giả da vô cùng sang trọng. Màu sắc trang bị trên máy vô cùng đẹp mắt khi có ba loại màu cho bạn lựa chọn: Vàng, xanh lá, đen.
Đa dạng màu sắc - POCO C40
Với thiết kế mặt lưng giả da sẽ giúp ích rất nhiều cho việc cầm nắm khi hạn chế bám mồ hôi và dấu vân tay. Mặt sau của máy trang bị cụm camera sau tích hợp với cảm biến vân tay vô cùng hầm hố và nam tính, tạo điểm nhấn với mọi người xung quanh.
Mặt lưng giả da - POCO C40
Điện thoại POCO C40 có khung viền bo cong nhẹ làm cho máy toát lên nét hiện đại và năng động. Bốn góc được bo tròn mềm mại tạo cảm giác thoải mái khi sử dụng. Với thiết kế nguyên khối làm tổng thể trở nên cực kỳ chắc chắn, không chỉ đẹp mà còn tăng độ bền.
Thiết kế giọt nước - POCO C40
POCO C40 - một sản phẩm có thiết kế cũng như màu sắc bắt mắt, màn hình được đầu tư để mang lại trải nghiệm rộng rãi, hiệu năng có thể cùng bạn xử lý các tác vụ cơ bản cùng một thông số pin ấn tượng. POCO C40 hứa hẹn sẽ khuynh đảo phân khúc tầm điện thoại giá rẻ trong thời gian tới.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2020, N'Điện thoại Xiaomi Redmi Note 11 (6GB/128GB)', 15, 4990000, 15, N'Xiaomi-redmi-note-11-blue-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', NULL, CAST(N'2022-11-11' AS Date), N'Redmi Note 11 (6GB/128GB) vừa được Xiaomi cho ra mắt, được xem là chiếc smartphone có giá tầm trung ấn tượng, với 1 cấu hình mạnh, cụm camera xịn sò, pin khỏe, sạc nhanh mà giá lại rất phải chăng.
Thiết kế bo cong đậm chất Xiaomi
Xiaomi Redmi Note 11 xuất hiện với màu sắc trẻ trung, tất cả đều rất thời trang, sang trọng, đẹp mắt. Thiết kế cạnh bo cong mềm mại, hiện đại cho tổng thể điện thoại, nổi bật ở cụm camera sau được đặt trong mô-đun lớn.
Màu sắc trẻ trung | Xiaomi Redmi Note 11
Màn hình Xiaomi Redmi Note 11 kích cỡ 6.43 inch với camera đục lỗ, sở hữu 2 cạnh bên và cạnh trên siêu mỏng, cho diện tích màn hình trải nghiệm tốt, đã mắt và tạo sự tập trung khi xem.
Màn hình đục lỗ - Xiaomi Redmi Note 11
Điện thoại được trang bị bảo mật vân tay cạnh viền hỗ trợ bảo mật tốt, độ nhạy cao để truy cập màn hình nhanh qua 1 chạm.
Cảm biến vân tay cạnh viền - Xiaomi Redmi Note 11
Hiệu năng mạnh mẽ với chip Snapdragon
Máy sử dụng CPU Snapdragon 680 8 nhân tốc độ xử lý đạt 2.4 GHz cùng GPU Adreno 610 có hiệu suất cao, mang đến hiệu năng ấn tượng cho chiếc smartphone tầm trung như Xiaomi Redmi Note 11, chạy đa nhiệm mượt mà trên các tác vụ quen thuộc như lướt web, xem YouTube hay chơi game như Liên Quân Mobile và PUBG Mobile.
MediaTek Dimensity 810 5G - Xiaomi Redmi Note 11
Máy được hỗ trợ RAM 6 GB hoạt động ổn định khi mở cùng lúc nhiều ứng dụng, không bị tình trạng giật đơ màn hình. Dung lượng bộ nhớ 128 GB khá thoải mái cho nhu cầu lưu trữ cá nhân.
Màn hình sắc nét, chiến game mượt mà
Xiaomi Redmi Note 11 sở hữu màn hình AMOLED có góc nhìn rộng, màu đen sâu, tỉ lệ màn hình so với thân máy cao tạo không gian trải nghiệm tuyệt vời khi giải trí.
90 Hz - Xiaomi Redmi Note 11
Độ phân giải màn hình đạt chuẩn Full HD+ cho mọi hình ảnh đều sắc nét, chân thật và cuốn hút. Cùng với tốc độ làm tươi đến 90 Hz đảm bảo từng thao tác chạm vuốt thật mượt, gia tăng tốc độ chiến game để nắm trọn các cơ hội dẫn điểm.
Bắt trọn từng khoảnh khắc với cụm camera xịn sò
Cụm camera sau của Xiaomi Redmi Note 11 được đặt trong mô-đun lớn nổi bật, chứa 1 cảm biến chính đến 50 MP, một camera 8 MP và 2 camera cùng độ phân giải 2 MP.
Cụm camera | Xiaomi Redmi Note 11
Nhờ sự kết hợp của các camera này, chất lượng quay phim, chụp ảnh AI trên Xiaomi Redmi Note 11 dễ dàng thuyết phục bạn, với ảnh chụp tổng thể, ảnh chụp cận hay chụp chân dung đều sắc nét, tương phản tốt, có hồn, thể hiện rõ nội dung mà người chụp ảnh muốn truyền đạt, cho bạn tự tin sáng tạo.
Giao diện camera | Xiaomi Redmi Note 11
Khả năng lấy nét và bắt sáng tốt, góc chụp rộng hỗ trợ bạn chụp phong cảnh đẹp, cùng với công nghệ xóa phông thông minh làm nổi bật chủ thể tạo điểm nhấn cho từng khoảnh khắc bạn ghi hình lại.
Chụp ảnh - Xiaomi Redmi Note 11
Camera trước 13 MP tích hợp đầy đủ các tính năng từ xóa phông, làm đẹp, chụp ảnh HDR, quay video Full HD+ giúp những tấm ảnh của bạn luôn tươi tắn mà không cần chỉnh sửa quá nhiều, tự tin thể hiện trước ống kính.
Trải nghiệm theo cách bạn muốn
Viên pin dung lượng 5000 mAh đủ năng lượng cho 1 ngày dài sử dụng điện thoại với tần suất cao.
Khi thiết bị cạn nguồn, công nghệ sạc pin nhanh 33 W sẽ nhanh chóng phục hồi năng lượng để bạn tiếp tục hành trình trải nghiệm, với các tác vụ đang dang dở.
Sạc 33 W - Xiaomi Redmi Note 11
Nếu so với mức giá mà Xiaomi chào bán thì Redmi Note 11 khá đáng lựa chọn trong phân khúc, đáng được xếp hạng cạnh tranh trong phân khúc điện thoại Android chất lượng tốt giá rẻ cho người dùng săn đón.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2021, N'Điện thoại Xiaomi Redmi 10A', 13, 2490000, 10, N'xiaomi-redmi-10a-thumb-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', NULL, CAST(N'2022-11-11' AS Date), N'Xiaomi Redmi 10A ra mắt tại thị trường Việt Nam vào tháng 07/2022, với ưu điểm là sở hữu pin trâu cùng một màn hình kích thước lớn giúp máy trở thành một smartphone lý tưởng cho những bạn đang tìm mua một thiết bị phục vụ nghe gọi hay xem phim cả ngày. Cùng với đó là giá thành phải chăng để người dùng có thể dễ dàng tiếp cận và mua sắm.
Kiểu dáng thiết kế trẻ trung
Là một chiếc điện thoại giá rẻ nhưng dường như hãng điện thoại Xiaomi vẫn dành sự chăm chút rất nhiều trên sản phẩm của mình, điều này được minh chứng qua vẻ ngoài có độ hoàn thiện cực tốt trên chiếc Redmi 10A. 

Thiết kế bền bỉ - Xiaomi Redmi 10A

Sau một hồi trên tay và quan sát thì mình thấy máy gần như không xuất hiện chi tiết thừa trong lúc sản xuất, những họa tiết từ các đường vân hay khoảng hở ở những phần jack cắm cũng được hoàn thiện khá tốt.
Hoàn thiện tỉ mỉ - Xiaomi Redmi 10A
Mặt lưng của máy được làm từ nhựa cùng với hiệu ứng vân nổi chạy dọc theo thân máy nhằm tạo nên một điểm nhấn mới lạ hơn khi cầm nắm. 
Mặt lưng vân nổi - Xiaomi Redmi 10A
Một điểm thường thấy trên các dòng sản phẩm giá rẻ làm từ nhựa là tình trạng ọp ẹp do cấu tạo bên trong xuất hiện phần rỗng, thế nhưng trên Redmi 10A lại không xuất hiện tình trạng này sau nhiều lần mình thử bóp hay gõ vào mặt lưng. Đây quả thực là một điểm cộng cho phần hoàn thiện mà mình dành dành cho Xiaomi trên sản phẩm này.
Hoàn thiện cao cấp - Xiaomi Redmi 10A
Máy sử dụng kiểu thiết kế bo cong ở hai cạnh giúp cho quá trình sử dụng của mình trở nên dễ chịu. Còn phần mặt trước của máy thì được làm cách biệt so với phần khung khi màn hình được hãng gia công có hơi nhô lên một tí, điều này làm cho quá trình vuốt từ viền màn hình vào trong có hơi bị cấn và chưa được trơn mượt cho lắm.
Cạnh viền bo cong - Xiaomi Redmi 10A
Nhìn một cách tổng quan thì thấy Redmi 10A rất là thon, bởi Xiaomi đã cố tình giảm kích thước bề ngang và tăng chiều dài của máy lên để giúp thiết bị có tạo hình thanh thoát hơn. Tuy nhiên nó lại phát sinh ra việc khó khăn khi bỏ máy trong túi quần, làm cho mình cảm thấy hơi bị cấn trong lúc ngồi hay di chuyển.
Thân hình thon gọn - Xiaomi Redmi 10A
Còn điểm nhấn chính ở phần mặt lưng chính là cụm camera được bao bọc bởi một viền đen có tích hợp thêm mở khóa vân tay hết sức độc đáo. 
Vân tay mặt lưng - Xiaomi Redmi 10A
Bên cạnh nhiều điểm nổi bật trên thì cũng có một vài hạn chế cần đánh đổi để có mức giá bán phù hợp đó chính là mặt lưng bám khá nhiều mồ hôi. 
Thoải mái sử dụng cả ngày dài
Viên pin được trang bị bên trong Redmi 10A có dung lượng lên đến 5000 mAh, qua một thời gian sử dụng thì mình thấy máy tụt pin rất chậm. Ở trạng thái đầy 100% thì máy đem đến cho mình một thời lượng dùng lên đến 8 giờ 38 phút* với các tác vụ như: Nhắn tin, xem phim, nghe nhạc hay chơi game.
Sử dụng dài lâu - Xiaomi Redmi 10A
Vì được trang bị con chip không sử dụng quá nhiều năng lượng cũng như ít sinh ra nhiệt nên mình cũng đã có thử vừa sạc và vừa chơi game ở môi trường có điều hòa, cảm nhận tại thời điểm đó theo mình thấy máy không có quá nhiều sự thay đổi bởi nhiệt độ tăng chậm làm cho mình khó mà nhận biết.
Thoải mái sử dụng - Xiaomi Redmi 10A
Có thể là nhờ mặt lưng nhựa có khả năng hạn chế lượng nhiệt được hấp thụ vào, điều này giúp cho quá trình cầm nắm sử dụng lúc chơi game của mình trở nên thoải mái hơn. Tuy nhiên mình không khuyến khích người dùng vừa sạc vừa sử dụng một cách thường xuyên, bởi khi làm vậy trong thời gian dài sẽ làm giảm tuổi thọ của pin cũng như linh kiện trong máy.
Hiệu năng ổn định nhờ chipset đến từ MediaTek
Cấu hình của điện thoại chắc hẳn là điều được khá nhiều bạn quan tâm, bởi sau nhiều giờ làm việc hay liên lạc thì cũng cũng cần có một khoảng thời gian giải trí như chơi game chẳng hạn. Vì thế nên mình cũng đã chơi qua một vài tựa game nhằm kiểm chứng sức mạnh của con chip MediaTek Helio G25 có thể mang đến trải nghiệm ra sao.
Xem thêm: Tìm hiểu chip xử lý Helio G-series của MediaTek
Hiệu năng ổn định - Xiaomi Redmi 10A
Đầu tiên là Liên Quân Mobile ở mức cấu hình cao nhất mà máy có thể đạt được, trải nghiệm cho ra chưa thực sự làm mình ưng ý cho lắm khi tình trạng dao động FPS ít đồng đều nên hay gặp phải tình trạng khựng hay giật lag. Tốc độ khung hình đo được dao động loanh quanh ở mức 43.2 FPS.
Tốc độ khung hình - Xiaomi Redmi 10A
Nhằm cải thiện tình trạng trên thì mình cũng có giảm mức cấu hình xuống thấp hơn thì thấy máy hoạt động ổn định, tuy nhiên chất lượng hình ảnh có giảm đi và chưa thực sự trở nên xuất sắc cho lắm.
Tựa game tiếp đến là PUBG Mobile mình cài đặt ở mức đồ họa mượt và tốc độ khung hình trung bình nhằm giúp máy có thể hoạt động ổn định nhất có thể, FPS mình đo được ở tựa game này dao động vào khoảng 22.1.
Tốc độ khung hình - Xiaomi Redmi 10A
Tình trạng giật lag cũng đôi khi xuất hiện trong những lúc vừa nhảy dù, tuy nhiên điều này cũng có cải thiện khi mình bắt đầu đi nhặt đồ và không có giao tranh. Máy sẽ bị khựng màn hình khi phát hiện có kẻ địch ở gần, biểu đồ dao động FPS cũng sẽ bị biến động khá nhiều khi mình bắt đầu tham chiến.
Vì đây là sản phẩm giá rẻ được Xiaomi tập trung vào phần pin nên về mặt cấu hình chưa thực sự tối ưu cho việc chơi game cũng là điều dễ hiểu. Tuy nhiên với nhu cầu chơi những tựa game online như đánh bài hay đấu cờ thì Redmi 10A xử lý một cách rất tốt.
Chụp ảnh tốt hơn với bộ đôi camera
Tuy là sản phẩm giá rẻ nhưng Xiaomi vẫn đầu tư cho chiếc điện thoại Redmi này bộ camera kép với camera chính có độ phân giải 13 MP và cảm biến phụ 2 MP. Với thông số như vậy thì máy hoàn toàn có thể đem đến cho mình những bức ảnh rất ổn áp.
Trang bị 3 camera - Xiaomi Redmi 10A
Cụ thể là mình đã đem Redmi 10A đi chụp ảnh ở môi trường ngoài trời có đầy đủ ánh sáng, kết quả cho ra có chi tiết cao nên lúc zoom ảnh lên khoảng 30% thì mình cũng không thấy tình trạng bể hình xuất hiện quá nhiều trong tấm ảnh.
Ảnh chụp từ camera - Xiaomi Redmi 10A
*Ảnh chụp nguyên bản 
Ảnh chụp từ camera - Xiaomi Redmi 10A
*Ảnh chụp sau khi phóng to
Với những môi trường có độ sáng không được cao cho lắm thì máy cũng có khả năng xử lý tốt, những vùng tối cũng được cân bằng và nâng độ sáng lên làm cho tổng quan bức hình được dễ hình hơn hẳn.
Ảnh chụp từ camera - Xiaomi Redmi 10A
Tuy không sở hữu cảm biến quá xịn sò nhưng khả năng bắt nét trên Redmi 10A lại làm mình rất ngạc nhiên, quan sát kỹ sẽ thấy các phương tiện dưới đây đang di chuyển rất nhanh nhưng máy vẫn có thể chụp được bức ảnh rõ nét mà không gặp bất kỳ tình trạng nhòe ảnh nào cả.
Tốc độ bắt nét nhanh - Xiaomi Redmi 10A
Trải nghiệm tốt hơn trên màn hình kích thước lớn
Vì được sử dụng công nghệ màn hình IPS LCD nên hình ảnh cho ra có màu sắc tương đối trung thực, điểm mình đánh giá cao trên tấm nền này là màn hình không xuất hiện tình trạng ám xanh hay ám vàng giúp cho mình nhận diện màu sắc được chính xác hơn.
Xem thêm: Màn hình IPS LCD là gì? Có gì nổi bật? Thiết bị nào có màn hình IPS?
Tấm nền IPS LCD - Xiaomi Redmi 10A
Với kích thước màn hình lớn lên đến 6.53 inch giúp cho các tác vụ đọc văn bản của mình trở nên thuận tiện hơn, nhờ nhiều nội dung được hiển thị cùng một lúc nên mình có thể đọc văn bản nhanh mà không cần lướt quá nhiều.
Màn hình kích thước lớn - Xiaomi Redmi 10A
Với viền màn hình tương đối mỏng nên khi nhìn thì máy cũng cho ra một cảm giác dễ chịu, phần cằm tuy có hơi dày một tí nhưng đây được xem là một điểm mình rất thích. Với một người hay chơi game thì phần cằm dày được xem là một vị trí lý tưởng để đặt ngón tay mà không sợ phải chạm vào những phím chức năng khác.
Viền màn hình mỏng - Xiaomi Redmi 10A
Redmi 10A được xem là một trong những chiếc smartphone chính hãng có giá thành tốt nhất thị trường hiện nay, sở hữu trong máy là một viên pin có dung lượng 5000 mAh cùng kích thước màn hình lớn giúp bạn trải nghiệm tốt hơn trên các tác vụ xem phim hay chơi game lâu dài.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2022, N'Điện thoại Xiaomi 12T 256GB', 15, 12490000, 20, N'xiaomi-12t-thumb-600x600.jpg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', NULL, CAST(N'2022-11-11' AS Date), N'Xiaomi 12T 256GB là smartphone đầu tiên trên thế giới trang bị con chip Dimensity 8100 Ultra nên máy thu hút được khá nhiều sự chú ý vào thời điểm ra mắt, bộ vi xử lý này không chỉ có hiệu năng mạnh mẽ mà nó còn tối ưu được giá thành cho thiết bị, điều này giúp 12T trở thành chiếc điện thoại quốc dân cực kỳ đáng sắm.
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
Mặt lưng của điện thoại Xiaomi được làm từ kính nên khi cầm vào sẽ mang lại cái nhìn sang trọng hơn. Loại vật liệu này cũng có khả năng hạn chế các vết xước nhẹ nên mình cũng an tâm trong lúc dùng mà không cần ốp.
Mặt lưng làm từ kính - Xiaomi 12T 256GB
Hiệu năng bức phá mọi giới hạn
Không chỉ MediaTek mà Xiaomi cũng quảng bá khá nhiều về hiệu năng trên Dimensity 8100 Ultra, điều này làm phần đông người dùng tò mò về khả năng thực sự của chipset. Để kiểm tra xem điện thoại xử lý mạnh mẽ đến đâu thì mình cũng đã đo qua hai ứng dụng và có kết quả như sau: 914 (đơn nhân), 3734 (đa nhân) trên Benchmark và 12846 trên PCMark.
Hiệu năng mạnh mẽ - Xiaomi 12T 256GB
Một ngày bình thường thì mình thường dùng các ứng dụng như: YouTube, Facebook, Instagram và Chrome, trải nghiệm mà điện thoại mang đến là rất ổn định, tốc độ mở app cũng khá nhanh và gần như không xuất hiện tình trạng khựng mỗi khi chạm vào biểu tượng ứng dụng.
Đến với phần chơi game thì dường như Dimensity 8100 Ultra đã thực sự bộc lộ gần như toàn bộ sức mạnh của chip, minh chứng cho thấy là mình đã chơi qua hai tựa game Liên Quân Mobile và PUBG Mobile ở mức cấu hình cao nhất, kết quả mà mình nhận được là sự ổn định xuyên suốt những ván đấu, hiện tượng giật lag cũng gần như không thấy xuất hiện.
Chơi game mượt mà - Xiaomi 12T 256GB
Ở tựa game Liên Quân Mobile thì mình đã cài đặt trò chơi ở mức đồ họa siêu cao và chất lượng hình ảnh HD, nội dung cho ra làm mình rất hài lòng bởi mọi hiệu ứng từ kỹ năng hay họa tiết trên game đều được mô phỏng rực rỡ và cực kỳ bắt mắt.
Cài đặt cấu hình game - Xiaomi 12T 256GB
Trải nghiệm về mặt ổn định của ván đấu thì Xiaomi 12T gần như không gặp bất kỳ khó khăn nào, từ lúc chọn tướng cho đến những pha giao tranh tổng thì điện thoại cũng đều xử lý mượt mà, tốc độ khung hình ghi nhận trên trò chơi này vào khoảng 60 FPS.
Bảng đo tốc độ khung hình - Xiaomi 12T 256GB
PUBG Mobile chắc hẳn là cái tên không quá xa lạ với phần lớn người dùng hiện nay, độ nặng của game này được xếp vào danh mục những app đòi hỏi thiết bị có hiệu năng cao để có thể xử lý tốt. 
Giờ đây Xiaomi 12T lại có thêm một lần nữa để minh chứng sức mạnh khi máy xử lý tựa game này rất tốt, tuy máy chỉ thuộc dòng sản phẩm cận cao cấp nhưng khi so sánh với một vài mẫu flagship khác thì không có sự chênh lệch quá nhiều, gần như không thể đánh giá cái nào mạnh hơn cái nào qua cảm nhận bằng mắt thường mà cần phải dùng đến con số để so sánh thực tế.
Cài đặt cấu hình trò chơi - Xiaomi 12T 256GB
Nhằm giúp người dùng có thể đối chiếu dễ dàng với những mẫu điện thoại khác thì mình cũng đã đo tốc độ khung hình qua phần mềm PerfDog, con số này loanh quanh ở mức 59 FPS và gần như không có sự dao động quá nhiều để gây ra hiện tượng giật lag. 
Tốc độ khung hình trò chơi  - Xiaomi 12T 256GB
Nhiệt độ là một trong những yếu tố giúp cho điện thoại có thể khai thác được tối đa hiệu năng trên chip nên mình cũng khá là quan tâm. Tuy nhiên nhiệt độ của máy có nóng hay không còn phụ thuộc khá nhiều vào những tiêu chí như: Chuẩn kết nối internet (mạng di động hay wifi), nhiệt độ môi trường, số lượng tác vụ mà điện thoại đang xử lý.
Tản nhiệt tốt hơn - Xiaomi 12T 256GB
Để đánh giá một cách cụ thể thì cũng cũng đã thử qua trong khi chơi game ở môi trường có điều hòa, nhiệt độ lúc này tầm 25 - 26 độ và máy chỉ phục vụ duy nhất cho việc chơi game. Sau khoảng thời gian tầm 40 phút khi chơi PUBG Mobile ở cấu hình cao nhất, máy lúc này chỉ ấm nhẹ lên đôi chút, biểu đồ FPS không có sự thay đổi quá nhiều so với ban đầu.
Trải nghiệm chân thật mọi hình ảnh
Cảm nhận đầu tiên khi nhìn màn hình của Xiaomi 12T là màu sắc hết sức sống động và rực rỡ, chủ thể ở các bộ phim hay trò chơi cũng được làm nổi bật lên nhờ tái hiện màu đen sâu, tất cả những thứ trên làm cho mình có cảm giác như đang chiêm ngưỡng khung cảnh ở bên ngoài đời thực nhờ tấm nền AMOLED.
Màn hình chất lượng - Xiaomi 12T 256GB
Bởi màn hình có độ chính xác về màu sắc cao nên mình cũng an tâm hơn trong việc chỉnh sửa hình ảnh hay video, điều này giúp mình hạn chế được tình trạng sai lệch màu mỗi khi đăng tải nội dung lên trên những nền tảng mạng xã hội, các công nghệ màn hình khác mà hãng trang bị cho Xiaomi 12T là TrueColor, màu dải rộng DCI-P3 và HDR10+.
Hiển thị nội dung sống động - Xiaomi 12T 256GB
Với độ phân giải màn hình 1.5K (1220 x 2712 Pixels) nên hình ảnh đều được hiển thị rõ nét, hỗ trợ cho máy có thể bật được nhiều mức đồ họa cao hơn để trải nghiệm trò chơi một cách đã mắt. Tuy đây là một thiết bị có mức giá không quá cao nhưng được trang bị chuẩn màn hình cao cấp như trên, vậy nên đây được xem là lợi thế rất lớn so với nhiều đối thủ trên thị trường.
HIển thị hình ảnh với độ chi tiết cao - Xiaomi 12T 256GB
Một điểm nổi bật không kém đó chính là tần số quét màn hình 120 Hz, không chỉ mang lại cho mình trải nghiệm vuốt nhanh chóng mà mà máy còn giúp những bộ phim hay trò chơi trở nên mượt mà và nịnh mắt hơn bao giờ hết. 
Tuy nhiên khi dùng máy ở mức tần số quét tối đa thì màn hình tiêu hao năng lượng khá nhiều nên pin tụt tương đối nhanh. Những lúc như này mình thường tùy chỉnh xuống mức tiêu chuẩn là 60 Hz, nhằm đảm bảo thiết bị có thể đáp ứng khả năng duy trì sử dụng cho cả ngày làm việc.
Màn hình tần số quét cao - Xiaomi 12T 256GB
Đáp ứng tốt mọi nhu cầu chụp ảnh
Với nhu cầu sử dụng mạng xã hội ngày càng tăng nên camera chắc hẳn là điều được khá nhiều bạn quan tâm, bởi chất lượng hình ảnh - video mà bạn đăng tải cũng sẽ phụ thuộc khá nhiều vào smartphone và đối với Xiaomi 12T thì đây có lẽ là sự lựa chọn rất hợp lý trong phân khúc tầm trung nhờ trang bị camera chính 108 MP.
Chụp ảnh chất lượng cao - Xiaomi 12T 256GB
Đến với tác vụ chụp ảnh thì lần này nhà Xiaomi mang đến cho chúng ta cụm 3 camera cao cấp, bên cạnh việc trang bị ống kính chính 108 MP thì hãng còn bổ sung thêm cảm biến góc siêu rộng 8 MP và macro 2 MP, giúp mang đến thêm 2 tùy chọn chụp ảnh chuyên nghiệp để làm bộ sưu tập ảnh trở nên phong phú hơn.
Trang bị camera sắc nét - Xiaomi 12T 256GB
Ở môi trường đầy đủ ánh sáng thì ảnh cho ra có chất lượng cao, mọi chi tiết đều thu lại rõ ràng với màu sắc mang tính trung thực. Điều mình thích nhất ở đây là màu ảnh cho ra có độ trong trẻo, nó chỉ hơi rực lên một chút để bức hình có thêm sức sống chứ không bị quá ảo nhằm giữ lại nét chân thực vốn có như ngoài đời thực.
Độ chi tiết của bức ảnh cũng được mình đánh giá là khá tốt sau khi phóng to bức ảnh lên khoảng 30%, nhìn sơ qua thì không có sự thay đổi quá nhiều về chất lượng ảnh, những vùng không có nhiều ánh sáng cũng được lấy nét và thu lại cực kỳ rõ ràng.
Ảnh chụp từ camera - Xiaomi 12T 256GB
*Ảnh chụp nguyên bản
Ảnh chụp từ camera - Xiaomi 12T 256GB
*Ảnh chụp sau khi phóng to
Như mình có để ý thì thấu kính camera chính của Xiaomi 12T được làm với kích thước khá lớn, kèm theo đó là hãng có đề cập đến việc camera sẽ thu sáng và cân bằng bức ảnh tốt thông qua sự nâng cấp này. Có lẽ đây chính là điều giúp bức ảnh của mình chụp ở trong môi trường hơi tối nhưng vẫn cho ra tổng thể rất là nịnh mắt.
Ảnh chụp từ camera - Xiaomi 12T 256GB
Với kích thước ống kính lớn nên ban đầu mình cũng có suy nghĩ rằng camera sẽ chụp ảnh ngược sáng không được tốt bởi lượng ánh sáng thu và là khá nhiều, điều này làm cho bức ảnh bị lóa sáng và không thấy được chủ thể. 
Thế nhưng sau khi trải nghiệm thực tế thì quả thực không phải vậy, Xiaomi 12T hoàn toàn có thể cân được tác vụ này thông qua nhiều thuật toán thông minh đi kèm với tính năng HDR. Như bức ảnh mình chụp dưới đây thì quả thực rất xuất sắc, màu ảnh và độ chi tiết làm mình liên tưởng đến những bức hình từ những dòng DSLR.
Ảnh chụp từ camera - Xiaomi 12T 256GB
Tính năng chụp zoom được xem là một trong những giải pháp mình thường dùng để chụp ảnh ở khoảng cách xa mà không cần di chuyển quá nhiều, với mức 2X thì chất lượng ảnh cho ra có sự khác biệt không quá đáng kể so với 1X. Độ chi tiết cao nên rất phù hợp để chụp bài giảng trên bảng khi ngồi ở khoảng cách xa đối với những bạn đang là học sinh hay sinh viên.
Ảnh chụp từ camera - Xiaomi 12T 256GB
Pin dùng dài lâu - sạc đầy cực mau
Với viên pin có dung lượng 5000 mAh được Xiaomi trang bị cho 12T nên mình cũng không quá lo lắng đến việc rằng máy sẽ hết pin giữa chừng mỗi khi dùng, như mình cũng đã thử dùng qua máy một cách liên tục để sử dụng hầu hết các tác vụ thường ngày thì thấy 12T đáp ứng khoảng 7 giờ 45 phút*.
Sử dụng dài lâu - Xiaomi 12T 256GB
Có thể dung lượng pin là điểm khá nổi bật dành cho Xiaomi 12T thế nhưng điều thu hút nhiều sự chú ý nhất đó chính là công nghệ sạc HyperCharge 120 W. Chỉ cần mất khoảng 24 phút là máy đã có thể lấp đầy từ 0% cho đến 100% dung lượng viên pin khủng, quả là con số rất ấn tượng trên một chiếc điện thoại cận flagship.
Sạc pin nhanh chóng - Xiaomi 12T 256GB
Với một bộ thông số nổi bật đi kèm với mức giá bán lý tưởng nên Xiaomi 12T chắc hẳn sẽ là cái tên mà khó có nhà sản xuất nào có thể vượt mặt ở thời điểm hiện tại, điều này giúp cho 12T dễ dàng được cộng đồng người dùng mệnh danh là chiếc điện thoại chơi game quốc dân mà hầu hết mọi game thủ đều ao ước có được.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2023, N'Điện thoại Xiaomi Redmi Note 10S 6GB', 10, 5290000, 10, N'xiaomi-redmi-note-10s-6gb-thumb-600x600.jpeg', N'xiaomi-1.png', N'xiaomi-2.png', N'xiaomi-3.png', NULL, CAST(N'2022-11-11' AS Date), N'Xiaomi Redmi Note 10S 6GB được xem là điện thoại thuộc phân khúc smartphone giá tầm trung nhưng chinh phục người tiêu dùng với thiết kế sang đẹp, cấu hình ấn tượng và cụm camera cực chất, sẽ là thiết bị liên lạc, chiến game giải trí và làm việc ổn định,… cho các nhu cầu sử dụng của bạn.
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
Chụp góc siêu rộng - Xiaomi Redmi Note 10S 6GB
Bộ đôi camera 2 MP khẩu độ f/2.4 hỗ trợ chụp ảnh macro và xóa phông để tạo ra những bức chân dung nghệ thuật, ghi lại một cách ấn tượng, lôi cuốn các chi tiết cuộc sống quen thuộc, để bạn có cái nhìn khác hơn, độc đáo hơn từ môi trường xung quanh.
Xóa phông - Xiaomi Redmi Note 10S 6GB
Phiên bản Redmi này sở hữu camera trước có độ phân giải 13 MP hỗ trợ nhiều chức năng làm đẹp thông minh, chụp ảnh AI, xóa phông, lấy nét tự động, quay phim Full HD… để mang đến cho bạn những bức ảnh selfie đẹp tự nhiên, luôn tự tin ghi lại những bức ảnh đẹp xuất sắc.
Selfie ấn tượng - Xiaomi Redmi Note 10S 6GB
Giải trí đã mắt trên màn hình sắc nét
Tấm nền AMOLED thể hiện dải màu rộng, độ tương phản cao và hỗ trợ độ sáng màn hình lên đến 1100 nits được trang bị cho Xiaomi Redmi Note 10S 6GB giúp thể hiện những khung hình chân thực, sống động tự nhiên ở mọi môi trường ánh sáng, độ sắc nét cao với chuẩn độ phân giải Full HD+ (1080 x 2400 Pixels).
Màn hình AMOLED - Xiaomi Redmi Note 10S 6GB
Màn hình điện thoại 6.43 inch viền mỏng, camera đục lỗ, diện tích trải nghiệm đủ tốt cho nhu cầu giải trí trên smartphone. Màn hình được phủ bằng lớp kính cường lực Corning Gorilla Glass 3 chống trầy cực tốt, bảo vệ điện thoại bền đẹp, thẩm mỹ.
Hoàn thiện tinh tế, sang đẹp
Xiaomi Redmi Note 10S 6GB có mặt lưng bằng nhựa với khung viền kim loại chắc chắn, các góc cạnh bo viền mềm mại tạo cảm giác cầm nắm chắc tay, tổng thể thiết kế sang chảnh không thua kém những phiên bản smartphone đắt tiền.
Sang chảnh - Xiaomi Redmi Note 10S 6GB
Máy cho phép truy cập màn hình nhanh cùng khả năng bảo mật tốt nhờ hỗ trợ mở khóa khuôn mặt và bảo mật vân tay cạnh viền, bảo vệ tốt thông tin cá nhân trên thiết bị di động của bạn.
Cảm biến vân tay - Xiaomi Redmi Note 10S 6GB
Được bao gồm hệ thống loa kép siêu tuyến tính đạt chuẩn Hi-Res Audio với dải âm thanh cao và rộng hơn, Redmi Note 10S mang đến cho bạn trải nghiệm âm thanh sống động, sảng khoái nhất là khi giải trí.
Loa kép - Xiaomi Redmi Note 10S 6GB
Smartphone đạt chuẩn kháng nước và bụi IP53 cho phép sử dụng điện thoại dưới trời mưa nhỏ hoặc giữ an toàn cho thiết bị trong tình huống bị nước văng bắn.
Thoải mái trải nghiệm với dung lượng pin 5000 mAh, hỗ trợ sạc nhanh
Dung lượng pin khá tốt đảm bảo cho bạn sử dụng thoải mái theo nhu cầu, ở tần suất cao suốt ngày dài mà không ái ngại sập nguồn điện thoại.
Sạc nhanh 33W - Xiaomi Redmi Note 10S 6GB
Ngay cả khi cần nạp pin nhanh, chế độ sạc pin nhanh 33 W sẽ nhanh chóng làm đầy pin cho thiết bị để sẵn sàng phục vụ cho nhu cầu của bạn.
Như vậy, với nhiều điểm mạnh trong cả thiết kế, cấu hình và chất lượng camera, pin sạc, chiếc smartphone tầm trung này của Xiaomi xứng đáng là điểm nhắm cho nhu cầu tiêu dùng của nhiều người, khi mong muốn sở hữu điện thoại có giá vừa túi tiền với chất lượng sử dụng thuyết phục.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2024, N'Điện thoại iPhone 11 64GB', 10, 11990000, 15, N'iphone-xi-xanhla-600x600.jpg', N'null', NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.
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
Điện thoại iPhone 11 64GB | Ảnh chụp với Deep Fusion
Ảnh chụp với Deep Fusion
Bên cạnh đó với iPhone 11 thì đây sẽ là lần đầu tiên Apple trang bị khả năng chụp đêm lên chiếc iPhone của mình.
Điện thoại iPhone 11 64GB | Ảnh chụp với chế độ Night Mode Ảnh chụp với chế độ Night Mode
Ảnh chụp với chế độ Night Mode
Theo trải nghiệm thì tính năng này hoạt động rất hiệu quả đặc biệt trong những môi trường cực kỳ thiếu sáng.
Điện thoại iPhone 11 64GB | Ảnh chụp bằng camera sau
Kích hoạt chế độ chụp đêm sẽ do iPhone tự quyết định việc của bạn chỉ cần đưa máy lên và chụp, rất đơn giản.
Điện thoại iPhone 11 64GB | Ảnh chụp chế độ góc siêu rộng
Ảnh chụp chế độ góc siêu rộng
Năm nay Apple cũng đã nâng cấp độ phân giải camera trước nên 12 MP thay vì 7 MP như thế hệ trước đó.
Camera trước cũng có một tính năng thông minh, khi bạn xoay ngang điện thoại nó sẽ tự kích hoạt chế độ selfie góc rộng để bạn có thể chụp với nhiều người hơn.
Điện thoại iPhone 11 64GB | Ảnh selfie bằng camera trước
Ngoài ra Apple cũng giới thiệu tính năng quay video slow motion dành cho camera trước, điều mà Apple chưa từng trang bị cho những chiếc iPhone trước đây.
Hiệu năng mạnh mẽ hàng đầu thế giới
Mỗi lần ra iPhone mới là mỗi lần Apple mang đến cho người dùng một trải nghiệm về hiệu năng "chưa từng có".
Điện thoại iPhone 11 64GB | Trải nghiệm chơi game trên iPhone 11
Trên iPhone 11 mới Apple nâng cấp con chip của mình lên thế hệ Apple A13 Bionic rất mạnh mẽ.
Điện thoại iPhone 11 64GB | Điểm hiệu năng Antutu Benchmark
Chiếc iPhone này cũng được nâng cấp dung lượng RAM 4 GB thay vì 3 GB như thế hệ trước đó.
Điện thoại iPhone 11 64GB | Trải nghiệm thao tác
Ở mức cấu hình trên giúp điện thoại chơi game tốt với các tựa game phổ biến hiện nay một cách mượt mà, ổn định. Mọi thao tác trên iPhone mới cũng cho tốc độ phản hồi nhanh mà bạn gần như sẽ không cảm nhận được sự giật lag cho dù có sử dụng trong một thời gian dài.
Điện thoại iPhone 11 64GB | Trải nghiệm chơi game
Xem thêm: Thử nghiệm độ bền iPhone 11: Cào xước, nung nóng và bẻ cong
Phiên bản iOS 15 (12/2021) đi kèm với chiếc iPhone này cũng được trang bị nhiều tính năng hơn giúp bạn sử dụng chiếc iPhone hiệu quả hơn.
Điện thoại iPhone 11 64GB | Thiết kế thời trang
Face ID trên iPhone 11 cũng được cải tiến để có thể nhận diện ở nhiều góc độ hơn và tốc độ phản hồi nhanh hơn.
Những thay đổi về thiết kế theo hướng tích cực
Chúng ta sẽ có một mặt lưng hoàn thiện dưới dạng kính và Apple nói rằng họ đã sử dụng loại kính bền nhất từ trước tới nay cho chiếc iPhone này.
Điện thoại iPhone 11 64GB | Thiết kế cụm camera kép ở mặt sau
Camera kép trên iPhone mới cũng được thiết kế lại và tin vui là nó sẽ bớt lồi hơn so với trên iPhone Xr trước đây.
Điện thoại iPhone 11 64GB | Thiết kế thời trang
Điểm nhấn về cụm camera to bản ở mặt sau sẽ giúp người khác dễ dàng nhận biết bạn đang sử dụng một chiếc iPhone 11 trên tay.
Điện thoại iPhone 11 64GB | Khay sim
Logo quả táo truyền thống của Apple nay đã được di chuyển về phần chính giữa của mặt lớn thay vì đặt lệch về phía cạnh trên như những đời iPhone trước đó.
Điện thoại iPhone 11 64GB | Khả năng chóng nước chuẩn IP68
Apple cho biết họ đã hoàn thiện trên iPhone mới để nó cho khả năng chống nước tốt hơn và người dùng có thể yên tâm về điều đó. 
Thời lượng pin tốt nhất từ trước tới nay
Khi nói đến thời lượng pin iPhone 11, hẳn nhiều người đã ước ao rằng máy sẽ có viên pin tốt giống như iPhone Xr (có thời lượng pin tốt nhất so với bất kỳ iPhone hiện đại nào).
Điện thoại iPhone 11 64GB | Thời lượng pin
Tuy nhiên bạn sẽ còn có một chiếc máy thậm chí còn tốt hơn nữa.
Điện thoại iPhone 11 64GB | Thiết kế hiện đại
Theo Apple thì chiếc iPhone mới sẽ có thời lượng pin trâu hơn 1 giờ so với chiếc iPhone Xr.
Điện thoại iPhone 11 64GB | Giao diện Dark Mode
Như vậy với iPhone mới bạn hoàn toàn có thể sử dụng máy lên tới 2 ngày mà không cần lo lắng việc thiết bị sẽ hết pin giữa chừng.
Điện thoại iPhone 11 64GB | Thời lượng pin
Tất nhiên máy cũng sẽ hỗ trợ công nghệ sạc nhanh nhưng bạn phải mua thêm củ sạc bên ngoài để có thể sử dụng tính năng này.
Điện thoại iPhone 11 64GB | Thời lượng sử dụng dài
Với chừng đó tính năng, chừng đó cải tiến thì chiếc iPhone 11 này tự tin sẽ là một đối thủ đáng gờm với những chiếc flagship đến từ các hãng Android đang có mặt trên thị trường.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2025, N'Điện thoại iPhone 13 Pro Max 128GB', 50, 25990000, 25, N'iphone-13-pro-max-xanh-la-thumb-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.
Thiết kế đẳng cấp hàng đầu
iPhone mới kế thừa thiết kế đặc trưng từ iPhone 12 Pro Max khi sở hữu khung viền vuông vức, mặt lưng kính cùng màn hình tai thỏ tràn viền nằm ở phía trước.
Thiết kế vuông vức đặc trưng - iPhone 13 Pro Max 128GB
Với iPhone 13 Pro Max phần tai thỏ đã được thu gọn lại 20% so với thế hệ trước, không chỉ giải phóng nhiều không gian hiển thị hơn mà còn giúp mặt trước chiếc điện thoại trở nên hấp dẫn hơn mà vẫn đảm bảo được hoạt động của các cảm biến.
Màn hình tai thỏ được tinh giản - iPhone 13 Pro Max 128GB
Điểm thay đổi dễ dàng nhận biết trên iPhone 13 Pro Max chính là kích thước của cảm biến camera sau được làm to hơn và để tăng độ nhận diện cho sản phẩm mới thì Apple cũng đã bổ sung một tùy chọn màu sắc Sierra Blue (màu xanh dương nhạt hơn so với Pacific Blue của iPhone 12 Pro Max).
Sierra Blue trẻ trung, thanh lịch - iPhone 13 Pro Max 128GB
Máy vẫn tiếp tục sử dụng khung viền thép cao cấp cho khả năng chống trầy xước và va đập một cách vượt trội, kết hợp với khả năng kháng bụi, nước chuẩn IP68.
Viền thép cao cấp - iPhone 13 Pro Max 128GB
Màn hình giải trí siêu mượt cùng tần số quét 120 Hz
iPhone 13 Pro Max được trang bị màn hình kích thước 6.7 inch cùng độ phân giải 1284 x 2778 Pixels, sử dụng tấm nền OLED cùng công nghệ Super Retina XDR cho khả năng tiết kiệm năng lượng vượt trội nhưng vẫn đảm bảo hiển thị sắc nét sống động chân thực.
Màn hình kích thước 6.7 inch - iPhone 13 Pro Max 128GB
iPhone Pro Max năm nay đã được nâng cấp lên tần số quét 120 Hz, mọi thao tác chuyển cảnh khi lướt ngón tay trên màn hình trở nên mượt mà hơn đồng thời hiệu ứng thị giác khi chúng ta chơi game hoặc xem video cũng cực kỳ mãn nhãn.
Tốc độ làm tươi màn hình - iPhone 13 Pro Max 128GB
Cùng công nghệ ProMotion thông minh có thể thay đổi tần số quét từ 10 đến 120 lần mỗi giây tùy thuộc vào ứng dụng, thao tác bạn đang sử dụng, nhằm tối ưu thời lượng sử dụng pin và trải nghiệm của bạn.
Công nghệ ProMotion thông minh - iPhone 13 Pro Max 128GB
Nếu bạn dùng iPhone 13 Pro Max để chơi game, tần số quét 120 Hz kết hợp hiệu suất đồ họa tuyệt vời của GPU sẽ khiến máy trở nên vô cùng hoàn hảo khi trải nghiệm.
Mang đến trải nghiệm mượt mà - iPhone 13 Pro Max 128GB
Ngoài ra máy cũng hỗ trợ công nghệ True Tone, dải màu rộng chuẩn điện ảnh P3 sẽ cho mọi trải nghiệm của bạn trên máy trở nên ấn tượng hơn bao giờ hết.
Dải màu chuẩn điện ảnh P3 - iPhone 13 Pro Max 128GB
Cụm camera được nâng cấp toàn diện
iPhone 13 Pro Max vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera telephoto, camera góc siêu rộng và camera chính góc rộng với khẩu độ f/1.5 siêu lớn.
Cụm camera chuyên nghiệp - iPhone 13 Pro Max 128GB
Camera góc siêu rộng cũng được nâng cấp với khẩu độ f/1.8, cảm biến nhanh hơn, mang tới những bức ảnh góc siêu rộng tự nhiên và chân thực và còn tăng cường có khả năng lấy nét ở khoảng cách chỉ 2 cm, mang đến tính năng chụp ảnh quay phim macro đầy thú vị.
Lấy nét ở khoảng cách 2cm - iPhone 13 Pro Max 128GB
Camera tele trên iPhone 13 Pro Max có thể zoom quang học 3x, phóng to hình ảnh và video gấp 3 lần nhưng vẫn giữ nguyên chất lượng, hỗ trợ chụp ảnh chân dung xóa phông, tích hợp sẵn rất nhiều bộ lọc màu tự nhiên giúp có được bức ảnh đúng như ý muốn.
Khả năng zoom quang học - iPhone 13 Pro Max 128GB
Bên cạnh đó, cảm biến LiDAR vẫn sẽ hiện diện trên iPhone 13 Pro Max nhằm mang đến trải nghiệm thực tế tăng cường (AR) tốt nhất cho tất cả người dùng cũng như hỗ trợ cho cụm camera lấy nét trong môi trường ánh sáng yếu.
Lấy nét trong môi trường anh sáng yếu - iPhone 13 Pro Max 128GB
Apple còn tăng cường khả năng nhiếp ảnh trên iPhone 13 Pro Max với chế độ quay phim chuẩn điện ảnh Cinematic giúp người dùng có thể dễ dàng lấy nét vào chủ thể cả trong và sau khi quay, đồng thời làm mờ hậu cảnh và những nhân vật khác trong khung hình.
Chế độ quay Cinematic - iPhone 13 Pro Max 128GB
Đây cũng là chiếc điện thoại thông minh đầu tiên cung cấp quy trình làm việc chuyên nghiệp "end-to-end" cho phép bạn ghi và chỉnh sửa video ở định dạng nén ProRes hoặc Dolby Vision với nhiều thiết lập chuyên sâu tạo giúp rút ngắn đáng kể quá trình hậu kỳ tạo nên những thước phim chất lượng đáng kinh ngạc ngay trên chính chiếc điện thoại của mình.
Khả năng quay video chuyên nghiệp - iPhone 13 Pro Max 128GB
Hiệu năng đầy hứa hẹn với Apple A15 Bionic 
iPhone 13 Pro Max sẽ được trang bị bộ vi xử lý Apple A15 Bionic mới nhất của hãng, được sản xuất trên tiến trình 5 nm, đảm bảo mang lại hiệu năng vận hành ấn tượng mà vẫn tiết kiệm điện tốt nhất cùng khả năng hỗ trợ mạng 5G tốc độ siêu cao.
Theo Apple công bố, A15 Bionic là chipset nhanh nhất trong thế giới smartphone (9/2021), có tốc độ nhanh hơn 50% so với các chip khác trên thị trường, có thể thực hiện 15.8 nghìn tỷ phép tính mỗi giây, giúp hiệu năng CPU nhanh hơn bao giờ hết.
Vi xử lý Apple A15 Bionic - iPhone 13 Pro Max 128GB
Máy sở hữu bộ nhớ trong 128 GB, vừa đủ với nhu cầu sử dụng của một người dùng cơ bản, không có nhu cầu quay video quá nhiều, ngoài ra năm nay cũng có thêm phiên bản bộ nhớ trong lên đến 1TB, bạn có thể cân nhắc nếu có nhu cầu lưu trữ cao.
Dung lượng bộ nhớ - iPhone 13 Pro Max 128GB
Ngoài ra, máy còn được tích hợp công nghệ Wi-Fi 6, chuẩn kết nối không dây mới với việc trang bị nhiều băng tần 5G, tương thích với nhiều nhà mạng ở các quốc gia khác nhau, iPhone 13 Pro Max luôn cho tốc độ mạng tối đa, cho trải nghiệm xem phim 4K mượt mà, tải tệp tin trong chớp mắt, chơi game online không độ trễ ở bất cứ đâu.
Kết nối nhanh chóng - iPhone 13 Pro Max 128GB
Bước nhảy vọt về thời lượng pin
iPhone Pro Max đánh dấu bước ngoặt mới trong thời lượng pin sử dụng. Với viên pin dung lượng pin lớn kết hợp cùng màn hình mới và bộ vi xử lý Apple A15 Bionic tiết kiệm điện, giúp iPhone 13 Pro Max trở thành chiếc iPhone có thời lượng pin tốt nhất từ trước đến nay, dài hơn 2.5 giờ so với người tiền nhiệm. 
Chip A15 giúp tối ưu hóa năng lượng - iPhone 13 Pro Max 128GB
Đáng tiếc là dung lượng pin của các mẫu iPhone mới được cải thiện nhưng tốc độ sạc nhanh của chúng vẫn chỉ dừng ở mức 20 W qua kết nối có dây và sạc qua MagSafe ở mức tối đa 15 W hoặc có thể qua bộ sạc không dây dựa trên Qi với công suất 7.5 W.
Sạc MagSafe - iPhone 13 Pro Max 128GB
Apple đã không ngừng cải tiến đem đến cho người dùng sản phẩm tốt nhất, iPhone 13 Pro Max 128GB vẫn giữ được các điểm nổi bật của người tiền nhiệm, nổi bật với cải tiến về cấu hình, thời lượng pin cũng như camera và nhiều điều còn chờ bạn khám phá.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2026, N'Điện thoại iPhone 14 Pro Max 128GB', 10, 33990000, 10, N'iphone-14-pro-max-bac-thumb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng. Từ ngày 14/10/2022 người dùng đã có thể mua sắm các sản phẩm iPhone 14 series với đầy đủ phiên bản tại Thế Giới Di Động.
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
Phiên bản màu tím - iPhone 14 Pro Max
Vàng - Gold 
Đối với phiên bản màu vàng này ta thấy được một diện mạo đẳng cấp và cực kỳ sang trọng khi đi kèm với một bộ khung bóng bẩy, tất cả điều này làm cho người dùng cảm giác như máy được hoàn thiện với bộ khung từ vàng nguyên chất, mang lại một cái nhìn thời thượng hơn mỗi khi người dùng cầm nắm điện thoại trên tay.
Phiên bản màu vàng - iPhone 14 Pro Max
Bạc - Silver
Màu bạc có lẽ là một phiên bản khá được ưa chuộng trên thị trường điện thoại iPhone trong khoảng thời gian gần đây, bởi tone màu trẻ trung cùng phong cách tối giản nên phiên bản này rất dễ phối màu với các món phụ kiện như ốp lưng hay dây đeo, cho dù món phụ kiện của bạn là màu nào đi chăng nữa thì kết quả sau khi trang bị vẫn sẽ cực kỳ ưng ý.
Phiên bản màu bạc - iPhone 14 Pro Max
Đen - Space Black
Từ trước cho đến này thì các dòng điện thoại iPhone luôn có sự xuất hiện của phiên bản màu đen bởi độ hút khách của nó phải nói là cực kỳ đông đảo, với các tín đồ thời trang theo những tone màu tối hay những ai bị mê hoặc bởi sự huyền bí mà màu đen mang lại thì đây chắc hẳn là phiên bản mà người dùng khó lòng bỏ qua trong dòng điện thoại iPhone 14 Pro Max.
Phiên bản màu đen - iPhone 14 Pro Max
Màn hình chất lượng cho những trải nghiệm xem tuyệt vời
Máy sẽ được sử dụng công nghệ màn hình OLED với kích thước lớn lên đến 6.7 inch, mang lại không gian rộng rãi để bạn thao tác chơi game dễ dàng hơn hay thưởng thức nội dung một cách to rõ.
Màn hình chất lượng - iPhone 14 Pro Max 128GB
Vì được trang bị màn hình có khả năng tái hiện màu sắc với độ chính xác cao nên đây chắc hẳn sẽ là một thiết bị rất phù hợp cho các bạn đang làm những công việc về đồ họa - thiết kế và in ấn sản phẩm trên điện thoại.
Thiết kế hình notch mới - iPhone 14 Pro Max 128GB
Phiên bản lần này còn được hỗ trợ thêm tính năng màn hình AOD (Always On Display) để người dùng có thể xem trực tiếp thông báo hay ngày, giờ mà không cần phải kích hoạt màn hình thiết bị.
iPhone 14 Pro Max sở hữu cụm camera chất lượng
Camera sau 48 MP bắt trọn mọi khung hình cho hình ảnh sắc nét
Về phần chụp ảnh thì sản phẩm lần này sẽ được trang bị 3 camera sau với camera chính có độ phân giải 48 MP giúp bạn bắt trọn mọi khung hình được sắc nét, bên cạnh sẽ là camera góc siêu rộng 12 MP và cảm biến cuối cùng có độ phân giải 12 MP. Đi kèm với đó sẽ là cảm biến quad-pixel cao cấp giúp nâng độ phân giải trên từng bức hình bạn chụp.
Trang bị 3 camera - iPhone 14 Pro Max 128GB
Không chỉ tăng độ phân giải camera mà lần này Apple còn nâng cao thuật toán xử lý ảnh giúp cho iPhone có thể cho ra những bức hình chụp đêm có chất lượng tốt hơn, giảm thiểu tình trạng nhiễu hạt hay lóe sáng so với những thế hệ trước đây.
Chụp ảnh thiếu sáng tốt - iPhone 14 Pro Max 128GB
Tích hợp khả năng quay video đạt chuẩn lên tới 4K HDR ở tốc độ 24, 30 khung hình/giây giúp cho người dùng có thể sở hữu được nhiều thước phim sắc nét và cực kỳ chất lượng, phù hợp với những bạn làm những công việc quay - dựng phim trên các thiết bị di động.
Camera selfie góc rộng bắt trọn mọi khung hình
Bên cạnh đó, mặt trước được tích hợp Camera TrueDepth 12 MP có hỗ trợ Face ID, điều này để đảm bảo mọi thông tin của bạn có thể an toàn trước những kẻ xâm nhập. 
iPhone 14 Pro Max với chip xử lý A16 Bionic mang lại sức mạnh đáng kinh ngạc
Được trang bị bộ vi xử lý A16 Bionic sản xuất trên quy trình tiên tiến giúp cải thiện hiệu suất và giảm điện năng tiêu thụ so với thế hệ trước đó, đáp ứng hoàn hảo trong công việc cũng như trong giải trí của người dùng tốt hơn.
Hiệu năng mạnh mẽ - iPhone 14 Pro Max 128GB
Không chỉ đáp ứng tốt khả năng chơi game mà đây còn là thiết bị có thể giúp bạn xử lý nhiều công việc nhanh chóng, đặc biệt là những tác vụ xử lý và xuất video hình ảnh. Là một chiếc điện thoại RAM 6 GB nên người dùng hoàn toàn có thể an tâm hơn trên các tác vụ đa nhiệm khi mở cùng lúc nhiều ứng dụng.
Hiệu năng mạnh mẽ - iPhone 14 Pro Max 128GB
iPhone 14 Pro Max chạy hệ điều hành mới nhất iOS 16
Chiếc điện thoại này sẽ được hỗ trợ hệ điều hành iOS 16 kể từ khi kích hoạt máy, được bổ sung hàng loạt các tính năng mới mẻ để mang đến cho người dùng những phút giây sử dụng vô cùng thú vị.
Tích hợp hệ điều hành iOS 16 - iPhone 14 Pro Max
Những tính năng nổi bật và cực kỳ hữu ích trên iOS 16 có thể kể đến như: Tùy chỉnh màn hình khóa, thêm widget mới cho màn hình khóa, Live Text, tách nền ảnh,...
Pin đáp ứng đủ cho cả ngày dài
Bên trong điện thoại iPhone sẽ được tích hợp viên pin có dung lượng lớn nên người dùng có thể an tâm hơn trong việc sử dụng máy phục vụ các tác vụ cơ bản cả ngày. Đi kèm với đó sẽ là công nghệ sạc nhanh giúp bạn có thể tối ưu được kha khá thời gian chờ đợi thiết bị nạp đầy.
Hãng công bố iPhone 14 Pro Max có khả năng duy trì việc xem video liên tục trong 29 giờ, quả thực là con số rất ấn tượng để đáp ứng tốt các nhu cầu giải trí cho dành cho bạn.
Sử dụng dài lâu - iPhone 14 Pro Max 128GB
Đáp ứng mọi nhu cầu lưu trữ với nhiều phiên bản bộ nhớ
Bên cạnh phiên bản 128 GB thông thường thì lần ra mắt này Apple còn đưa đến tay người dùng thêm 3 sự lựa chọn như: 256 GB, 512 GB và 1 TB, điều này nhằm đáp ứng các nhu nhu cầu lưu trữ thông tin với số lượng lớn trên iPhone 14 để đáp ứng công việc của bạn tốt hơn. 
Đa dạng tùy chọn bộ nhớ - iPhone 14 Pro Max 128GB
Vì sao bạn nên chọn mua iPhone 14 Pro Max?
Nhờ được trang bị một con chip có hiệu năng mạnh mẽ và mới nhất đến từ Apple nên iPhone 14 Pro Max có thể sẽ đem lại cho người dùng sự mượt mà trên mọi tác vụ sử dụng, đi kèm đó sẽ là cụm camera có khả năng ghi hình siêu sắc nét và thu lại những thước phim mượt mà ổn định.
Sở hữu bên trong nhiều công nghệ hàng đầu - iPhone 14 Pro Max
So sánh thông số kỹ thuật iPhone 14 Pro Max với iPhone 13 Pro Max
Dưới đây sẽ là bảng tóm gọn thông số kỹ thuật giữa hai phiên bản iPhone 14 Pro Max và iPhone 13 Pro Max để người dùng có thể đối chiếu một cách trực quan.
Thuộc tính	iPhone 14 Pro Max	iPhone 13 Pro Max
Màn hình 	OLED	OLED
Hiệu năng	Apple A16 Bionic 6 nhân	Apple A15 Bionic 6 nhân
Camera sau	Camera chính 48 MP & Phụ 12 MP, 12 MP	3 camera 12 MP
Camera trước	Camera TrueDepth 12 MP	Camera TrueDepth 12 MP
Bảo mật	Face ID	Face ID
Cổng kết nối	Lightning	Lightning
Đây chắc hẳn là một chiếc điện thoại rất phù hợp cho những bạn đang làm các công việc chuyên về sáng tạo nội dung chơi game hay nhiếp ảnh. Ngoài ra khi cầm trên tay chiếc iPhone 14 Pro Max thì người dùng cũng được toát lên một vẻ ngoài cực kỳ sang trọng và đẳng cấp khi sở hữu cho mình một sản phẩm mới nhất đến từ nhà Apple.
Với một con chip có hiệu năng đỉnh cao được trang bị cùng khả năng quay phim chụp ảnh sắc nét trên iPhone 14 Pro Max, giúp cho đây hứa hẹn sẽ trở thành chiếc smartphone gây được sự chú ý và săn đón nhất thị trường di động trong năm 2022.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2027, N'Điện thoại iPhone 14 Pro 128GB', 10, 29590000, 10, N'iphone-14-pro-bac-thumb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Tại sự kiện ra mắt sản phẩm thường niên diễn ra vào tháng 9/2022, Apple đã trình làng iPhone 14 Pro với những cải tiến về thiết kế màn hình, hiệu năng, sẵn sàng cùng bạn chinh phục mọi thử thách. Giờ đây người dùng đã có thể mua sắm những sản phẩm iPhone 14 từ ngày 14/10/2022 tại Thế Giới Di Động với đầy đủ các phiên bản.
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
Một điểm mới trong lần ra mắt này là về phiên bản màu sắc Deep Purple chưa từng có trên các dòng iPhone trước đây. Vì thế đây chắc hẳn sẽ là phiên bản hot nhất trên iPhone 14 Pro nhờ đặc điểm nhận diện cực cao. 
Thanh lịch sang trọng - iPhone 14 Pro 128GB
iPhone 14 Pro sở hữu hiệu năng đánh bật mọi đối thủ
Trang bị bộ vi xử lý A16 Bionic mới nhất của Apple, máy trang bị 6 lõi CPU cùng 5 lõi GPU tiên tiến bậc nhất ở thời điểm hiện tại, không những cho hiệu năng mạnh mẽ cân mọi tác vụ cũng như ứng dụng nặng mà còn tối ưu tiết kiệm điện hơn.
Hiệu năng mạnh mẽ - iPhone 14 Pro 128GB
Apple cho biết A16 Bionic là bộ vi xử lý di động nhanh và mạnh nhất trong thế giới điện thoại (9/2022), có thể thực hiện hàng tỷ phép tính mỗi giây, giúp cải thiện hiệu năng tính toán của cả CPU và GPU.
Hiệu năng mạnh mẽ - iPhone 14 Pro 128GB
iPhone 14 Pro có thiết kế Dynamic Island hoàn toàn mới 
Màn hình nhỏ gọn với kích thước 6.1 inch tràn viền cả bốn cạnh, không gian hiển thị đủ lớn để đọc báo, xem phim, giải trí,... tấm nền OLED tiên tiến cùng độ phân giải 2556 x 1179 Pixels cho màu sắc sống động, các chi tiết thể hiện rõ nét nhất. 
Tuy nhiên với nhu cầu sử dụng với màn hình lớn hơn thì người dùng có thể tham khảo thêm phiên bản iPhone 14 Pro Max.
Màn hình kích thước lớn - iPhone 14 Pro 128GB
Tần số quét 120 Hz tái hiện hình ảnh mượt mà trong mọi pha chuyển động nhanh, được thiết kế riêng và tối ưu hóa để đảm bảo các thao tác chạm, vuốt diễn ra mượt mà. Để cụm hình notch không bị nhàm chán thì hãng đã cho ra mắt tính năng Dynamic Island với khả năng tùy chỉnh hiệu ứng thông báo đầy thú vị.
Lần này máy sẽ được trang bị tính năng AOD (Always On Display) để giúp người dùng có thể theo dõi thông báo hay giờ một cách thuận tiện mà không cần phải kích hoạt thiết bị.
Camera nâng cấp toàn diện
iPhone 14 Pro được nâng cấp toàn diện về hệ thống camera với cảm biến chính độ phân giải 48 MP, kết hợp cùng thuật toán thông minh và cảm biến quad-pixel tiên tiến để cho phép người dùng quay video 4K HDR ở tốc độ 24 - 30 khung hình/giây siêu sắc nét.
Được thiết kế với ống kính có kích thước lớn, vì thế mà máy có khả năng thu sáng tốt hơn để nâng cao chất lượng trên những bức ảnh chụp đêm hay thước phim quay trong điều kiện thiếu sáng.
Camera sau chất lượng - iPhone 14 Pro 128GB
Camera góc siêu rộng độ phân giải 12 MP được tối ưu để hoạt động nhanh hơn và độ bao quát rộng hơn, mang đến những bức ảnh góc siêu rộng tự nhiên và chân thực.
Camera góc rộng - iPhone 14 Pro 128GB
Mặt trước sẽ được trang bị Camera TrueDepth 12 MP có hỗ trợ Face ID giúp thiết bị có khả năng nhận diện chính xác chủ sở hữu, giúp bảo mật thông tin trên thiết bị của bạn được an toàn hơn.
Bước nhảy vọt về thời lượng pin
Nhờ được trang bị bộ vi xử lý A16 Bionic với những tối ưu về điện năng giúp chiếc iPhone này có thời lượng sử dụng lâu dài hơn. Theo thông tin từ hãng cho biết thì máy có khả năng duy trì việc sử dụng trong 23 giờ xem video liên tục.
Sử dụng dài lâu - iPhone 14 Pro 128GB
Để người dùng có thêm cái nhìn trực quan nhằm đối chiếu với iPhone 13 Pro trước đây dễ dàng hơn thì dưới đây sẽ là bảng tóm gọn và so sánh thông số kỹ thuật giữa hai phiên bản.
Thuộc tính	iPhone 13 Pro	iPhone 14 Pro
Màn hình 	OLED	OLED
Hiệu năng	Apple A15 Bionic 6 nhân	Apple A16 Bionic 6 nhân
Camera sau	3 camera 12 MP	Camera chính 48 MP & Phụ 12 MP, 12 MP
Camera trước	Camera TrueDepth 12 MP	Camera TrueDepth 12 MP
Bảo mật	Face ID	Face ID
Cổng kết nối	Lightning	Lightning
Nhiều phiên bản lựa chọn - iPhone 14 Pro 128GB
Apple đã luôn cải tiến sản phẩm mới để mang đến cho người dùng những chiếc điện thoại hoàn hảo nhất qua từng năm, iPhone 14 Pro không chỉ có thiết kế hiện đại, đẹp mắt mà còn sở hữu hiệu năng vượt trội sẵn sàng theo bạn trong mọi chuyến đi.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2028, N'Điện thoại iPhone 13 Pro 128GB', 10, 25990000, 15, N'iphone-13-pro-gold-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng. 
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
Sử dụng tấm nền OLED có số điểm ảnh lên đến 1170 x 2532 Pixels cho hình ảnh và màu sắc hiển thị sâu, sắc sáng tươi tắn, khung hình sinh động như thực. 
Độ sáng đạt 1200 nits - iPhone 13 Pro 128GB
Quay chụp đỉnh cao với camera Pro
iPhone 13 Pro có bộ camera 3 ống kính 12 MP xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy gồm camera tele, camera góc siêu rộng (Ultra Wide) khẩu độ f/1.8, góc nhìn đến 120 độ và camera chính góc rộng (Wide) với khẩu độ f/1.5.
Bộ ba ống kính chuyên nghiệp - iPhone 13 Pro 128GB
Camera Ultra Wide được làm mới có thể lấy nét tự động trong khoảng cách 2 cm, giúp phóng to hình ảnh của giọt sương, lông chim, cát vàng,... tạo nên những tuyệt tác nghệ thuật chỉ bằng một thao tác chụp đơn giản. Camera này cũng cho khả năng quay cảnh chuyển động tua nhanh thời gian hoặc chuyển động chậm linh hoạt để bạn làm video giải trí cực đẹp. 
Camera Ultra Wide lấy nét cực ấn tượng - iPhone 13 Pro 128GB
Apple gọi iPhone 13 Pro là thiết bị được tạo ra cho ánh sáng yếu, bởi hệ thống camera được hỗ trợ chế độ ban đêm Night Mode, trang bị máy quét LiDAR (khả dụng cho chế độ chụp chân dung ban đêm), camera Wide nâng cao độ sáng đến 2.2 lần, camera Ultra Wide tăng 92% độ sáng cho phép quay chụp lại các hình ảnh, thước phim ban đêm cực kỳ chi tiết, sắc nét. 
Chế độ đêm Night Mode - iPhone 13 Pro 128GB
Hệ thống camera zoom quang học 6x, riêng camera telephoto có thể zoom quang 3x rất tuyệt khi chụp ảnh và quay video ở xa. Kết hợp nhiều tùy chọn hiệu ứng bokeh và các hiệu ứng ánh sáng chất lượng để bạn tạo nên những bức ảnh lung linh như nhiếp ảnh gia chuyên nghiệp. 
Ảnh chụp trên camera - iPhone 13 Pro 128GB
Một chế độ nổi bật khác hỗ trợ trên camera Pro này là chế độ điện ảnh Cinematic cho phép quay với độ sâu trường ảnh nông, tự động thêm các chuyển đổi lấy nét giữa các đối tượng, đoán trước chủ thể mới vào khung hình và đưa họ vào tiêu điểm, đổi tiêu điểm, chỉnh hiệu ứng bokeh dễ dàng kể cả sau khi quay.
Chế độ điện ảnh độc đáo - iPhone 13 Pro 128GB
Có chế độ chụp phong cảnh Photographic Styles dễ dàng điều chỉnh độ ấm, tông màu phù hợp với ý tưởng chụp của bạn, tuy vậy khác với các bộ lọc thông thường, với chế độ này các chi tiết như bầu trời, màu da sẽ được giữ lại độ chân thật, tự nhiên nhất có thể. 
Chế độ chụp phong cảnh Photographic Styles - iPhone 13 Pro 128GB
Ở mặt trước điện thoại có camera TrueDepth độ phân giải 12 MP cho bạn tự selfie tuyệt đẹp, đi kèm nhiều chế độ chụp tiện ích như chế độ chân dung tích hợp hiệu ứng bokeh nâng cao và kiểm soát độ sâu mạnh mẽ, thêm Animoji và Memoji, chế độ Night Mode, Burst, Cinematic,...
Camera TrueDepth - iPhone 13 Pro 128GB
Hơn nữa, camera TrueDepth và chip A15 Bionic hỗ trợ Face ID để xác minh khuôn mặt, giúp mở máy nhanh và an toàn hơn. 
Cả camera trước và sau đều quay được video HDR hỗ trợ Dolby Vision đạt chuẩn chất lượng lên đến 4K với tốc độ khung hình 60 fps, quay video ProRes lên đến 1080p ở tốc độ 30 fps, cùng nhiều chế độ quay khác giúp bạn có nhiều sự thay đổi khác nhau khi quay.
Hỗ trợ quay video đạt chất lượng 4K - iPhone 13 Pro 128GB
Hiệu năng đột phá với Apple A15 Bionic
iPhone 13 Pro được trang bị bộ vi xử lý Apple A15 Bionic, sản xuất trên tiến trình 5 nm cải tiến, theo Apple công bố thì đây là chipset nhanh nhất trong thế giới smartphone tại thời điểm 09/2021.
Vi xử lý Apple A15 Bionic - iPhone 13 Pro 128GB
Tích hợp chip đồ họa GPU 5 lõi hiệu suất tăng lên 50%, CPU đáp ứng đa dạng tác vụ, nâng cao tuổi thọ pin. Đặc biệt, công nghệ trí tuệ nhân tạo Neural Engine tăng tốc các tác vụ máy học, thực hiện được đến 15.8 nghìn tỷ hoạt động mỗi giây, cho quá trình sử dụng thiết bị mượt mà, ổn định.
Đồ họa mượt mà - iPhone 13 Pro 128GB
Máy sở hữu con RAM 6 GB, bộ nhớ trong 128 GB, vừa đủ với nhu cầu sử dụng của một người dùng cơ bản không có nhu cầu quay video quá nhiều, máy cũng có thêm phiên bản điện thoại iPhone 13 Pro 1 TB, bạn có thể cân nhắc nếu có nhu cầu lưu trữ cao.
Dung lượng bộ nhớ - iPhone 13 Pro 128GB
Ngoài ra, máy còn được hỗ trợ mạng di động 5G chất lượng cao, có khả năng phản hồi tức thì, việc tải, xem phim 4K,... sẽ vô cùng nhanh chóng, đưa trải nghiệm internet của người dùng lên tầm cao mới.
Hỗ trợ kết nối 5G - iPhone 13 Pro 128GB
Thiết bị được cài đặt nền tảng iOS 15 cho bạn vừa giao tiếp qua FaceTime vừa chia sẻ bài hát, tài liệu với mọi người tiện lợi, dễ dàng tương tác với văn bản trong hình ảnh để gửi email, nhận chỉ đường, thực hiện cuộc gọi,... 
Nền tảng IOS 15 - iPhone 13 Pro 128GB
Nâng cấp thời lượng pin
iPhone 13 Pro sẽ có thời lượng pin sử dụng tốt hơn 1.5 tiếng khi so với iPhone 12 Pro, máy có thể phát video liên tục trong 22 tiếng, nghe nhạc trong 75 tiếng và hỗ trợ sạc nhanh 20 W qua cáp.
Tối ưu hóa năng lượng - iPhone 13 Pro 128GB
Lưu ý: Củ sạc 20 W sẽ không đi kèm trong hộp khi mua máy.
Ngoài ra còn hỗ trợ sạc không dây chuẩn Qi 7.5 W, sạc không dây MagSafe 15 W bạn có thể lựa chọn phương pháp sạc phù hợp và tiện lợi nhất trong quá trình sử dụng.
Sạc không dây với MagSafe - iPhone 13 Pro 128GB
Dung lượng pin trên iPhone luôn thấp hơn khi so với các dòng máy Android nhưng việc trang bị chipset mới cùng sự tối ưu hoá của hệ điều hành sẽ đảm bảo thời lượng sử dụng không hề thua kém trên sản phẩm Android, thậm chí còn có thể vượt trội hơn. 
iPhone 13 Pro 128GB với thiết kế cứng cáp, sang trọng cùng khả năng nhiếp ảnh ấn tượng, sẽ là một sản phẩm phục vụ tốt các nhu cầu của bạn cũng như là một món đồ thời trang hiện đại.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2029, N'Điện thoại iPhone 12 64GB', 10, 16490000, 20, N'iphone-12-violet-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.
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
iPhone 12 được trang bị hệ thống camera kép bao gồm camera góc rộng và camera siêu rộng có cùng độ phân giải là 12 MP, chế độ ban đêm (Night Mode) trên bộ đôi camera này cũng đã được nâng cấp về phần cứng lẫn thuật toán xử lý, khi chụp những bức ảnh thiếu sáng bạn sẽ nhận được kết quả ấn tượng với màu sắc, độ chi tiết rõ nét đáng kinh ngạc.
Cụm camera sau| iPhone 12
Bạn có thể khám phá thêm những tính năng của camera trên iPhone 12 như chế độ smart HDR 3 giúp cân bằng yếu tố ánh sáng trong ảnh, làm nổi bật chi tiết đối tượng và cây cối trong khi vẫn giữ được màu sắc phong phú của bầu trời ngay cả vào buổi trưa nắng gắt.
Chụp ảnh với tính năng smart HDR 3 sắc nét, chất lượng | iPhone 12
Chế độ chụp chân dung đã tốt nay còn tốt hơn trong việc làm mờ hậu cảnh một cách nghệ thuật để dồn hết sự tập trung vào đối tượng mà bạn muốn chụp.
Nổi bật chủ thể với tính năng chụp chân dung độc đáo | iPhone 12
Bạn sẽ dễ dàng quay video 4K HDR với chuẩn điện ảnh Dolby Vision và chỉnh sửa ngay trên chiếc điện thoại của mình, bạn có thể đưa video lên TV của bạn để thưởng thức thước phim sắc nét chất lượng cao.
Quay video chất lượng ngay cả trong điều kiện ánh sáng yếu | iPhone 12
Sự kết hợp của 2 cảm biến chất lượng này đã tạo nên một hệ thống camera chuyên nghiệp không khác gì những chiếc máy ảnh thực thụ, dễ dàng đem lại những bức hình sắc nét tuyệt đối, độ chi tiết cao và đa dạng chế độ chụp cho người dùng linh hoạt sử dụng.
Ghi dấu ấn về mặt thiết kế
Về ngoại hình iPhone 12 có thiết kế hoài niệm với phần cạnh được làm vuông vức tương tự trên mẫu iPhone 4 thay vì bo cong như iPhone 11.
 iPhone 12 có thiết kế hoài niệm tương tự iPhone 4 series
Ở mặt trước iPhone 12 phần tai thỏ được làm nhỏ gọn hơn và cũng là nơi chứa cảm biến Face ID có thể nhận diện khuôn mặt một cách nhanh chóng và chính xác.
Apple còn mang đến cho người một loạt gam màu cá tính, độc đáo trên những chiếc iPhone của mình để người dùng có sự lựa chọn phù hợp với những phong cách khác nhau.
Sở hữu loạt gam màu cá tính | iPhone 12
iPhone 12 được trang bị màn hình OLED tràn viền có kích thước 6.1 inch, cho bạn không gian trải nghiệm lớn cũng như những giây phút giải trí hấp dẫn trên một màn ảnh vô cùng chất lượng.
Màn hình Super Retina XDR OLED 6.1 inch | iPhone 12
Máy được chế tác có độ hoàn thiện cực cao với thiết kế nguyên khối, khung nhôm và mặt sau là kính cường lực cao cấp toát lên vẻ ngoài sang chảnh cũng như mang lại độ hiệu quả an toàn cao mỗi khi sử dụng.
Độ hoàn thiện cao, chắc chắn cho thiết bị | iPhone 12
Mặt trước của iPhone 12 được phủ hoàn toàn bởi lớp kính cường lực Ceramic Shield cứng cáp, được đánh giá là có độ bền cao và cứng cáp hơn hầu hết các loại mặt kính có trên điện thoại thông minh khác có mặt trên thị trường.
Lớp kính cường lực Ceramic Shield | iPhone 12
Và để cho thiết bị trở nên hoàn hảo hơn nên không thể thiếu khả năng kháng nước, bụi chuẩn IP68 giúp người dùng yên tâm sử dụng với những buổi đi chơi biển mà không hề lo chiếc máy bị vô nước.
Kháng nước bụi chuẩn IP68 | iPhone 12
Trải nghiệm xuyên suốt, liền mạch cả ngày dài
Để bạn có những giây phút trải nghiệm liền mạch, Apple đã trang bị một viên pin có dung lượng 2815 mAh, tích hợp cho khả năng tiết kiệm pin giúp người dùng có thể giải trí đa phương tiện lên đến 17 giờ và nghe nhạc liên tục lên đến 65 giờ.
Dung lượng pin sử dụng đáp ứng đủ một ngày | iPhone 12
Và không thể thiếu đó chính là tính năng sạc nhanh, iPhone 12 có khả năng sạc pin nhanh qua cáp công suất 20 W, chỉ trong vòng 30 phút thì chiếc máy đã có thế sạc được 50% pin. Thêm vào đó là khả năng sạc không dây MagSafe vô cùng tiện dụng.
Lưu ý: Củ sạc không kèm theo máy mà phải mua riêng.
Sạc nhanh và sạc không dây tiện lợi hữu ích | iPhone 12
Sự lột xác đầy mạnh mẽ lần này của Apple không chỉ gây bất ngờ đến người dùng mà còn đánh dấu một kỷ nguyên mới trong nền phát triển smartphone Apple. Và đây cũng được xem là một trong những bộ series iPhone mà Apple đặt nhiều tâm huyết, mục đích và đầy tính năng mạnh mẽ chưa từng thấy.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2031, N'Laptop Asus TUF Gaming FX506LHB i5', 10, 19990000, 25, N'asus-tuf-gaming-fx506lhb-i5-hn188w-600x600.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Nếu bạn đang tìm kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức giá phải chăng thì laptop Asus TUF Gaming FX506LHB i5 (HN188W) sẽ là sự lựa chọn đáng cân nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ cùng phong cách thiết kế cứng cáp, độc đáo. 
• Chạy mượt mà các ứng dụng văn phòng trên Word, Excel, PowerPoint,... đến chiến những con game đình đám nhờ bộ vi xử lý Intel Core i5 10300H kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 4 GB mạnh mẽ. 
• Laptop Asus đa nhiệm mượt mà trên nhiều cửa sổ Chrome cùng lúc nhờ bộ nhớ RAM 8 GB, bên cạnh đó còn mang đến tốc độ khởi động máy và ứng dụng nhanh chóng với ổ cứng SSD 512 GB.   
• Laptop có kích thước màn hình 15.6 inch cùng tần số quét 144 Hz mang đến những trải nghiệm chiến game cực đỉnh, không bị giật lag hay xé hình khi chơi những tựa game có tốc độ cao.
• Laptop Asus TUF Gaming được bao bọc bởi lớp vỏ nhựa màu đen huyền bí, khối lượng 2.3 kg cho phép bạn chiến game ở mọi không gian.
• Máy được trang bị đèn bàn phím chuyển màu RGB độc đáo, tăng độ hăng hái cho game thủ mỗi khi chiến game.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2034, N'Laptop Acer Aspire 7 Gaming A715 42G', 10, 14990000, 20, N'acer-aspire-7-gaming-a715.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Laptop Aspire 7 Gaming A715 42G R4XX R5 (NH.QAYSV.008) sở hữu hiệu năng khoẻ cùng thiết kế mạnh mẽ, là bạn đồng hành lý tưởng trong mọi cuộc hành trình.
• Laptop AMD Ryzen 5 5500U cùng card rời NVIDIA GeForce GTX 1650 4 GB, mang đến khả năng thiết kế 2D, render video ngắn,... ổn định trên các phần mềm Adobe hay giải trí với các tựa game kịch tính trên thị trường hiện nay một cách mượt mà.
• Chiếc laptop Acer Aspire còn sở hữu RAM 8 GB và SSD 256 GB đáp ứng tốt nhu cầu đa nhiệm, hỗ trợ bạn thao tác mọi việc nhanh chóng và hiệu quả hơn.
• Phiên bản laptop này với khối lượng 2.1 kg và dày 22.9 mm, được chế tác từ chất liệu nhựa bền bỉ, dễ dàng để bạn mang đi khắp mọi nơi.
• Bản lề mở 180 độ giúp chia sẻ thông tin nhanh chóng, tiện lợi. Cùng đèn nền đơn sắc được trang bị hỗ trợ bạn gõ phím chuẩn xác trong bóng tối.
• Laptop Acer này có 2 cổng USB 3.2, HDMI, LAN (RJ45), USB 2.0 và USB Type-C cho phép bạn truyền tải dữ liệu nhanh chóng.
• Công nghệ Acer ComfyView, chống chói Anti Glare và tấm nền IPS được trang bị trên màn hình 15.6 inch, mang đến những trải nghiệm rõ nét, góc nhìn mở rộng, hạn chế hiện tượng chói loá, bóng gương, bảo vệ thị giác của bạn.
• Chiếc laptop gaming này cho bạn cảm nhận chân thật âm nhạc sống động, ít bị biến dạng nhờ công nghệ âm thanh Acer TrueHarmony.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2035, N'Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB', 10, 31690000, 20, N'lenovo-legion-5-15iah7-i5-82rc003wvn-2.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Laptop Lenovo Legion 5 15IAH7 i5 12500H (82RC003WVN) gây ấn tượng bởi lối thiết kế đậm chất thể thao, mạnh mẽ với khả năng vận hành mượt mà mọi tựa game từ nhẹ đến nặng, giúp các cao thủ chiến game đầy tự tin và tận hưởng những giây phút đỉnh cao trong chiến trường ảo.
• Bên trong chiếc laptop gaming này ẩn chứa một con quái vật đến từ bộ vi xử lý Intel Core i5 12500H, tăng hiệu suất lên đến 40% so với thế hệ trước. Card rời NVIDIA GeForce RTX 3050Ti 4 GB hỗ trợ bạn chiến mượt mà các tựa game như LOL, PUBG, CS:GO,... cũng như có thể xử lý hoàn hảo các tác vụ đồ họa về hình ảnh và video.
• Laptop RAM 8 GB cho phép bạn chuyển đổi qua lại nhiều ứng dụng cùng lúc, vừa nghe nhạc Remix vừa chiến game mà không xảy ra hiện tượng giật lag, nâng cao hiệu suất làm việc với tốc độ Bus RAM 4800 MHz và hỗ trợ nâng cấp RAM tối đa lên đến 16 GB.
• Không gian ổ cứng SSD 512 GB chuẩn NVMe PCIe với khả năng có thể tháo ra, lắp thanh khác tối đa 1 TB, đồng thời mang đến tốc độ truy xuất dữ liệu nhanh, mở máy hay ứng dụng đều chưa đến 10 giây.
• Laptop sở hữu màn hình 15.6 inch độ phân giải Full HD (1920 x 1080) cùng các công nghệ tiên tiến như chống chói Anti Glare, tấm nền IPS và độ sáng cao 300 nits cho trải nghiệm hình ảnh rõ nét, góc nhìn được mở rộng lên đến 178 độ, bảo vệ thị giác khi bạn chơi game trong thời gian dài. 
• Màn hình có tần số quét 165 Hz giúp tái hiện hình ảnh mượt mà trong mọi pha chuyển động nhanh. Chất lượng hiển thị sắc nét, dãy màu cực rộng nhờ không gian màu đạt chuẩn 100% sRGB. Công nghệ G-Sync đồng bộ tốc độ khung hình với màn hình rời, tăng cảm hứng chiến đấu nhờ không gian rộng lớn hơn.
• Laptop Lenovo Legion được trang bị công nghệ Nahimic Audio mang đến âm vòm 3D sống động, chân thật đưa bạn như bước vào không gian trận chiến.
• Thiết kế nắp lưng bằng kim loại đem đến cảm giác chắc chắn và bền bỉ, những phần còn lại được làm bằng nhựa tông màu xám tạo sự thanh lịch, hiện đại. Khối lượng 2.35 kg vẫn có thể mang theo bên mình cho những cuộc họp nhóm bên ngoài.
• Laptop Lenovo có hệ thống đèn bàn phím chuyển màu RGB tăng cảm hứng trong cả công việc và giải trí, hỗ trợ bạn dễ dàng thao tác trong môi trường thiếu ánh sáng mà không lo ấn nhầm phím làm ảnh hưởng đến kết quả trận đấu.
• Hàng loạt các cổng kết nối như: Thunderbolt 4, Jack tai nghe 3.5 mm, USB 3.2, USB-C, HDMI, LAN (RJ45),... đáp ứng đa nhu cầu sử dụng với các thiết bị ngoại vi.
• Chất lượng hình ảnh trực tuyến khi giải trí và học tập được nâng cao nhờ Full HD Webcam, bạn hoàn toàn có thể vừa chiến game vừa livestream cho bạn bè cùng xem với những hình ảnh sắc nét nhất.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2036, N'Laptop HP VICTUS 16 d0292TX i5 11400H/8GB/512GB', 10, 26590000, 25, N'hp-victus-16-d0292tx-i5-5z9r3pa-thumb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Laptop HP VICTUS 16 d0292TX i5 (5Z9R3PA) sẽ là một người bạn đồng hành đắc lực trên mọi chiến trường ảo của game thủ nhờ ngoại hình sang trọng, hiện đại cùng những thông số kỹ thuật mạnh mẽ. 
• Trang bị chip Intel Core i5 11400H cùng card rời NVIDIA GeForce RTX3050Ti 4 GB, laptop HP Victus sẵn sàng cùng bạn chiến mọi tựa game đình đám như LOL, PUBG, CS:GO,... hay thỏa mãn đam mê sáng tạo với các ứng dụng đồ họa của nhà Adobe. 
• Vừa chiến game vừa nghe nhạc giải trí vẫn rất mượt mà, không giật lag nhờ bộ nhớ RAM 8 GB, ổ cứng 512 GB SSD (có thể tháo và lắp thanh khác tối đa 1 TB) mang đến không gian lưu trữ ổn định cùng tốc độ mở máy nhanh chóng hơn.  
• Quan sát di chuyển của đối thủ ở mọi góc cạnh nhờ kích thước màn hình 16.1 inch cùng tấm nền IPS tạo góc nhìn rộng rãi, độ phân giải Full HD cùng công nghệ Wled-backlit mang đến những khung ảnh chất lượng, sắc nét hơn. 
• Tần số quét 144 Hz cho mọi chuyển động có tốc độ nhanh được mượt mà hơn đáng kể, đồng thời vẫn bảo vệ thị giác của người dùng trước ánh sáng xanh của máy nhờ màn hình chống chói Anti Glare. 
• Công nghệ Audio by B&O kết hợp với Realtek High Definition Audio đắm chìm người dùng vào chính khung cảnh của trận chiến với chất âm sống động, chân thực.
• Chiếc laptop này được bao bọc bởi lớp vỏ nhựa cùng chiếc áo đen toát lên vẻ sang chảnh, mạnh mẽ. Cân nặng 2.46 kg vẫn có thể chấp nhận được trong phân khúc laptop gaming và sẵn sàng cùng bạn chiến đấu khắp mọi nơi.
• Laptop có bàn phím số giúp các thao tác nhập liệu chữ số được tiện lợi hơn rất nhiều, ngoài ra còn có thêm đèn nền phím giúp bạn thoải mái làm việc ở những nơi thiếu sáng.
• Laptop HP được trang bị các cổng kết nối bao gồm USB 3.1, Jack tai nghe 3.5 mm, HDMI, LAN (RJ45) và USB Type-C giúp kết nối với các thiết bị ngoại vi khác nhanh chóng hơn.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2038, N'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H', 10, 19490000, 30, N'Laptop Acer Aspire 3.png', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Phá cách với diện mạo mạnh mẽ đến từ laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) mang đến cho người dùng hiệu năng ổn định, hỗ trợ bạn trong mọi tác vụ hằng ngày hay chiến những trận game cực căng một cách mượt mà.
Kiểu dáng nổi bật, thu hút mọi ánh nhìn
Laptop Acer Nitro với tính bền bỉ vượt bậc khi được trang bị lớp vỏ nhựa chắc chắn cùng khối lượng không quá nặng cho một chiếc laptop gaming 2.2 kg và dày 23.9 mm, sẵn sàng cùng bạn đi đến bất kỳ đâu, phục vụ tốt cho cả nhu cầu công việc hay giải trí, cho phép bạn chiến game ở khắp mọi nơi trong cuộc hành trình.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Thiết kế
Bàn phím Fullsize được thiết kế đèn nền chuyển màu RGB của laptop Acer được thiết kế tinh tế nhưng vẫn tôn lên nét mạnh mẽ của một chiếc gaming mạnh mẽ, với các phím có độ nảy tốt, cho bạn thoải mái sử dụng cả trong điều kiện ánh sáng kém mà không lo nhầm lẫn.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Bàn phím
Dọc hai bên laptop được trang bị các cổng giao tiếp thông dụng hỗ trợ tốt cho nhu cầu truyền xuất dữ liệu hay chia sẻ thông tin đến các thiết bị ngoại vi tương thích như 3 cổng USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45) và USB Type-C.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Cổng kết nối
Các chuẩn kết nối không dây Bluetooth 5.0 và Wi-Fi 6 (802.11ax) cung cấp đường truyền ổn định trong suốt quá trình làm việc hay giải trí ở cả trong nhà, ngoài trời, nâng cao năng suất công việc của bạn.
Đánh bại mọi đối thủ trong mọi trận chiến
Laptop AMD Ryzen 5 5600H với 6 nhân 12 luồng mang đến tốc độ cơ bản 3.30 GHz và đạt tối đa lên đến 4.2 GHz nhờ Turbo Boost, cùng bộ nhớ đệm 16 MB mang đến hiệu suất công việc bất ngờ khi hỗ trợ trong mọi công việc văn phòng từ cơ bản đến nâng cao một cách hoàn mỹ với Word, Excel,... hay thậm chí còn xử lý các nhu cầu thiết kế đồ hoạ, thiết kế posters, banners,... ấn tượng.
Đem đến cho bạn một phiên bản laptop đa nhiệm hơn khi sở hữu RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời) sở hữu tốc độ Bus RAM 3200 MHz cùng khả năng nâng cấp tối đa đến 32 GB, hỗ trợ bạn tối ưu trong việc mở nhiều ứng dụng cùng lúc và chuyển đổi qua lại một cách trơn tru, mang đến hiệu quả cho công việc tốt hơn.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Cấu hình
Không những hỗ trợ bạn tối đa trong việc chiến những trận game LOL, Total War: Warhammer,... đầy kịch tính một cách mượt mà với hình ảnh chuẩn xác, card đồ họa rời NVIDIA GeForce GTX 1650 4 GB còn cho phép đồ họa hiển thị một cách rõ nét cùng sắc màu chân thật, hỗ trợ bạn làm công việc sáng tạo một cách hiệu quả hơn với các phần mềm thiết kế Lightroom, AI, Photoshop,...
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Card đồ hoạ
Ổ cứng SSD 512 GB NVMe PCle, cùng khả năng tháo ra và lắp thanh khác tối đa 1 TB, vừa cung cấp không gian lưu trữ rộng lớn cho mọi loại dữ liệu yêu thích, vừa hỗ trợ mở máy hay vận hành các ứng dụng một cách nhanh chóng chỉ trong vài giây.
Tối ưu hơn khi thiết bị này còn được trang bị thêm khe cắm HDD SATA nâng cấp tối đa 2 TB và khe cắm SSD M.2 PCIe mở rộng nâng cấp tối đa 1 TB, đáp ứng tốt hơn cho mọi nhu cầu từ bạn, cho bạn thỏa thích tải mọi ứng dụng hay hàng loạt tựa game thịnh hành.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - SSD
Hệ điều hành Windows 11 Home SL được tích hợp sẵn trong máy cho phép bạn tận hưởng những ứng dụng thông minh được cập nhật.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Windows 11
Không gian hình ảnh và âm thanh được cải thiện đáng kể
Laptop màn hình 15.6 inch mỏng 2 cạnh bên sở hữu độ phân giải Full HD (1920 x 1080) mang đến hình ảnh sắc nét, sống động đến từng chi tiết với khung hình chuẩn xác có tốc độ đọc nhanh vượt trội, chuyển động mượt mà nhờ tần số quét 144 Hz, cho phép bạn chơi những tựa game hành động đầy hấp dẫn mà không lo xảy ra tình trạng giật, xé ảnh.
Không dừng lại ở đó khi thiết bị còn được trang bị màn hình TFT với khả năng dẫn ánh sáng tốt, ổn định và kiểm soát tốt hình ảnh, màu sắc hiển thị nhưng vẫn hạn chế tối đa lượng điện năng tiêu thụ nhờ công nghệ LED Backlit.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Màn hình
Khung hình được mở rộng lên đến 178 độ nhờ tấm nền IPS, mang đến hình ảnh hình ảnh sắc rõ với màu sắc được tái tạo chân thật cùng màn hình Acer ComfyView cho phép bạn làm việc hay giải trí ở bất kỳ điều kiện ánh sáng nào mà không lo mỏi mắt hay lóa mắt.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Tính năng khác
Sự kết hợp hoàn mỹ của hai công nghệ âm thanh hiện đại Acer TrueHarmony và DTS:X Ultra Audio mang đến chất âm to rõ với âm vòm cao cấp, ít bị biến dạng cùng khả năng tái tạo âm thanh 3D với dải âm trầm rộng hơn, cho bạn tận hưởng không gian âm nhạc hay phim ảnh đầy thư giãn, thoải mái.
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) - Âm  thanh
Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) là phiên bản laptop gaming đáng được chọn mua khi sở hữu thiết kế độc đáo cùng hiệu năng mạnh mẽ, sẵn sàng cùng bạn chinh chiến mọi trận đấu gây cấn, giành chiến thắng cuối cùng.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2040, N'Laptop MSI Gaming GF65 Thin 10UE i5 10500H/16GB', 10, 24290000, 10, N'msi-gamin-gf65-thin-10ue-i5.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Tối ưu hóa cho mọi hoạt động từ đồ họa đến chiến game, laptop MSI GF65 Thin 10UE i5 (286VN) sẽ là người cộng sự đắc lực với thiết kế độc đáo và cấu hình mạnh mẽ, cùng bạn xông pha trên mọi chiến trường ảo.
Tự tin cùng bạn chinh chiến game với sức mạnh hiệu năng vượt trội
Xử lý mọi tác vụ văn phòng một cách ấn lượng hay thỏa mãn bạn với mọi tựa game kịch tính nhất hiện nay như Cyberpunk 2077, CS:GO, LOL, FIFA, PUBG: Battlegrounds,... nhờ hiệu năng vượt bật của bộ CPU Intel Core i5 10500H sở hữu cấu trúc 6 nhân 12 luồng, mang đến tốc độ xung nhịp cơ bản 2.50 GHz và đạt tối đa lên đến 4.5 GHz Turbo Boost.
Phiên bản laptop này mang đến cho người dùng trải nghiệm ấn tượng hơn nhờ khả năng đa nhiệm cực tốt đến từ bộ nhớ RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) với tốc độ bus RAM 3200 MHz, cho phép bạn mở và vận hành cùng lúc nhiều ứng dụng. Thêm vào đó, MSI còn hỗ trợ nâng cấp RAM tối đa lên đến 64 GB, tối ưu nhu cầu sử dụng.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Cấu hình
Máy được trang bị card đồ họa rời NVIDIA GeForce RTX 3060 Max-Q 6GB được thiết kế dựa trên kiến trúc Ampere tân tiến, cho phép người dùng thao tác mượt mà, loại bỏ tối đa các hiện tượng giật lag hay bóng ma, mang đến mọi chuyển động trơn tru kể cả game có mức cài đặt cao. Không dừng lại ở việc chiến game, laptop GF65 còn hỗ trợ bạn chỉnh sửa hình ảnh, render video,... một cách hiệu quả cùng các ứng dụng Photoshop, AI, Premiere,...
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Card đồ họa
Ổ cứng SSD 512 GB NVMe PCIe với không gian lưu trữ rộng lớn cùng khả năng truy cập và phản hồi nhanh chóng tức thời. Đồng thời, bạn có thể dễ dàng tháo rời ổ cứng và thay thế bằng thanh khác tối đa 2 TB, phục vụ tối ưu cho mọi nhu cầu của bạn.
Mở rộng bộ nhớ dễ dàng hơn nhờ laptop được trang bị thêm khe cắm SSD M.2 PCIe (nâng cấp tối đa 2 TB), cho bạn làm việc và giải trí thoải mái với không gian lưu trữ rộng lớn.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - SSD
Bắt mắt với vẻ ngoài hiện đại toát lên sức hút mạnh mẽ
Mang đến cho người dùng một thiết kế đậm chất viễn tưởng với logo laptop MSI đỏ rực nổi bật trên nền đen huyền bí của nắp lưng, chiếu nghỉ tay kim loại phay xước bền bỉ cùng khối lượng 1.86 kg và dày 21.7 mm, luôn trong tư thế sẵn sàng cùng bạn chiến game trên mọi mặt trận dù ở bất kỳ đâu.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Thiết kế
Gây ấn tượng mạnh mẽ hơn khi phiên bản laptop MSI gaming này sở hữu bàn phím với hành trình phím thích hợp, độ nảy tốt được trang bị đèn nền sắc đỏ bắt mắt như tiếp thêm sức mạnh cho các game thủ, đem đến lợi thế chiến thắng trong hàng loạt trận chiến.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Bàn phím
Đa dạng các cổng giao tiếp được trang bị ở chiếc laptop gaming này như: 2 cổng USB 3.2, 2 cổng USB Type-C, HDMI, Jack tai nghe 3.5 mm và LAN (RJ45), hỗ trợ bạn kết nối và truyền xuất dữ liệu dễ dàng hơn với nhiều loại thiết bị tương thích khác nhau.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Cổng kết nối
Đường truyền ổn định trong cả trận game nhờ kết nối không dây Bluetooth 5.1 và Wi-Fi 6 (802.11ax), cho bạn thuận lợi giải trí hay làm việc ở bất kỳ đâu mà không lo ngắt quãng, gián đoạn.
Chìm đắm trong không gian sống động như thật
Màn hình viền mỏng 15.6 inch được trang bị độ phân giải Full HD (1920 x 1080) cho bạn cảm giác như đang ở trong chính trận đấu với hình ảnh chân thật sắc nét cùng những chuyển động mượt mà hơn bao giờ hết, không lo tình trạng giật, lag nhờ tần số quét màn hình 144 Hz.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Tần số quét
Giảm thiểu tối đa tác hại của ánh sáng xanh đến mắt người dùng nhờ công nghệ chống chói Anti Glare, cho bạn tận hưởng không gian giải trí cả ngày lẫn đêm với khung hình được mở rộng đến 178 độ đến từ tấm nền IPS.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Màn hình
Sự kết hợp hài hòa giữa công nghệ âm thanh Nahimic Audio và Realtek High Definition Audio mang đến cho bạn âm thanh đúng chuẩn cùng khả năng khuếch đại âm thanh và tính năng tùy chỉnh âm nhạc, khiến bạn đắm chìm vào sự thoải mái đầy thư giãn của phim ảnh hay âm nhạc.
MSI Gaming GF65 Thin 10UE i5 10500H (286VN) - Âm thanh
Chiến hữu đắc lực MSI GF65 Thin 10UE i5 (286VN) sẽ luôn đồng hành cùng bạn tạo nên những chiến thắng đầy thuyết phục, là sự lựa chọn phù hợp cho bất kỳ người dùng nào.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2041, N'Laptop Asus TUF Gaming FX517ZC i5', 10, 27990000, 10, N'asus-tuf-gaming-fx517zc-i5-hn077w.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Sở hữu ngoại hình ấn tượng thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus TUF Gaming FX517ZC i5 12450H (HN077W) là lựa chọn xứng tầm cho mọi nhu cầu chiến game giải trí hay đồ hoạ - kỹ thuật của người dùng.
• Laptop Asus TUF mang hiệu năng vượt trội cho khả năng giải quyết trơn tru các tác vụ phức tạp như thiết kế hình ảnh, render video,... trên các ứng dụng nhà Adobe hay thoả sức chiến các tựa game hot như CS:GO, GTA V,... nhờ trang bị chip Intel Core i5 Alder Lake 12450H cùng card rời NVIDIA RTX 3050, 4 GB.
• RAM 8 GB chuẩn DDR5 tiên tiến, mang đến khả năng đa nhiệm mượt mà. SSD 512 GB hỗ trợ truy xuất dữ liệu nhanh, rút ngắn thời gian chờ. Ngoài ra, máy này cũng hỗ trợ nâng cấp để gia tăng năng suất làm việc của bạn.
• Màn hình 15.6 inch phủ tấm nền IPS có khả năng tái tạo màu tốt, mở rộng góc nhìn lên đến 178 độ. Công nghệ Anti Glare hỗ trợ chống chói, loá mờ trên màn hình, bảo vệ thị giác người dùng.
• Làm chủ mọi trận game, giảm độ trễ nhờ tần số quét 144 Hz kết hợp công nghệ Adaptive-Sync trên laptop Asus giúp loại bỏ những vấn đề như giật, xé hình mang lại cho bạn trải nghiệm giải trí, chơi game ổn định hơn bao giờ hết.
• Được chế tác từ vỏ nhựa cứng cáp đi kèm là sắc xám hiện đại với những đường cắt tinh xảo, khơi nguồn cảm hứng chiến game. Khối lượng chỉ 2 kg sẵn sàng bên cạnh phục vụ bạn mọi lúc, trên mọi chiến trường ảo.
• HD Webcam hỗ trợ các cuộc gọi video hay học trực tuyến dễ dàng hơn nhờ chất lượng hình ảnh ổn định. Đèn nền đơn sắc cũng được tích hợp trên bàn phím laptop.
• Đạt chuẩn Hi-Res Audio cùng công nghệ âm vòm Dolby Atmos cung cấp âm thanh sống động từ mọi hướng, lấp đầy không gian với độ rõ, chi tiết và chiều sâu đáng kinh ngạc.
• Truyền tải dữ liệu, kết nối nhanh với các thiết bị ngoại vi nhờ các cổng giao tiếp: USB 3.2 Gen 2 Type-C, 2 x USB 3.2, HDMI, LAN (RJ45), Thunderbolt 4.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2042, N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5', 10, 24190000, 10, N'lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) thuộc dòng laptop gaming mang vẻ đẹp ấn tượng, cuốn hút nhưng không kém phần mạnh mẽ nhờ vào CPU Intel Gen 12, sẵn sàng đồng hành cùng bạn trên mọi đấu trường game hiện nay.
Thiết kế hầm hố, cá tính với gam màu trắng cuốn hút
Lenovo IdeaPad Gaming 3 sở hữu một thiết kế góc cạnh cùng gam màu trắng pha lẫn các chi tiết xanh tạo nên một tổng thể vô cùng mạnh mẽ, hầm hố nhưng không kém phần sang trọng. Tuy có lớp vỏ từ nhựa nhưng cảm giác cầm nắm, xách lên di chuyển rất chắc chắn và không ọp ẹp.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - thiết kế
Thiết kế từ tản nhiệt của máy làm thiết bị này trở nên nổi bật hơn bao giờ, 2 khe hút gió và 2 khe tản nhiệt được đặt tinh tế đối xứng đi với tông màu xanh làm chiếc máy trông rất hầm hố và tương lai. Các trải nghiệm chơi game cũng được hệ thống tản nhiệt làm việc rất tốt giúp mình không có cảm giác bị hơi nóng tỏa ra làm khó chịu.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - khe tản nhiệt
Sở hữu cho mình cân nặng 2.315 kg và độ dày 21.8 mm, mức trọng lượng này có phần nặng hơn so với người đàn anh của mình tuy nhiên không nhiều. Với hiệu năng mạnh mẽ từ chiếc máy này, thêm một ít khối lượng cũng không làm chúng ta quá khó khăn khi di chuyển. Các thao tác gập lên, gập xuống của bản lề trên máy được hoàn thiện rất tốt, mình có thể cảm thấy được sự mượt mà và trơn tru. Tuy nhiên, bản lề chưa thật sự tạo cho mình cảm giác chắc chắn, màn hình có phần hơi rung nhẹ với các tác động.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - trọng lượng
Bàn phím của các chiếc laptop từ hãng Lenovo luôn mang đến một trải nghiệm gõ rất tuyệt vời. Với IdeaPad Gaming 3, bàn phím sử dụng layout FullSize với tông màu trắng liền mạch với màu của máy, tạo nên một tổng thể vô cùng sang trọng và bắt mắt. Hơn hết, hành trình phím và độ nảy của phím được Lenovo làm rất tốt, bạn có thể gõ văn bản hằng giờ liền mà không cảm thấy nhàm chán.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - bàn phím
Cảm giác đây là một chiếc máy đến từ tương lai khi bật đèn nền bàn phím lên, máy trang bị cho chúng ta đèn nền màu xanh làm chiếc máy trông rất nổi bật và cuốn hút. Đèn ở phím hỗ trợ rất nhiều cho mình khi làm việc ở những điều kiện thiếu sáng. Bên cạnh đó, bàn di chuột trên máy cũng mượt mà và chính xác, có thể thay thế chuột rời làm một số tác vụ cơ bản.
Các cổng kết nối có kích thước lớn như HDMI, LAN (RJ45), Thunderbolt 4 và Jack sạc được Lenovo tinh tế đặt ở phía sau giúp bạn dễ dàng giấu dây, tạo nên một không gian làm việc gọn gàng. Bên cạnh đó máy cũng trang bị đầy đủ Jack tai nghe 3.5 mm, USB 3.2 xung quanh hai cạnh giúp bạn sử dụng dễ dàng và tiện lợi hơn.
Cấu hình mạnh mẽ, chiến game vô tư cùng bạn
Laptop Lenovo Ideapad Gaming trang bị bộ vi xử lý Intel Core i5 Alder Lake 12500H, với sự kết hợp giữa nhân hiệu năng mạnh P-core và nhân tiết kiệm E-core giúp hiệu suất hoạt động của CPU cao hơn đáng kể so với các thế hệ đi trước, từ đó có thể giải quyết các tác vụ làm việc, chơi game của bạn một cách nhẹ nhàng và nhanh chóng. Các thông số thu được khi mình sử dụng phần mềm Cinebench R23 lần lượt là 1597 ở đơn nhân và 10461 ở đa nhân. Một số điểm tương đối cao so với dòng laptop gaming có mức giá phổ thông.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - hiệu năng
Card đồ họa rời NVIDIA GeForce RTX 3050 4 GB có thể cân tốt cho bạn các tựa game thịnh hành hiện nay như Liên Minh Huyền Thoại, CS:GO, GTA V,... hơn hết bạn có thể thỏa sức sáng tạo với các phần mềm thiết kế của Adobe: Photoshop, Illustrator, Premiere,... một cách mượt mà và nhẹ nhàng.
Với laptop RAM 8 GB, bạn có thể sử dụng các tác vụ đa nhiệm một cách cơ bản như vừa chơi game vừa nghe nhạc thoải mái. Nếu bạn cần tăng dung lượng bộ nhớ để sử dụng nhiều hơn đa nhiệm, máy cho phép nâng cấp vì còn dư một 1 khe RAM rời.
Laptop Lenovo được trang bị ổ cứng 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB), việc lưu trữ các tựa game hoặc các tập tin tài liệu cơ bản có thể vừa đủ với bạn. Thêm vào đó, với chuẩn PCIe, việc truy xuất dữ liệu hoặc tắt mở các ứng dụng được cải thiện rất đáng kể, từ đó giúp bạn tiết kiệm được rất nhiều thời gian.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - SSD
Với các thông số trên lý thuyết là vậy, mình sẽ trực tiếp trải nghiệm game trên chiếc máy này để có được hiệu năng thực tế trên laptop Lenovo Ideapad Gaming. Tựa game đầu tiên mình chơi là CS:GO, tốc độ khung hình ở tựa game này cho ra khoảng 130 - 145 FPS khi kết hợp với màn hình 120 Hz là rất mượt mà, các thao tác chính xác gần như tuyệt đối.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - CS:GO
Tựa game thứ hai mình trải nghiệm là Valorant, một tựa game có nhiều hiệu ứng hơn để có thể thử xem hệ thống tản nhiệt trên máy hoạt động đã tốt chưa. Mức FPS dao động khoảng 110 - 120 FPS với mức cài đặt cấu hình rất cao. Bên cạnh đó, hệ thống tản nhiệt của laptop IdeaPad Gaming 3 làm khá tốt khi ổn định ở 56 độ cho CPU và 67 độ GPU.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - Valorant
Với màn hình 120 Hz và hiệu năng tương đối tốt khi chơi game mình quyết định chọn MotoGP™22 để trải nghiệm. Ở tựa game đua xe này, màn hình và hiệu năng của máy phát huy rất tốt khi mang đến mức FPS ổn định ở 126 - 130, các thao tác ôm cua, điều khiển đều được mượt mà và chuẩn xác.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - MotoGP™22
Hiển thị hình ảnh chuyên nghiệp hơn
Laptop sở hữu màn hình 15.6 inch cùng độ phân giải Full HD, các hình ảnh được hiển thị đều rất rõ ràng và sắc nét. Trang bị đầy đủ các công nghệ phần mềm nổi bật hiện nay như 250 nits, chống chói Anti Glare, tấm nền IPS giúp bạn thoải mái trải nghiệm chơi game ở mọi môi trường, mọi góc nhìn.
Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) - màn hình
Thuộc dòng laptop gaming có viên pin dung lượng 60 Wh, tuy nhiên khi sử dụng máy chỉ có thể trụ được khoảng 2 tiếng khi mình làm việc trên Excel và xem YouTube. Nếu bạn trải nghiệm game hoặc các tác vụ nặng, hãy cắm sạc để máy đạt được hiệu năng tốt nhất nhé.
Tổng kết lại, mang cho mình thiết kế “phi thuyền” đầy cá tính và mạnh mẽ. Bạn còn chần chờ gì nữa mà chưa sở hữu cho mình laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) để có thể chiến game hoặc khoe với bạn bè vì thiết kế nổi bật cùng hiệu năng ấn tượng của nó.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2043, N'Laptop Dell Gaming G15 5515 R5 5600H/16GB', 30, 23490000, 20, N'dell-gaming-g15-5515-r5-p105f004dgr.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Bộ hiệu năng gây ấn tượng đến từ con chip AMD mạnh mẽ cùng thiết kế cá tính, nổi bật, laptop Dell Gaming G15 5515 R5 (P105F004DGR) sẽ đáp ứng tối ưu mọi nhu cầu từ các tác vụ văn phòng cơ bản đến những ứng dụng đồ họa, chơi game giải trí chuyên nghiệp.
Thiết kế đậm chất riêng, đầy ấn tượng
Laptop Dell Gaming hoàn thiện từ chất liệu nhựa cao cấp, bền bỉ, phủ gam màu xám thời thượng, thu hút bạn từ cái nhìn đầu tiên, thích hợp với đa dạng đối tượng người dùng bởi phong cách gaming hiện đại, không quá hầm hố.
Khối lượng 2.8 kg và độ dày 26.9 mm tạo cảm giác cứng cáp hơn cho máy, nhưng vẫn vừa vặn nằm gọn trong balo, tiện lợi cùng bạn di chuyển mọi lúc mọi nơi để học tập, làm việc cũng như chơi game giải trí hoàn hảo.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Thiết kế
Bàn phím có khoảng cách rộng rãi, hợp lý với hành trình phím sâu, nút bấm êm, độ nảy tốt tạo cảm giác nhạy bén, chuẩn xác, thoải mái khi nhập liệu, soạn thảo. Đặc biệt, trang bị đèn nền đơn sắc nổi bật tích hợp dưới bàn phím tạo thêm điểm nhấn cho chiếc laptop này vừa giúp người dùng thuận tiện làm việc hay chiến game ở những nơi thiếu sáng.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Bàn phím
Laptop Dell trang bị đa dạng các cổng kết nối thông dụng bao gồm: 2 x USB 2.0, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 3.2, USB Type-C giúp liên kết dễ dàng và truyền tải dữ liệu nhanh chóng đến các thiết bị ngoại vi tương thích như màn hình rời, máy chiếu, loa, chuột, máy in,... 
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Cổng kết nối
Hai chuẩn kết nối không dây Bluetooth 5.2, Wi-Fi 6 (802.11ax) cho tốc độ truyền tệp nhanh, giảm độ trễ giảm, đảm bảo cho đường truyền internet của bạn luôn trong trạng thái ổn định, hạn chế xảy ra hiện tượng ngắt quãng giữa chừng.
Chơi game cực mượt với hiệu năng vượt trội
Dell Gaming G15 mang hiệu suất cao nhờ sở hữu bộ vi xử lý AMD Ryzen 5 5600H có cấu trúc 6 nhân 12 luồng cho tốc độ xung nhịp cơ bản 3.30 GHz và đạt tối đa lên đến Turbo Boost 4.2 GHz, giúp giải quyết trơn tru các công việc văn phòng cơ bản như Word, Excel, Powerpoint,... đến thiết kế đồ họa, kỹ thuật chuyên dụng trên công cụ Photoshop, Illustrator, Figma, AutoCAD,... 
Laptop RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) tốc độ bus RAM 3200 MHz, hỗ trợ nâng cấp tối đa 32 GB, đa nhiệm siêu mượt mà, bạn hoàn toàn có thể mở hàng chục cửa sổ vừa làm việc, vừa nghe nhạc thư giãn mà không lo giật lag, đứng máy.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Cấu hình
Ngoài ra, laptop AMD Ryzen 5 còn trang bị card đồ họa rời NVIDIA GeForce RTX3050 4 GB cải thiện hiệu suất đồ họa tốt hơn, giúp bạn thực hiện chỉnh sửa hình ảnh với kết xuất 2D, 3D, render video một cách chuyên nghiệp hay chiến các tựa game thịnh hành ở mức cài đặt cao như Fifa Online 4, LOL, Cyberpunk 2077, GTA V,... 
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Card đồ hoạ
Laptop ổ cứng SSD 512 GB NVMe PCIe có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230) tăng tốc độ khởi động máy, truy xuất dữ liệu nhanh chóng, rút ngắn thời gian phản hồi chỉ trong vài giây, đồng thời còn cung cấp cho bạn một không gian lưu trữ đủ để bạn lưu lại các phần mềm yêu thích mà không sợ quá nặng máy. Bên cạnh đó còn hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng dung lượng khi cần thiết.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - SSD
Chi tiết, sinh động trên từng khung hình giải trí
Màn hình rộng 15.6 inch có độ phân giải Full HD (1920 x 1080) và độ sáng 250 nits sắc nét ngay cả khi ở nơi có cường độ ánh sáng cao, cùng công nghệ LED Backlit mang đến trải nghiệm xem chơi game, xem phim chân thật, sinh động, đã mắt cho bạn hòa mình vào thế giới ảo một cách tuyệt vời nhất.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Màn hình
Tần số quét màn hình 120 Hz mãn nhãn với các tựa game hành động hấp dẫn, mọi hoạt cảnh game chuyển động mượt mà, hạn chế bị xé hay nhòe hình, kết hợp với màn hình chống chói Anti Glare và công nghệ WVA cung cấp tầm nhìn lên đến 178 độ, đồng thời đảm bảo an toàn cho mắt trong các môi trường ánh sáng cao.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Tần số quét
Công nghệ Nahimic Audio tạo hiệu ứng âm thanh vòm, tái tạo âm âm sắc tốt, cho chất âm chi tiết, trung thực với âm bass to rõ và độ lọc khử tiếng ồn tốt, bạn có thể dễ dàng nghe được các chuyển động nhỏ trong game.
Dell Gaming G15 5515 R5 5600H (P105F004DGR) - Âm thanh
Dell Gaming G15 5515 R5 (P105F004DGR) hứa hẹn là một trong những sự lựa chọn tuyệt vời trong phân khúc laptop gaming bởi thiết kế độc đáo, cá tính cùng những thông số kỹ thuật ấn tượng.', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2044, N'Laptop Lenovo Gaming Legion 5 15ACH6 R5', 5, 23790000, 10, N'lenovo-gaming-legion-5-15ach6-r5-82jw00klvn.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Với phong cách thiết kế độc đáo cùng card đồ họa NVIDIA GeForce mạnh mẽ, laptop Lenovo Gaming Legion 5 15ACH6 (82JW00KLVN) đáp ứng tốt mọi tác vụ từ học tập, văn phòng nhẹ nhàng đến đồ họa, kỹ thuật chuyên sâu.
• Xử lý mọi nhu cầu làm việc hay giải trí cơ bản nhờ bộ vi xử lý AMD Ryzen 5 5600H, hỗ trợ bạn chiến các tựa game như CS:GO, GTA V, PUBG, LOL,... với card đồ họa rời NVIDIA GeForce RTX3050 4 GB mạnh mẽ.
• Laptop AMD Ryzen 5 trang bị bộ nhớ RAM 8 GB cho phép bạn mở hàng loạt cửa sổ ứng dụng cùng lúc, ổ cứng SSD 512 GB cùng khe cắm SSD M.2 PCIe mở rộng mang đến không gian lưu trữ tốt, đáp ứng tối đa nhu cầu công việc. 
• Laptop gaming có tần số quét 165 Hz cho độ trễ thấp, màn hình 100% sRGB cùng công nghệ Dolby Vision tái tạo các gam màu sắc một cách chuẩn xác, tươi mới.
• Laptop màn hình 15.6 inch cùng tấm nền IPS hiện đại cho góc nhìn bao quát. Độ phân giải Full HD (1920 x 1080) và công nghệ Anti Glare cung cấp chất lượng hình ảnh rõ nét, bảo vệ thị giác người xem, giảm thiểu hiện tượng chói.
• Laptop Lenovo Gaming Legion sở hữu thiết kế độc đáo với chiếc logo nổi bật trên lớp vỏ nhựa bền chắc, khối lượng 2.4 kg luôn trong tư thế sẵn sàng chiến đấu bất cứ khi nào bạn cần.
• Máy được trang bị công tác khóa camera hiện đại. Laptop Lenovo còn trang bị đèn nền phím đơn sắc cho phép bạn làm việc hay chiến game ngay cả trong môi trường thiếu sáng.
• Đa dạng các cổng kết nối hiện đại được trang bị trên laptop như 1 x USB 3.2, 2 x USB Type-C, 3 x USB 3.2, HDMI và LAN (RJ45).', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2045, N'Laptop HP 240 G8 i3 1005G1/4GB/512GB', 5, 9590000, 10, N'hp-240-g8-i3-519a8pa-021121-045431-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Laptop HP 240 G8 i3 (519A8PA) là chiếc máy tính xách tay học tập căn bản với thiết kế đơn giản thanh lịch, cấu hình ổn và một mức giá tốt, là người bạn đồng hành lý tưởng cho học sinh, sinh viên.
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
Hiệu năng tốt, đáp ứng nhu cầu học tập, văn phòng cơ bản
Trang bị bộ vi xử lý Core i3 thế hệ 10 1005G1 của Intel với xung nhịp trung bình khoảng 1.2 GHz và tối đa là 3.4 GHz nhờ công nghệ Turbo Boost, HP 240 G8 đa nhiệm mượt mà các tác vụ quen thuộc như Word, Excel, PowerPoint,... và giải trí trực tuyến với phim ảnh, âm nhạc...
Laptop RAM 4 GB thuộc dòng DDR4 (On board 4 GB + 1 khe rời), tốc độ Bus RAM 2666 MHz và khả năng nâng cấp tối đa lên 16 GB tăng cường sức mạnh đa nhiệm của máy, không lo đứng màn hình, lag máy khi chạy đồng thời nhiều ứng dụng cơ bản phục vụ học tập và giải trí.
GPU có sự góp mặt của card đồ họa tích hợp Intel UHD Graphics giúp nâng cao chất lượng màu sắc, tương phản và độ sắc nét của các thông tin hình ảnh trên laptop, hỗ trợ bạn chỉnh sửa hình ảnh 2D đơn giản trên Photoshop.
HP 240 G8 i3 1005G1 (519A8PA) - Cấu hình
Ổ cứng SSD 512 GB NVMe PCIe cho khả năng lưu trữ đủ dùng với nhu cầu cá nhân, hỗ trợ sức mạnh giúp laptop khởi động và truy xuất dữ liệu nhanh chóng, đẩy nhanh hiệu suất công việc.
HP 240 G8 i3 1005G1 (519A8PA) - SSD
Màn hình sắc nét, chất lượng hiển thị tốt ở mọi nội dung
Kích thước màn hình 14 inch được hỗ trợ công nghệ IPS tạo góc nhìn rộng 178 độ cho bạn thoải mái chọn nhiều tư thế xem nhưng chất lượng hình ảnh vẫn không đổi. Các chi tiết hiển thị sắc nét, độ tương phản tốt kể cả nơi có ánh sáng gắt nhờ độ phân giải Full HD (1920 x 1080) và độ sáng màn hình đạt 250 nits.
Công nghệ chống chói Anti Glare bảo vệ chất lượng khung hình trong các điều kiện chiếu sáng khác nhau, dễ dàng dùng máy ở ngoài trời mà không bị tình trạng lóa mắt, nhòe, bảo vệ tốt hơn cho thị giác của bạn.
HP 240 G8 i3 1005G1 (519A8PA) - Màn hình
Nhờ được trang bị hệ thống loa kép cùng công nghệ âm thanh Stereo speakers, laptop mang đến âm thanh to rõ, phát ra từ nhiều hướng, chất âm tốt được tinh chỉnh trong trẻo, sống động, phục vụ nhu cầu nghe nhạc, giải trí hay đàm thoại trực tuyến rất tốt.
HP 240 G8 i3 1005G1 (519A8PA) - Âm thanh
Một thiết kế vừa mắt, một cấu hình chạy ổn và một mức giá vừa tầm, laptop HP cơ bản này sẽ là một trong những lựa chọn tốt cho nhu cầu sử dụng công nghệ vào việc học tập, tra cứu thông tin,...', 3)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2047, N'Máy tính bảng Lenovo Tab M8', 5, 3990000, 10, N'lenovo-tab-m8-tb-8505x400x400-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Lenovo Tab M8 chiếc máy tính bảng giá rẻ, cấu hình ổn, thiết kế cao cấp trong tầm giá, hoàn toàn phù hợp với các nhu cầu cơ bản như đọc báo, xem phim, lướt web hằng ngày.
Thiết kế đơn giản, tinh tế
Máy tính bảng Lenovo Tab M8 có thiết kế cao cấp nhờ mặt lưng được làm bằng chất liệu nhựa nguyên khối, chắc chắn cho cảm giác cầm nắm vô cùng thích.
Máy tính bảng Lenovo Tab A22 | Thiết kế vỏ nhựa nguyên khối
Màn hình kích thước 8 inch nhỏ gọn, với tỉ lệ hiển thị đến 83% nhờ các cạnh viền được làm khá mỏng cho không gian hiển thị được nhiều thông tin mà nhưng vẫn cho trải nghiệm cầm nắm nhẹ nhàng, dễ dàng thao tác.
Máy tính bảng Lenovo sở hữu màn hình IPS LCD với độ phân giải 1280 x 800 Pixels , cho chất lượng hiển thị tốt, mặc dù không quá xuất sắc nhưng đủ dùng cho các nhu cầu cơ bản.Máy tính bảng Lenovo Tab A22 | Hiển thị rõ ràng ở mọi góc nhìn
Bằng việc tích hợp 2 loa ngoài cùng với công nghệ âm thanh Dolby Audio, giúp trải nghiệm xem phim, nghe nhạc trên chiếc máy tính bảng Lenovo này thêm sống động, tuyệt vời.
Xem thêm: Màn hình IPS LCD là gì?
Hiệu năng ổn định cho các nhu cầu cơ bản hằng ngày
Lenovo Tab M8 sử dụng vi xử lý MediaTek Helio A22 với 4 nhân tốc độ 2.0 Ghz. Máy tính bảng có RAM 3 GB có thể đáp ứng đủ nhu cầu cơ bản, từ lướt web, xem phim, thậm chí chơi game.
Với cấu hình này máy chỉ có thể chơi các tựa game nhẹ như: Candy Crush, Plants vs Zombies 2, Minecraft: Pocket Edition,... hay xử lý các tác vụ văn phòng nhẹ.
Máy tính bảng Lenovo Tab A22 | Tải được nhiều ứng dụng cần thiết
Bên cạnh đó, máy được cài đặt sẵn hệ điều hành Android 10 với giao diện đẹp mắt, các icon to, rõ kể cả người lớn tuổi cũng có thể dễ dàng thao tác và sử dụng. 
Máy tính bảng Lenovo Tab A22 | Giao diện màn hình
Ngoài ra, chiếc máy tính bảng này còn được hỗ trợ khay sim 4G tốc độ cao, tích hợp nhiều tính năng thông minh, giúp cho các bật phụ huynh có thể dễ dàng trao đổi dữ liệu, giám sát được hoạt động của con em mình hằng ngày trên chiếc máy tính bảng này.
Thời lượng pin thật sự ấn tượng khi máy có thể lướt web liên tục lên đến hơn 10 tiếng, một con số rất tốt với một chiếc máy tính bảng giá rẻ.
Máy tính bảng Lenovo Tab A22 | Gắn được thẻ sim
Camera đủ nhu cầu gọi thoại
Lenovo Tab M8 được trang bị bộ đôi camera trước và sau với độ phân giải lần lượt là 5 MP và 2 MP. Mặc dù không quá xuất sắc nhưng vẫn đủ dùng cho các nhu cầu cơ bản như gọi video call cho người thân và gia đình một cách dễ dàng.
Máy tính bảng Lenovo Tab A22 | Camera sau của máy
Với cấu hình và các tính năng kể trên Lenovo Tab M8 là chiếc máy hoàn toàn phù hợp với với những gia đình có các con em nhỏ, đang cần một chiếc máy tính bảng đáp ứng tốt nhu cầu học tập, giải trí, xem video hằng ngày.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2048, N'Máy tính bảng Nokia Tab T20 4G', 10, 4990000, 20, N'nokia-t20-2-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Máy tính bảng Nokia đánh dấu sự trở lại của hãng trên thị trường tablet sau nhiều năm vắng bóng bằng việc ra mắt Nokia Tab T20 máy có thiết kế kim loại sang trọng, hiệu năng ổn định cùng màn hình hiển thị sắc nét, mang đến một lựa chọn không thể bỏ qua trong phân khúc.
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
Camera trước 5 MP - Nokia Tab T20
Hiển thị chi tiết với màn hình lớn
Máy sử dụng tấm nền IPS LCD với kích thước đến 10.4 inch mang đến hình ảnh được hiển thị khá chính xác về màu sắc cũng như không gian sử dụng rộng lớn giúp các trải nghiệm chơi game, xem phim đã mắt hay hiển thị các nội dung tài liệu một cách đầy đủ hơn.
Với tỉ lệ màn hình 5:3 cùng độ phân giải 1200 x 2000 Pixels mang đến hình ảnh với độ chi tiết cao, điều mà rất ít sản phẩm trong cùng phân khúc giá có thể làm được.
Hiển thị chi tiết với màn hình 2K - NokiaTab T20
Độ dày cạnh viền được tối ưu chưa thực sự tốt trên máy khi kích thước vẫn còn khá lớn, tuy nhiên trên một sản phẩm có màn hình lớn như vậy thì cho tổng thể nhìn cũng khá là cân đối.
Cạnh viền tối ưu chưa thực sự tốt - Nokia Tab T20
Hiệu năng ổn định
Trang bị trên máy là con chip khá lạ trên thị trường có tên Unisoc T610 8 nhân với hiệu suất tối đa 1.8 GHz được đánh giá hiệu năng xử lý tương đương với Qualcomm Snapdragon 665, mang đến trải nghiệm ổn định cùng tốc độ phản hồi tốt.
Đối với các tác vụ chơi game, máy vẫn đáp ứng khả năng chơi được với mức cấu hình trung bình trên các tựa game phổ biến như Liên Quân Mobile, PUBG Mobile.
Chơi tốt các tựa game phổ thông hiện nay - Nokia Tab T20
Máy tính bảng có 4 GB RAM mang đến trải nghiệm đa nhiệm khá ổn, cùng với đó là 64 GB bộ nhớ trong đáp ứng nhu cầu lưu trữ vừa đủ cho người dùng phổ thông. Ngoài ra người dùng có thể nâng cấp không gian lưu trữ khi máy hỗ trợ trang bị thẻ Micro SD lên đến 512 GB.
Máy sở hữu 4 GB RAM và 64 GB bộ nhớ trong - Nokia Tab T20
Nokia Tab T20 hoạt động dựa trên hệ điều hành Android 11 thuần Google mang đến người dùng cảm giác sử dụng thân quen với các biểu tượng cũng như cách sử dụng gần gũi, cùng với đó là đầy đủ tính năng mới mẻ mà hệ điều hành này mang lại.
Sử dụng hệ điều hành Android 11 - Nokia Tab T20
Máy hỗ trợ trang bị 1 sim hỗ trợ 4G và không hỗ trợ nghe gọi, chỉ đáp ứng cho các nhu cầu kết nối internet mạng di động.
Máy hỗ trợ 1 sim 4G - Nokia Tab T20
Thời lượng sử dụng pin lâu dài 
Với viên pin trang bị có dung lượng 8200 mAh đáp ứng lướt web liên tục trong 15 giờ, video call liên tục 7 giờ hoặc xem phim liên tục 10 tiếng (phụ thuộc vào độ sáng màn hình và kết nối mạng), cực kỳ phù hợp cho những ai muốn sở hữu cho mình một thiết bị phục vụ giải trí trong khoảng thời gian dài hay đáp ứng tác vụ học tập online cả ngày cho con em.

Máy hỗ trợ công nghệ sạc tối đa 15 W thông qua cổng kết nối Type-C nhằm rút ngắn thời gian sạc cho người dùng, khá đáng tiếc khi Nokia chỉ cung cấp sạc 10 W đi kèm với máy.
Hỗ trợ sạc nhanh 15 W - Nokia Tab T20
Qua các thông tin nổi bật được nêu trên, thì đây thực sự là một sản phẩm lý tưởng dành cho học sinh, sinh viên nhằm hỗ trợ việc học tập online một cách hiệu quả với giá thành trang bị sản phẩm rất tốt, nếu bạn muốn chọn mua cho mình một sản phẩm đáp ứng nhu cầu giải trí cả ngày mà không cần cắm sạc, thì đây thực sự là một lựa chọn không thể bỏ qua.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2049, N'Máy tính bảng Samsung Galaxy Tab S7 FE WiFi', 5, 12990000, 0, N'samsung-galaxy-tab-s7-fe-wifi-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Samsung Galaxy Tab S7 FE WiFi - được Samsung cho ra mắt với vô vàn tính năng cùng nhiều ưu điểm nổi bật so hơn với các đối thủ trong tầm giá, tablet hỗ trợ bút S Pen nhằm phục vụ các công việc của bạn trở nên dễ dàng hay hiệu suất mạnh mẽ trên một con chip gaming đến từ nhà Qualcomm, khiến nó trở thành một sự lựa chọn không thể bỏ qua đối với người dùng.
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
Samsung Galaxy Tab S7 FE WiFi
Thỏa sức sáng tạo với bút S Pen
Bút S Pen được trang bị kèm theo máy với độ trễ thấp cùng đầu bút mềm giúp mang lại cảm giác trải nghiệm viết tự nhiên hơn hay biến chữ viết tay thành văn bản và cho phép bạn chỉnh sửa văn bản bằng những cử chỉ đơn giản một cách dễ dàng.
Samsung Galaxy Tab S7 FE WiFi
Với công nghệ sạc từ tính thông minh bằng cách đặt bút phía dưới cụm camera sau, khi máy trang bị nam châm từ tính ở phần mặt lưng máy tính bảng giúp người dùng dễ dàng sạc dù ở bất kì đâu hay cố định bút một cách chắc chắn trong những lúc di chuyển.
Bút S Pen cùng màn hình lớn 12.4 inch giúp bạn thỏa sức sáng tạo nội dung đối với những ai thực thực hiện các công việc đồ họa trên thiết bị máy tính bảng.
Samsung Galaxy Tab S7 FE WiFi
Kết hợp cùng DeX giúp bạn thỏa sức tận hưởng trải nghiệm chuẩn máy tính chỉ với một chạm mang đến trải nghiệm như đang sử dụng trên một thiết bị laptop mỏng nhẹ.
Samsung Galaxy Tab S7 FE WiFi
Trải nghiệm âm thanh tốt hơn
Trải nghiệm điện ảnh được nâng cao với âm thanh chân thực nhờ âm thanh AKG, loa kép và Dolby Atmos tạo ra âm thanh vòm sống động, chân thực giúp bạn đắm chìm trong những nội dung hiển thị trên màn hình.
Samsung Galaxy Tab S7 FE WiFi
Nhờ công nghệ này giúp cho người dùng trải nghiệm tốt hơn trên các tựa game bắn súng hành động, khi cảm nhận âm thanh một cách chân thực nhằm dễ dàng xác định các mục tiêu xung quanh.
Samsung Galaxy Tab S7 FE WiFi
Hiệu năng mạnh mẽ 
Trang bị trên máy tính bảng Samsung là một con chip gaming có tên Snapdragon 778G với hiệu suất tối đa đạt được ở mức 2.4 GHz, giúp bạn trải nghiệm tốt hơn trên các tác vụ đồ họa hay chơi game nhờ công nghệ Snapdragon Elite Gaming.
Samsung Galaxy Tab S7 FE WiFi
Máy tính bảng có RAM 4 GB, mang đến trải nghiệm đa nhiệm một cách tốt hơn cho thiết bị cùng với bộ nhớ trong 64 GB đáp ứng nhu cầu lưu trữ vừa đủ cho các dữ liệu quan trọng. Ngoài ra hãng còn cho phép người dùng trang bị thẻ micro SD lên đến 1 TB để nâng cấp bộ nhớ trong trên máy.
Samsung Galaxy Tab S7 FE WiFi
Thời gian sử dụng lâu dài 
Trang bị viên pin cực khủng lên đến 10.090 mAh giúp bạn có thể sử dụng trong 13 giờ cho các tác vụ xem video. Thiết bị hỗ trợ sạc siêu nhanh tối đa 45 W, bạn có thể sạc đầy nhanh chóng - khoảng 90 phút (sạc kèm theo máy có công suất 15 W).
Samsung Galaxy Tab S7 FE WiFi
Với hiệu năng mạnh mẽ được trang bị hay kiểu dáng thiết thiết vô cùng sang trọng trên Samsung Galaxy Tab S7 FE WiFi, khiến đây thực sự là một lựa chọn không thể bỏ qua trong phân khúc Tablet tầm trung cận cao cấp, ngoài ra hỗ trợ bút S Pen giúp cho những ai thường xuyên thực hiện các công việc chuẩn bị nội dung đồ họa trong một khoảng thời gian dài với viên pin khủng 10.090 mAh.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2050, N'Máy tính bảng Huawei MatePad T10', 5, 4990000, 10, N'huawei-matepad-t10-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Huawei MatePad T10 là một chiếc máy tính bảng có hiệu năng mạnh mẽ, màn hình lớn, đa năng với các tính năng bảo vệ người dùng, một lựa chọn thú vị với những người muốn tìm kiếm một chiếc máy tính bảng giá mềm dành cho gia đình.
Sản phẩm chạy hệ điều hành Android trên nền tảng Huawei Mobile Service (HMS):
- Tải ứng dụng trên cửa hàng Huawei AppGallery thay cho CH Play.
- Ngoài ra, khách hàng có thể tìm ứng dụng bằng Petal Search nếu các ứng dụng không có sẵn trên Huawei AppGallery.
- Không cài đặt sẵn các ứng dụng / game sử dụng dịch vụ, tài khoản Google như: Google Maps, Google Drive, Gmail,...
- Hướng dẫn cài đặt ứng dụng cho thiết bị Huawei.
Thiết kế nguyên khối, mức độ hoàn thiện cao
Máy tính bảng Huawei có thiết kế nguyên khối với mặt lưng có màu đơn sắc giúp máy có phần đơn giản nhưng vẫn toát lên vẻ sang trọng và lịch lãm. 
Máy tính bảng Huawei MatePad T10 | Thiết kế nguyên khối, mức độ hoàn thiện cao
Mức độ hoàn thiện máy khá tốt, cho cảm nhận cứng cáp, các chi tiết ghép nối được gắn kết với nhau một cách chính xác, dường như không có khe hở gây mất thẩm mỹ cho máy.
Máy tính bảng Huawei MatePad T10 | Thiết kế gọn nhẹ dễ dàng mang đi bất cứ đâu
Tổng trọng lượng của máy chỉ nặng 450 g, kết hợp với phần thân máy bo tròn gọn nhẹ giúp bạn có thể cầm trên tay thoải mái hay mang đi ở bất cứ đâu bạn muốn.
Màn hình giải trí sắc nét, nhiều tính năng bảo vệ người dùng
Huawei sử dụng màn hình IPS LCD kích thước lớn 9.7 inch với độ phân giải HD cho Huawei MatePad T10. Trải nghiệm thực tế màn hình này cho chất lượng hiển thị hình ảnh tốt, màu sắc trung tính, góc nhìn rộng và độ sáng tương đối đáp ứng tốt nhu cầu sử dụng hằng ngày.
Máy tính bảng Huawei MatePad T10 | Màn hình giải trí sắc nét
Màn hình của máy được trang bị chế độ bảo vệ mắt Eye Comfort được TÜV Rheinland chứng nhận để giảm ánh sáng xanh có hại, mang lại sự thoải mái cho mắt tốt hơn khi bạn dùng trong nhiều giờ liền.
Máy tính bảng Huawei MatePad T10 | Tính năng đọc sách
Bên cạnh đó, máy còn được hỗ trợ chế độ eBook cho bạn trải nghiệm tương tự việc đọc sách giấy, cùng chế độ Dark Mode giúp dùng vào ban đêm sẽ dễ chịu hơn.
Máy tính bảng Huawei MatePad T10 | Chế độ Dark Mode
Hệ thống loa kép của máy tính bảng Huawei MatePad T10 mang đến âm thanh đối xứng từ cả hai phía, hỗ trợ bởi công nghệ HUAWEI Histen 6.1 cho chất âm cao rõ nét, âm trung tinh tế, trầm ấm mạnh mẽ cho bạn tận tượng các bộ phim hay nghe sạc đầy sống động, chân thật.
Máy tính bảng Huawei MatePad T10 | Hệ thống loa kép thông minh
Hiệu năng tốt tích hợp nhiều tính năng thông minh
Huawei MatePad T10 được trang bị chipset Kirin 710A,đồng thời máy tính bảng có RAM 2 GB và bộ nhớ trong 32 GB hỗ trợ khe cắm thẻ nhớ với dung lượng lớn 512 GB cho bạn thoải mái lưu trữ. 
Máy tính bảng Huawei MatePad T10 | Hiệu năng tốt đến từ chipset Kirin 710A
Bộ cấu hình này có thể xử lý ổn các tác vụ cơ bản như sử dụng YouTube, lướt web hay chơi mượt mà một số game nhẹ nhàng.
Máy tính bảng Huawei MatePad T10 | Hiệu năng tốt, hỗ trợ nhiều tính năng thông minh
Máy hỗ trợ kết nối 4G, bluetooth 4.2 nên người dùng có thể sử dụng máy tính bảng này để nghe gọi và nhắn tin như smartphone thực thụ.
Máy tính bảng Huawei MatePad T10 | Giao diện EMIU 10.1
Máy chạy EMUI 10.1 xây dựng trên nền tảng Android, tuy nhiên, không hỗ trợ Google Service. Người dùng không cài được ứng dụng trên Google Play mà phải thông qua App Gallery của Huawei.
Ngoài ra, máy có thêm tính năng Kids Corner cho phép phụ huynh kiểm soát nội dung, giới hạn thời gian trẻ được sử dụng các tính năng các ứng dụng và dịch vụ phù hợp với độ tuổi của con em mình.
Máy tính bảng Huawei MatePad T10 | Tính năng Kids Corner
Khả năng nhiếp ảnh tốt cùng thời lượng pin thoải mái cả ngày
Về chức năng chụp ảnh, máy có camera trước 2 MP và camera 5 MP ở phía sau phục vụ tốt cho các nhu cầu học online và gọi điện video ở chất lượng tốt. 
Máy tính bảng Huawei MatePad T10 | Trang bị camera trước 2 MP, camera sau 5 MP
Trong khi đó, camera sau 5 MP của máy còn hỗ trợ lấy nét tự động giúp người dùng có thể ghi lại những khoảnh khắc hằng ngày với chất lượng ảnh ở mức chấp nhận được.
Máy tính bảng Huawei MatePad T10 | Pin thoải mái sử dụng cả ngày
Về pin, Huawei MatePad T10 có dung lượng 5.100 mAh, không quá lớn nhưng vẫn đáp ứng tốt cho nhu cầu sử dụng với nhiều tác vụ khác nhau, cho bạn trải nghiệm một ngày dài bất tận.
Nhìn chung, Huawei MatePad T10 là máy tính bảng có thiết kế gọn gàng và được hoàn thiện chỉn chu, hiệu năng tốt, thời lượng pin ấn tượng và giá mềm phải chằng, hỗ trợ đầy đủ các tính năng cho mọi gia đình.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2051, N'Máy tính bảng Samsung Galaxy Tab S8 5G', 2, 20990000, 10, N'samsung-galaxy-tab-s8-white-thumb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Samsung Galaxy Tab S8 ra mắt và vẫn giữ được đặc trưng của dòng máy tính bảng Galaxy Tab S với cấu hình mạnh mẽ, màn hình hiển thị ổn cùng khả năng hỗ trợ bút S Pen hỗ trợ học tập làm việc tốt hơn.
Thiết kế đặc trưng Galaxy Tab S
Xét về mặt ngoại hình thì máy tính bảng Samsung Galaxy Tab S8 thừa hưởng những thiết kế nổi bật của Tab S7, về tổng thể thì Tab S8 là phiên bản nâng cấp phần cứng bên trong so với Tab S7.
Thiết kế đặc trưng - Samsung Galaxy Tab S8
Toàn bộ phần thân máy vẫn được làm từ kim loại nguyên khối sang trọng, đi cùng với viền màn hình mỏng, đem lại cảm giác hiện đại cũng như rộng rãi trong quá trình sử dụng.
Galaxy Tab S8 cũng được trang bị bút S Pen cải tiến mới, có độ nhạy 6.2 ms cho cảm giác giống như đang viết trên giấy.
Hỗ trợ bút S Pen - Samsung Galaxy Tab S8
Mạnh mẽ với chip Snapdragon
Tab S8 sử dụng CPU Snapdragon 8 Gen 1 mới, mang lại hiệu năng cực kỳ ổn định và vấn đề nhiệt độ đã được giải quyết và được kiểm soát hơn vì kích thước máy tính bảng khá lớn khi so với điện thoại, giúp khả năng tản nhiệt được tốt hơn.
Máy tính bảng có RAM 8 GB nên mọi tác vụ của bạn sẽ được khởi chạy mượt mà, đa nhiệm tốt hơn. Bộ nhớ trong 128 GB có hỗ trợ mở rộng qua thẻ Micro SD.
Hiệu năng mạnh mẽ - Samsung Galaxy Tab S8
Snapdragon 8 Gen 1 còn hỗ trợ kết nối 5G tiên tiến bật nhất hiện nay, cho mọi trải nghiệm tải lên, xuống của bạn trên không gian mạng được trơn tru nhất.
Với hệ điều hành Android 12 bạn có thể có chọn kích thước, vị trí và số lượng cửa sổ bật lên để bạn thực hiện nhiều tác vụ cùng 1 lúc, đa nhiệm tốt hơn.
Cùng với đó là giao diện Samsung Dex cải tiến cho phép bạn làm việc với Galaxy Tab S8 như với một chiếc máy tính thực thụ.
Khả năng quay, chụp tốt
Máy tính bảng có cụm 2 camera với camera chính 13 MP và camera phụ 6 MP, hỗ trợ quay video độ phân giải 4K. Camera trước góc siêu rộng 12 MP với tính năng Auto Framing luôn đặt bạn vào trung tâm khung hình trong mọi tình huống.
Camera Samsung Galaxy Tab S8
Thêm không gian hiển thị
Galaxy Tab S8 có màn hình 11 inch, độ phân giải đến 2K cho bạn trải nghiệm cực mãn nhãn, cùng với tần số quét 120 Hz mọi chuyển động trên màn hình đều trở nên mượt mà.
Màu sắc được hiển thị trên màn hình một cách tươi sáng, hình ảnh rõ nét mang lại trải nghiệm tuyệt vời về phần nhìn.
Màn hình hiển thị tốt - Samsung Galaxy Tab S8
Pin dung lượng lớn, công suất sạc được nâng cấp
Ngoài việc được trang bị một con chip khủng, màn hình có tần số quét cao Samsung đã trang bị trên chiếc máy tính bảng thế hệ mới viên pin có dung lượng lên đến 8000 mAh, cùng với đó là công nghệ sạc nhanh 45 W.
Bạn có thể yên tâm sử dụng Tab S8 cho các nhu cầu học hành, làm việc, giải trí suốt cả một ngày dài và sạc đầy pin một cách nhanh chóng với công nghệ sạc nhanh. 
Nếu bạn đang cần một chiếc tablet có một thiết kế tinh tế, nhỏ gọn, thường xuyên di chuyển và mang máy tính bảng bên mình để học tập và làm việc thì chắc chắn Galaxy Tab S8 sẽ là một lựa chọn phù hợp.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2052, N'Máy tính bảng Samsung Galaxy Tab A7 Lite', 5, 3990000, 20, N'samsung-galaxy-tab-a7-lite-gray-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Máy tính bảng Samsung Galaxy Tab A7 Lite là phiên bản rút gọn của dòng tablet "ăn khách" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền.
Thiết kế siêu mỏng nhẹ
Galaxy Tab A7 Lite sở hữu kiểu thiết kế đặc trưng của dòng Galaxy Tab A7. Thiết bị sử dụng chất liệu nhôm với thiết kế nguyên khối giúp cho máy trở nên cao cấp hơn dù chỉ thuộc phân khúc tầm trung giá rẻ.
Galaxy Tab A7 Lite | Thiết kế mặt lưng
Tuy được hoàn thiện từ nhôm nguyên khối, nhưng Galaxy Tab A7 Lite vẫn có độ mỏng nhẹ ấn tượng khi chỉ nặng 371 g và dày chỉ 8 mm, mang đến sự thoải mái khi cầm sử dụng trong thời gian dài.
Galaxy Tab A7 Lite | Thiết kế cạnh viền
Với kích thước chỉ tương đương với một quyển sổ nên Galaxy Tab A7 Lite sẽ vô cùng gọn gàng để bạn có thể mang theo khi cần thiết.
Galaxy Tab A7 Lite | Thiết kế gọn ràng, cầm nắm thoải mái
Màn hình lớn hiển thị nhiều hơn, rõ hơn
Máy tính bảng Galaxy Tab A7 Lite có màn hình kích thước 8.7 inch, độ phân giải cao 800 x 1340 pixel, cho chất lượng hiển thị khá, màu sắc tươi tắn, màn hình lớn sẽ giúp bạn xem được nhiều nội dung hơn, thoải mái kéo thả, chỉnh sửa hình ảnh, văn bản dễ dàng.
Galaxy Tab A7 Lite | Trang bị màn hình kích thước lớn 8.7 inch
Phần viền 2 bên cũng được Samsung làm mỏng tối đa giúp cho khung hình được trải rộng hơn, tăng trải nghiệm khi xem phim hay thưởng thức các chương trình giải trí.
Hiệu năng ổn định cho nhu cầu giải trí cơ bản
Trang bị vi xử lý MediaTek MT8768T 8 nhân xung nhịp tối đa 2.3 GHz, Galaxy Tab A7 Lite có hiệu năng ổn định, đáp ứng cho nhu cầu giải trí khác nhau như chơi game nhẹ nhàng, kiểm tra email, tin nhắn hay đọc báo cập nhật tin tức.
Galaxy Tab A7 Lite | Trang bị con chip Helio P22T đến từ MediaTek
Máy tính bảng có RAM 3 GB và bộ nhớ trong 32 GB là những thông số khá vừa vặn trong tầm giá, vẫn đủ cho đa nhiệm và nhu cầu lưu trữ ở mức độ cơ bản. Bên cạnh đó, máy hỗ trợ khe cắm thẻ nhớ lên đến 1 TB giúp tăng thêm không gian để lưu trữ những bài hát hay bộ phim yêu thích của bạn.
Galaxy Tab A7 Lite | RAM 3 GB, ROM 32 GB hỗ trợ thẻ nhớ mở rộng lên đến 1 TB
Galaxy Tab A7 Lite trang bị viên pin 5100 mAh giúp máy có thể hoạt động liên tục trong nhiều giờ liền với các tác vụ thông thường. 
Không chỉ vậy, máy cũng hỗ trợ sạc lên đến 15 W giúp pin được nạp đầy nhanh chóng. Tuy nhiên, sạc đi kèm máy chỉ 7.75 W nên bạn cần mua riêng phụ kiện tương thích nếu muốn sạc nhanh hơn.
Galaxy Tab A7 Lite | Hỗ trợ sạc nhanh 15 W
Galaxy Tab A7 Lite hỗ trợ đầy đủ các kết nối mạng thông dụng như Wi-Fi, mạng 4G với tốc độ truy cập nhanh và ổn định. Bạn cũng có thể lắp được sim nghe gọi, cho phép Galaxy Tab A7 Lite có thể nhận và thực hiện được cuộc gọi như điện thoại thông thường.
Thưởng thức chất âm sống động từ loa stereo
Đắm chìm trong thế giới giải trí với loa stereo công nghệ Dolby Atmos mang đến chất âm lớn và sống động, cho bạn trải nghiệm nghe nhạc hay xem phim sẽ càng hoàn hảo và chân thật hơn bao giờ hết.
Galaxy Tab A7 Lite | Đắm chìm trong thế giới giải trí với loa stereo công nghệ Dolby Atmos
Máy cũng trang bị camera sau 8 MP quay được video Full HD và camera trước 2 MP hỗ trợ gọi video call cũng như ghi lại những tấm ảnh chụp thường ngày của gia đình và cuộc sống xung quanh bạn.
Galaxy Tab A7 Lite | Camera sau 8 MP
OneUI 3.1 thông minh, mượt mà dễ sử dụng
Galaxy Tab A7 Lite sử dụng giao diện OneUI 3.1 hoàn toàn mới được tối ưu, với các thao tác sử dụng vô cùng thân thiện đơn giản và không chứa ứng dụng rác gây nặng máy, đảm bảo cho bạn có một trải nghiệm tốt nhất.
Với mức giá phải chăng, cấu hình ổn, màn hình lớn nhưng vẫn nhỏ gọn, Galaxy Tab A7 Lite sẽ là một trong những sản phẩm phù hợp với mọi người đáp ứng tốt nhu cầu học tập cũng như cho nhu cầu giải trí hằng ngày.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2054, N'Máy tính bảng iPad Pro M1 11 inch', 10, 41990000, 40, N'pad-pro-m1-11-inch-wifi-cellular.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Trải nghiệm khung hình sống động cùng cảm giác chạm vuốt cực mượt
Máy tính bảng iPad Pro M1 11 inch WiFi Cellular 1TB (2021) thiết kế hình hộp vát cạnh vuông vức, hiện đại với thân máy bằng kim loại chắc chắn, hoàn thiện tỉ mỉ và sang trọng, trọng lượng nhẹ, kích cỡ hợp lý thuận tiện sử dụng và mang theo.
Màn hình 11 inch sử dụng tấm nền Liquid Retina cho khung hình iPad hiển thị rực rỡ, sống động, chân thực, độ phân giải đạt 1668 x 2388 Pixels hiển thị chi tiết sắc nét, kết hợp cạnh viền mỏng cho không gian trải nghiệm màn hình thật đã mắt.
Màn hình cao cấp - iPad Pro M1 11 inch WiFi Cellular 1TB (2021)
Công nghệ ProMotion hỗ trợ tần số quét tối đa 120 Hz cho cảm giác chạm vuốt cực mượt, các chi tiết chuyển động trên màn hình liền mạch, trơn tru, nhờ đó trải nghiệm được tối ưu, đặc biệt khi sử dụng màn hình cho tác vụ đồ họa hay cho các tựa game hành động, không bỏ lỡ cơ hội ghi điểm.
Chinh phục mọi tác vụ với sức mạnh từ chip M1
Sức mạnh hiệu năng trên iPad Pro M1 đạt được nhờ sự cộng hưởng của chip Apple M1 8 nhân mạnh mẽ và chip đồ họa Apple GPU và RAM 16 GB. Hiệu quả đa nhiệm mượt mà, duy trì sự ổn định của máy cả khi sử dụng trên các tác vụ nặng như đồ họa, chơi game trực tuyến,… Đồng thời, với bộ nhớ trong đến 1 TB, thật thoải mái để lưu trữ tất cả tài liệu và kho ảnh chụp, video yêu thích lên thiết bị cá nhân này.
Sức mạnh ấn tượng - iPad Pro M1 11 inch WiFi Cellular 1TB (2021)
Máy hỗ trợ 5G cho tốc độ kết nối cực nhanh để bạn có thể tải dữ liệu, xem video, thực hiện các tác vụ trực tuyến mượt mà.
Thỏa sức sáng tạo cùng cụm camera xịn sò
iPad Pro trang bị bộ đôi camera gồm camera góc rộng 12 MP và camera siêu rộng 10 MP cùng với khả năng xử lý mạnh mẽ từ chip M1 giúp mang đến bức ảnh chụp và video hoàn hảo, không thua kém nhiều so với sử dụng smartphone.
Camera TrueDepth 12 MP ở mặt trước hỗ trợ góc nhìn siêu rộng 122 độ FaceTime cực tốt, kèm với tính năng Center Stage tự động nhận diện, căn góc để giúp cho chủ thể luôn ở giữa khung hình.
Camera xịn sò - iPad Pro M1 11 inch WiFi Cellular 1TB (2021)
Ngoài ra, Apple hỗ trợ tính năng mở khóa bằng khuôn mặt Face ID cũng gia tăng tiện ích và khả năng bảo mật cho iPad của bạn.
Với nhu cầu dùng máy tính bảng ở tần suất cao, bạn sẽ khá yên tâm nhờ dung lượng pin của phiên bản iPad này đạt 28.65 Wh tương đương khoảng 7538 mAh, được sự tối ưu của chip M1 mang đến 10 giờ sử dụng liên tục cho nhu cầu lướt web hoặc xem video. Công nghệ sạc pin nhanh 20 W sẽ nhanh chóng phục hồi năng lượng pin cho thiết bị trong tình huống cạn nguồn.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2055, N'Máy tính bảng iPad Pro M2 12.9 inch', 10, 35990000, 30, N'ipad-pro-m2-129-wifi-cellular-128gb-231022.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Apple đang ngày càng bỏ xa nhiều đối thủ về mặt hiệu năng trên các dòng tablet, điều này được minh chứng cụ thể bằng sự xuất hiện của con chip Apple M2 siêu mạnh mẽ trên iPad Pro M2 12.9 inch WiFi Cellular 128GB. Bên cạnh đó thì máy còn có những nâng cấp như hệ điều hành iPadOS 16, viên pin 40.88 Wh.
Tinh tế trên từng đường nét thiết kế
Về ngoại hình của iPad Pro M2 sẽ có nét tương đồng với thế hệ trước khi thừa hưởng gần như toàn bộ vẻ đẹp vốn đã rất tốt và không cần phải nâng cấp gì thêm cả, vẫn là mặt lưng phẳng và các cạnh được vát phẳng tinh tế cùng 4 góc máy bo cong. Đi kèm với đó là bộ khung và cả phần mặt sau đều được làm từ kim loại bền bỉ.
Thiết kế sang trọng - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Các phím bấm nguồn và tăng/giảm âm lượng sẽ được đặt ở vị trí gần cụm camera, vậy nên người dùng có thể thuận tiện hơn trong việc ấn phím nhằm hạn chế tình trạng với tay mỗi khi thao tác.
Nổi bật nhất trên phần mặt lưng sẽ là logo hình quả táo sáng bóng được Apple bố trí ngay trung tâm, đây có thể coi là đặc điểm nhận diện dễ dàng giúp người dùng có thể tăng thêm phần đẳng cấp mỗi khi sử dụng máy tính bảng iPad Pro M2.
Sức mạnh đáng kinh ngạc đến từ thế hệ chip mới
Đúng như dự đoán từ trước trên nhiều diễn đàn công nghệ thì Apple M2 sẽ xuất hiện ở thế hệ máy tính bảng iPad mới nhất của hãng trong năm 2022, thiết bị này làm người dùng cực kỳ thỏa mãn khi chờ đợi mua iPad Pro M2.
Thế hệ chip mới này khi được trang bị trên iPad Pro M2 sẽ có 8 lõi CPU và 10 lõi GPU, điều này giúp tăng cường hiệu suất thêm 15% và 35% về tác vụ xử lý đồ họa khi so với Apple M1. 
Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Với hiệu năng xử lý hết sức mạnh mẽ nên máy tính bảng hoàn toàn có thể đáp ứng tốt trong việc sử dụng để kết xuất video, thiết kế kiến trúc - đồ họa hay thậm chí là dựng các mô hình 3D ngay trên thiết bị.
Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Chưa dừng lại ở đó, hiệu suất cao còn có thể giúp cho iPad Pro M2 có khả năng xử lý đồng thời nhiều tác vụ, xuất ra màn hình phụ khác để sử dụng song song cũng mượt mà và ổn định hơn. Như hãng có đề cập đến thì hiệu năng của iPad Pro M2 có thể hỗ trợ một màn hình bên ngoài với độ phân giải lên đến 6K ở 60 Hz.
Hiệu năng mạnh mẽ - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Máy tính bảng sẽ có RAM 8 GB đi cùng với hệ điều hành iPadOS 16 mới nhất (10/2022), điều này mang đến cho máy khả năng xử lý tác vụ đa nhiệm mạnh mẽ để tối ưu hóa công việc của bạn được tốt hơn. Ngoài ra, RAM lớn còn giúp cho người dùng có thể sử dụng đồng thời nhiều ứng dụng cùng lúc được ổn định thông qua tính năng Stage Manager có trên iPadOS 16.
Sử dụng nhiều app cùng lúc - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Điểm đặc biệt trên phiên bản WiFi Cellular đó chính là khả năng kết nối mạng di động, iPad Pro M2 có thể coi là chiếc máy tính bảng hỗ trợ 5G tiên tiến giúp cho người dùng có thể thuận tiện hơn trong việc duy trì kết nối với internet.
Nâng cao khả năng quay - chụp 
Máy tính bảng được trang bị hai camera sau với cảm biến chính 12 MP đi cùng với camera góc siêu rộng 10 MP, bên cạnh đó thì iPad Pro M2 có khả năng quay video với chuẩn lên tới 4K ở tốc độ khung hình 60 FPS.
Tăng cường khả năng quay chụp - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Ở mặt trước của máy sẽ là camera TrueDepth 12 MP đi kèm với chế độ mở khóa khuôn mặt Face ID, được hỗ trợ khả năng thu phóng khung hình nhằm giúp chủ thể có thể xuất hiện ở vị trí gần trung tâm nhất có thể, từ đó mang lại những thước phim tự quay chất lượng hay video call với bạn bè được tốt hơn.
Màn hình hiển thị sống động 
iPad Pro M2 có màn hình kích thước lớn 12.9 inch và đi kèm độ phân giải 2048 x 2732 Pixels. Máy sẽ được sử dụng công nghệ màn hình độc quyền đến từ nhà Apple với tên gọi Liquid Retina XDR mini-LED LCD, ảnh cho ra sẽ có độ sáng tương đối cao nhưng vẫn đáp ứng được tiêu chí tiết kiệm điện năng sử dụng.
Màn hình chất lượng - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Apple khá là tinh tế khi quan tâm đến từng chi tiết nhỏ của người dùng thông qua việc hãng đã trang bị lớp phủ oleophobic chống bám vân tay lên trên màn hình, đây quả thực là một điều rất cần thiết bởi nó giúp tối ưu được thời gian cho người dùng mà không cần vệ sinh quá nhiều lần trong ngày.
Với người dùng làm các công việc trong lĩnh vực thiết kế - in ấn thì iPad Pro M2 chắc hẳn sẽ là trợ thủ đắc lực bởi máy có độ chính xác về màu cao nên đây có thể là thiết bị dùng để tham chiếu hình ảnh trước khi in ấn. Các công nghệ nổi bật giúp cho thông tin này thêm phần uy tín mà hãng có công bố như sau: True Tone, dải màu rộng P3 và tỷ lệ tương phản 1.000.000:1.
Độ chính xác màu sắc cao - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Năm nay hãng tối ưu phần màn hình với tần số quét có được là 120 Hz, đi cùng đó là khả năng nhận diện bút Apple Pencil 2 ở khoảng cách 12 mm giúp cho quá trình sử dụng các tác vụ vẽ vời hay vuốt chạm cơ bản trở nên mượt mà hơn.
Tương thích với Apple Pencil 2 - iPad Pro M2 12.9 inch WiFi Cellular 128GB
iPad Pro M2 được tích hợp viên pin lớn có dung lượng 40.88 Wh (xấp xỉ 10.835 mAh), Apple cho biết thiết bị có thể đáp ứng cho người dùng khoảng 10 giờ xem video liên tục ở chế độ wifi và 9 giờ bằng dữ liệu mạng di động. Với thời gian lâu như vậy nên người dùng hoàn toàn có thể an tâm trong việc sử dụng thiết bị cho cả một ngày dài làm việc.
Sử dụng dài lâu - iPad Pro M2 12.9 inch WiFi Cellular 128GB
Có thể thấy iPad Pro M2 đã phá vỡ được giới hạn của một chiếc tablet thông thường khi sở hữu cấu hình cực kỳ mạnh mẽ và màn hình kích thước lớn, vì vậy người dùng hoàn toàn có thể biến máy tính bảng hoạt động với chức năng gần như tương đồng với laptop thông qua Magic Keyboard để bạn có thể xử lý công việc một cách tối ưu hơn.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2056, N'Máy tính bảng iPad Pro M1 12.9 inch', 5, 29290000, 40, N'ipad-pro-2021-129-inch-gray-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Bạn có đang mong chờ những sản phẩm chất lượng đến từ Apple? Sau hàng loạt các sản phẩm đình đám như iPhone 12 series thì hãng đã tung ra chiếc iPad Pro M1 12.9 inch Wifi Cellular 128GB (2021) trang bị những tính năng ngày càng vượt trội và thời thượng.
Màn hình Liquid Retina XDR 12.9 inch rực rỡ
iPad Pro M1 12.9 inch 2021 sở hữu màn hình Liquid Retina XDR mini-LED LCD, áp dụng công nghệ mini-LED với 10.000 bóng được tuỳ chỉnh nhỏ hơn 120 lần so với thế hệ trước nên độ sáng có thể lên đến 1600 nits ngay cả ngoài trời vẫn có thể sử dụng tốt.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Sở hữu màn hình Liquid Retina XDR, áp dụng công nghệ mini-LED
Màn hình có kích thước 12.9 inch cung cấp chế độ xem mở rộng hơn, trải nghiệm HDR tuyệt đẹp trên màn hình rõ ràng giúp cho mọi hoạt động, thao tác trên máy thêm cuốn hút và đắm chìm theo thời gian.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Màn hình có kích thước 12.9 inch cùng trải nghiệm HDR tuyệt đẹp
Mọi chi tiết hiển thị trên màn hình sống động như thật với tỷ lệ tương phản 1.000.000: 1 cùng các công nghệ tiên tiến như P3 wide color, True Tone và ProMotion giúp iPad Pro 12.9 inch 2021 tỏa sáng ngoạn mục.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Màn hình trang bị nhiều công nghệ tiên tiến
Tận hưởng iPad Pro 12.9 inch 2021 128GB như một chiếc laptop với sự hỗ trợ của các phụ kiện chuyên nghiệp như bàn phím, bút Apple Pencil hay các bộ điều khiển chơi game hiện đại,... Những phụ kiện đa năng này được thiết kế để đưa công việc, sự sáng tạo và những giờ phút giải trí của bạn lên một tầm cao mới.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Hỗ trợ của các phụ kiện bàn phím, bút Apple Pencil
Lưu ý: Các phụ kiện như bàn phím, bút Apple Pencil sẽ không đi kèm trong hộp máy.
Cấu hình mang tính đột phá
Apple M1 là con chip mang sức mạnh phi thường trên iPad, nó được thiết kế để tận dụng tối đa hiệu suất và điện năng cho hiệu quả sử dụng đáng kinh ngạc. CPU và GPU 8 lõi trên M1 đã giúp cho iPad Pro 12.9 inch 2021 có một hiệu suất xử lý dữ liệu, xử lý đồ họa lần lượt là 50% và 40% nhanh hơn so với thế hệ trước.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Cấu hình mang tính đột phá với chip Apple M1
Giờ đây, người dùng có thể chạy các phần mềm nặng, chơi game đồ họa ở tốc độ khung hình cao,... với độ mượt mà, nâng cao mọi trải nghiệm của bạn.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Chơi game đồ họa ở tốc độ khung hình cao, mượt mà
Kết nối Thunderbolt 4 qua cổng USB-C với băng thông lên tới 40 Gbps có thể xuất tín hiệu hình ảnh 6K và mở ra một hệ sinh thái rộng lớn gồm các phụ kiện được hỗ trợ.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Kết nối Thunderbolt 4 qua cổng USB-C
Sự xuất hiện của Apple M1 kết hợp cùng 8 GB RAM đã đưa iPad Pro 12.9 inch 2021 lên một tầm cao mới. Máy tính bảng đẳng cấp hơn khi hoàn thành mọi tác vụ một cách mượt mà, đa nhiệm thả ga, đi kèm 128 GB ROM mở rộng không gian lưu trữ cho người dùng.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | 8 GB RAM cùng 128 GB ROM mở rộng không gian lưu trữ
Trải nghiệm xuyên suốt ở bất cứ đâu
Máy tính bảng nâng cấp cổng wifi 6 cho kết nối siêu tốc và ổn định. Ngoài ra, phiên bản iPad Pro M1 12.9 inch còn hỗ trợ Cellular cho kết nối mạng internet 5G, người dùng có thể đăng tải ảnh, thông tin và dữ liệu siêu nhanh, phát trực tuyến, xem phim chất lượng cao và chinh phục các tựa game nặng ở bất cứ nơi nào.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Máy tính bảng nâng cấp cổng wifi 6 cho kết nối siêu tốc và ổn định
Thiết kế dàn âm thanh 4 loa trầm ấm và bắt tone nhịp nhàng với sự hỗ trợ của Dolby Atmos, mang đến cho người dùng cảm giác đắm chìm như đang trong rạp chiếu phim.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Thiết kế dàn âm thanh 4 loa trầm ấm cùng Dolby Atmos
Trở thành trung tâm của mọi ánh nhìn
Máy tính bảng iPad Pro 12.9 inch 2021 trang bị hệ thống gồm 2 máy ảnh sau có camera chính 12 MP và camera phụ góc rộng 10 MP.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Trang bị hệ thống gồm 2 máy ảnh sau có camera chính 12 MP và camera phụ góc rộng 10 MP
Bên cạnh cung cấp các tính năng chỉnh sửa ảnh và làm đẹp, iPad Pro 12.9 inch 2021 còn hỗ trợ máy quét LiDAR hoạt động với ISP mạnh mẽ giúp lấy nét chính xác hơn với hình ảnh và video mà bạn quay trong điều kiện ánh sáng yếu, tự tin ghi lại những chi tiết đẹp rực rỡ và hoàn hảo.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Hỗ trợ máy quét LiDAR hoạt động với ISP mạnh mẽ giúp lấy nét chính xác
Camera TrueDepth 12 MP có góc rộng 122 độ, với tính năng Center Stage cho hiệu ứng sân khấu trung tâm, khi thực hiện cuộc gọi FaceTime thì ống kính sẽ tự động điều chỉnh để giữ bạn luôn ở giữa khung hình kể cả khi di chuyển, làm các cuộc trò chuyện trở nên thú vị hơn. Camera này còn hỗ trợ mở khóa khuôn mặt Face ID một cách an toàn và tiện lợi.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Camera TrueDepth 12 MP có góc rộng 122 độ, với tính năng Center Stage
Hoạt động miệt mài cùng viên pin lớn
iPad Pro 12.9 inch 2021 sở hữu viên pin 40.88 Wh khoảng 10.835 mAh một dung lượng khá dồi dào. Máy sẵn sàng đáp ứng mọi nhu cầu hoạt động của người dùng trên máy trong nhiều giờ liền mà không biết mệt mỏi.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Sở hữu viên pin 40.88 Wh khoảng 10.835 mAh
Với sự giúp sức của công nghệ sạc nhanh 20 W, viên pin lớn của iPad Pro 12.9 inch 2021 dễ dàng được sạc đầy trong khoảng thời gian ngắn nhất cho phép, giúp bạn nhanh chóng quay trở lại với công việc bận rộn hằng ngày.
iPad Pro M1 12.9 inch WiFi Cellular 128GB (2021) | Sở hữu công nghệ sạc nhanh 20 W
iPad Pro M1 12.9 inch Wifi Cellular 128GB (2021) sẽ là một chiếc máy tính bảng mạnh mẽ, tiện dụng và giúp ích cho người dùng trong nhiều hoạt động nhất có thể. Bạn có thể học online, xem phim, thiết kế đồ họa, chơi game,... trên một màn hình rộng thoải mái hơn rất nhiều so với smartphone thông thường.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2057, N'Máy tính bảng iPad Air 5 M1 Wifi Cellular 64GB', 20, 20490000, 10, N'ipad-air-5-m1-wifi-cellular-64gb-09032.jpg', NULL, NULL, NULL, NULL, CAST(N'1900-01-01' AS Date), N'So với chiếc iPad Air 5 M1 Wifi 64GB thì chiếc iPad Air 5 M1 Wifi Cellular 64GB đã có một điểm khác biệt đáng kể đó là phương thức kết nối khi bạn vừa có thể sử dụng Wifi và vừa sử dụng mạng di động một cách bình thường nhưng vẫn cho một trải nghiệm rất tuyệt vời.
Màn hình to, xem phim, làm việc đã hơn
Máy tính bảng được trang bị một màn hình lớn lên đến 10.9 inch vừa đủ không quá to những cũng không nhỏ cho bạn dễ dàng trải nghiệm, sử dụng. Đi kèm với đó chiếc màn hình Retina IPS LCD này sẽ mang lại cho bạn những trải nghiệm về màu sắc tốt hơn.
Trải nghiệm siêu đã với màn hình lớn - iPad Air 5 M1 Wifi Cellular 64
Thiết kế thời thượng
Thiết kế gọn nhẹ và được Apple làm vuông vức ở các cạnh mang lại cảm giác sang trọng, đẳng cấp, nhiều người dùng rất thích điều này. Màu sắc đa dạng cũng sẽ giúp bạn có nhiều sự lựa chọn phù hợp để sử dụng hơn.
Thiết kế thời thượng - iPad Air 5 M1 Wifi Cellular 64GB
Hiệu năng mạnh mẽ
Được cung cấp sức mạnh từ con chip Apple M1 và RAM 8 GB nên chiếc iPad Air 5 M1 Wifi Cellular này sẽ có một sức mạnh vô cùng kinh khủng. Nó mạnh hơn thế hệ tiền nhiệm lên đến 60% hứa hẹn sẽ cho bạn một khả năng xử lý, làm việc siêu tốc.
Tính năng thông minh - iPad Air 5 M1 Wifi Cellular 64
Nhờ được chạy trên phiên bản phần mềm iPadOS 15 sẽ có rất nhiều tính năng hay cho bạn cũng như tối ưu hiệu suất máy. Có cả khả năng kết nối với bút Apple Pencil, Magic Keyboard,... với độ trễ cực thấp.
Quá nhiều thứ hay ho cho một chiếc iPad Air 5 sẽ mang lại bạn những trải nghiệm mới nhất, mạnh mẽ và thoải mái nhất kể cả khi làm việc hay giải trí.', 4)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2058, N'Đồng hồ MATHEY TISSOT 30 mm Nữ D450ABU', 10, 1527000, 10, N'mathey-tissot-d450abu-nu-1-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Mang kiểu dáng nữ tính và thanh lịch, sản phẩm dành cho các quý cô dịu dàng, quý phái
Là một sản phẩm của hãng đồng hồ Mathey Tissot của Thụy Sĩ, chiếc đồng hồ nữ Mathey Tissot D450ABU mang nhiều ưu điểm đến từ hãng đồng hồ lớn.
Đồng hồ nữ Mathey Tissot D450ABU có thiết kế thanh lịch
Có lớp vỏ bên ngoài bền chắc
- Mặt kính của mẫu đồng hồ kim này có độ trong suốt cao, cứng cáp, dễ dàng đánh bóng khi trầy xước nhẹ.
- Chiếc đồng hồ nữ này được trang bị khung viền cứng cáp, chống ăn mòn, chống oxy hóa hiệu quả, hạn chế hư hỏng cho đồng hồ.
Đồng hồ nữ Mathey Tissot D450ABU có mặt kính cứng cáp, khung viền chắc chắn
Có thông số chống nước 5 ATM, yên tâm đeo đồng hồ khi đi mưa, tắm rửa, không đeo đồng hồ khi bơi lội và lặn
Đồng hồ nữ Mathey Tissot D450ABU có hệ số chống nước 5 ATM
Nắm bắt ngày trong tháng dễ dàng hơn khi chiếc đồng hồ Mathey Tissot nữ này có ô lịch ngày tại vị trí 3 giờ
Đồng hồ nữ Mathey Tissot D450ABU có lịch ngày hữu dụng
Dây đeo của đồng hồ bền bỉ, chịu được mọi thời tiết, cho cảm giác mát tay khi đeo, ôm tay tốt hơn nhờ có nhiều mắt xích nhỏ', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2059, N'Đồng hồ ADRIATICA 36 mm Nữ A3812.1183QZ', 5, 2320000, 15, N'adriatica-a38121183qz-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Thiết kế chiếc đồng hồ kim sang trọng với các chữ số La Mã cổ điển, thích hợp với các cô nàng quý phái, thời thượng
Đồng hồ nữ Adriatica A3812.1183QZ mang thương hiệu Adriatica của Thụy Sĩ, sẽ khiến bạn hài lòng về chất lượng mà mẫu đồng hồ quartz này đem lại.
Đồng hồ nữ Adriatica A3812.1183QZ với thiết kế nữ tính và tinh tế
Kết cấu của chiếc đồng hồ nữ chắc chắn và bền bỉ
- Mặt kính trong suốt với độ cứng cực cao, giúp chống trầy xước và chống nứt vỡ hiệu quả và tối ưu.
- Khung viền sáng bóng bền bỉ nhờ khả năng chống ăn mòn và chống oxi hóa cao, khả năng chịu va đập tốt.
Đồng hồ nữ Adriatica A3812.1183QZ có lớp vỏ ngoài bền chắc
Mẫu đồng hồ Adriatica nữ này có hệ số chống nước 30m, an toàn khi rửa tay và đi mưa, không nên đeo khi đi tắm hay bơi lội
Đồng hồ nữ Adriatica A3812.1183QZ có hệ số chống nước 3 ATM
Xác định được nhiều thông tin thời gian hơn với ô lịch ngày được trang bị trên chiếc đồng hồ
Đồng hồ nữ Adriatica A3812.1183QZ được trang bị lịch ngày tiện lợi
Dây đeo của mẫu đồng hồ Adriatica bền bỉ, không bị gỉ sét, dễ lau chùi khi bám bụi, cho bạn cảm giác mát tay khi đeo', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2060, N'Đồng hồ MATHEY TISSOT 30 mm Nữ D450BI', 3, 1698000, 35, N'mathey-tissot-d450bi-nu-1-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Sang trọng và thanh lịch với sự phối màu hài hòa, thích hợp cho các quý cô nữ tính và quý phái
Đồng hồ nữ Mathey Tissot D450BI là một sản phẩm của hãng đồng hồ Mathey Tissot của Thụy Sĩ, nổi tiếng với nhiều chiếc đồng hồ sang trọng.
Đồng hồ nữ Mathey Tissot D450BI có thiết kế trẻ trung
Hạn chế hư hỏng khi va chạm
- Mặt kính khoáng của mẫu đồng hồ kim này có độ trong suốt cao, cứng cáp, cho khả năng hạn chế trầy xước tốt.
- Chiếc đồng hồ nữ này được trang bị khung viền cứng cáp, chống ăn mòn, bảo vệ tốt các chi tiết máy bên trong.
Đồng hồ Nữ Mathey Tissot D450BI - Mặt kính khoáng, khung viền thép
Có thông số chống nước 5 ATM, yên tâm đeo đồng hồ khi đi mưa, tắm rửa, không đeo đồng hồ khi bơi lội và lặn
Đồng hồ nữ Mathey Tissot D450BI có hệ số chống nước 5 ATM
Dễ dàng nắm bắt ngày trong tháng nhờ chiếc đồng hồ Mathey Tissot nữ này được trang bị ô lịch ngày tại vị trí 3 giờ
Đồng hồ nữ Mathey Tissot D450BI có lịch ngày tiện dụng
Dây đeo bền bỉ, chịu được mọi thời tiết, cho cảm giác mát tay khi đeo, ôm tay tốt hơn nhờ có nhiều mắt xích nhỏ', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2061, N'Đồng hồ ADRIATICA 36 mm Nữ A3812.5183Q', 5, 2220000, 10, N'adriatica-a3812-5183q-nu-1-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Chiếc đồng hồ này mang màu sắc sang trọng, hiện đại, phù hợp với các quý cô trẻ trung, quý phái
Mang thương hiệu đồng hồ Adriatica nổi tiếng của Thụy Sĩ, đồng hồ nữ Adriatica A3812.5183Q sẽ khiến bạn an tâm về chất lượng của nó.
Đồng hồ nữ Adriatica A3812.5183Q với thiết kế nữ tính, sang trọng
Trang bị lớp vỏ bền bỉ, chịu lực tốt
- Mặt kính cao cấp có độ trong suốt cao, độ cứng cao, khó trầy xước khi có va chạm mạnh.
- Khung viền của mẫu đồng hồ kim này có độ bền cao, chống ăn mòn, dễ dàng đánh bóng như mới khi bị trầy xước.
Đồng hồ nữ Adriatica A3812.5183Q sở hữu mặt kính Sapphire, khung viền bằng thép chống gỉ
Hệ số chống nước 3 ATM, thoải mái đeo đồng hồ khi rửa tay, đi mưa mà không lo vào nước, không mang đồng hồ khi tắm hay bơi, lặn
Đồng hồ nữ Adriatica A3812.5183Q có độ chống nước 3 ATM
Chiếc đồng hồ Adriatica nữ này được tích hợp lịch ngày giúp bạn làm chủ thời gian của mình
Đồng hồ nữ Adriatica A3812.5183Q có mặt lịch ngày tiện lợi
Dây của đồng hồ nữ này chống oxi hóa, chịu được mọi thời tiết khắc nghiệt, cho cảm giác mát tay khi đeo', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2062, N'Đồng hồ Q&Q 28.5 mm Nữ S393J212Y', 5, 293000, 20, N'q-q-s393j212y-nu-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Là mẫu đồng hồ kim có kiểu dáng hiện đại, tinh tế, dành riêng cho các cô nàng thanh lịch, nữ tính
Đồng hồ nữ Q&Q S393J212Y đến từ thương hiệu đồng hồ Q&Q uy tín và chất lượng của Nhật Bản.
Đồng hồ nữ Q&Q S393J212Y có kiểu dáng sang trọng
Bộ khung bền chắc, chịu va đập hiệu quả
- Mặt kính của chiếc đồng hồ nữ này có độ trong suốt cao, chịu lực tốt, dễ dàng đánh bóng như mới khi bị trầy xước.
- Khung viền mẫu đồng hồ quartz này cứng cáp, chống ăn mòn, thoải mái lau chùi, vệ sinh khi bị bám bụi bẩn.
Đồng hồ nữ Q&Q S393J212Y có mặt kính cứng cáp, khung viền chống ăn mòn
Người dùng yên tâm đeo đồng hồ khi tắm, đi mưa vì nó có hệ số chống nước 50m, không mang khi bơi, lặn
Đồng hồ nữ Q&Q S393J212Y có hệ số chống nước 5 ATM
Dây đeo của chiếc đồng hồ Q&Q nữ này có độ bền cao, chống oxi hóa, chịu được mọi thời tiết khắc nghiệt', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2063, N'Đồng hồ CASIO 39.7 mm Nam AE-1200WHD-1AVDF', 5, 1029000, 10, N'casio-ae-1200whd-1avdf-bac-6-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'- Thương hiệu đồng hồ Casio của Nhật Bản, uy tín và chất lượng nổi tiếng thế giới
- Chiếc đồng hồ nam có đường kính mặt 39.7 mm, độ rộng dây 24.3 mm, phù hợp kích thước cổ tay trung bình
- Khung viền nhựa chắc chắn, chống va đập hiệu quả, dây đeo hợp kim chống ăn mòn tốt, độ bền cao
- Thoải mái đeo đồng hồ đi tắm, bơi lội với độ chống nước tới 10 ATM, không nên mang khi lặn
- Đồng hồ sở hữu các tiện ích: Lịch thứ, ngày, báo thức và bấm giờ thể thao
- Trang bị đèn nền giúp bạn xem giờ trong bóng tối', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2064, N'Đồng hồ Casio 34 mm Nữ LTP-VT01L-5BUDF', 10, 855000, 10, N'casio-ltp-vt01l-5budf-nu-thumbb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'• Đây là món phụ kiện thời trang lý tưởng đến từ hãng đồng hồ Casio nổi tiếng của Nhật Bản. Nổi bật với thiết kế đơn giản và tinh tế phù hợp với mọi cô nàng.
• Đồng hồ Casio 34 mm nữ LTP-VT01L-5BUDF sở hữu đường kính mặt 34 mm.
• Khung viền được làm từ thép không gỉ bền bỉ với thời gian, chống oxi hoá, chống chịu mọi thời tiết. Dây đeo đồng hồ được làm từ da tổng hợp, tạo cảm giác thoải mái khi đeo, ôm sát cổ tay.
• Thoải mái khi rửa tay mà không lo hư hỏng vì đồng hồ nữ này có hệ số kháng nước là 1 ATM. Không nên đeo khi đi tắm, đi bơi, lặn.', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2065, N'Đồng hồ G-SHOCK 45.4 mm Nam GM-2100-1ADR', 10, 5440000, 15, N'g-shock-gm-2100-1adr-nam-1-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'• Vừa bóng bẩy, sắc nét lại vừa táo bạo với chiếc đồng hồ G-Shock tiêu chuẩn, của thương hiệu Casio nổi tiếng và uy tín Nhật Bản. Chiếc đồng hồ này thực sự được xem như là một món thời trang thực thụ vì vẻ ngoài được thiết kế cực kì và ấn tượng.
• Mẫu đồng hồ G-SHOCK 45.4 mm Nam GM-2100-1ADR có đường kính mặt 45.4 mm, độ rộng dây là 25.7 mm. Gây chú ý vì thiết kế mặt hình bát giác với chất liệu mặt kính khoáng toát lên vẻ cứng cáp, chống va đập cực tốt.
• 20 ATM là hệ số chống nước của mẫu đồng hồ này, với thông số này, đồng hồ thường được thiết kế núm xoáy vít vặn, mang tới khả năng chống nước cực tốt. Người dùng có thể tự tin đeo đồng hồ khi bơi lặn hay những hoạt động thể thao khám phá dưới biển. Lưu ý: không bấm các nút điều khiển khi bơi, lặn.
• Casio đã tỉ mỉ và chi tiết trong khâu lựa chọn vật liệu với khung viền làm từ thép không gỉ mạ Ion sáng bóng, bền bỉ với thời gian. Dây đeo được làm từ nhựa, bền bỉ, chống nước tốt. Những vật liệu này giúp người dùng khi đeo cảm thấy thoải mái, êm ái.
• Người dùng không cần đem điện thoại vì đã có thể xem lịch ngày, lịch tháng trên mặt đồng hồ một cách nhanh chóng. Đồng hồ còn hỗ trợ âm bấm phím, đèn led, kim dạ quang xem giờ trong bóng tối cực dễ dàng.
• Đồng hồ nam này cũng sở hữu nhiều tiện ích như những chiếc đồng hồ G-Shock khác như: báo thức, bấm giờ thể thao, bấm giờ đếm ngược, giờ thế giới, đồng hồ 24 giờ, sẽ giúp bạn xem giờ tiện lợi hơn.', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2066, N'Đồng hồ Casio 36.3 mm Unisex A168WER-2ADF', 10, 1224000, 20, N'casio-a168wer-2adf-unisex-thumbb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'• Đồng hồ Casio 36.3 mm Unisex A168WER-2ADF là món phụ kiện thời trang lý tưởng đến từ hãng đồng hồ Casio nổi tiếng của Nhật Bản. 
• Đồng hồ có đường kính mặt 38.6 x 36.3 mm.
• Chất liệu của khung viền được làm từ nhựa resin và dây đeo của đồng hồ được làm từ thép không gỉ cứng cáp, bền bỉ với thời gian.
• Đồng hồ unisex sở hữu độ chống nước 1 ATM: An toàn khi rửa tay. Không nên sử dụng khi đi mưa, đi tắm hay bơi, lặn.
• Báo thức, bấm giờ thể thao, lịch ngày, lịch thứ, đèn nền và đồng hồ 24 giờ là những tiện ích của đồng hồ, giúp người dùng chủ động hơn trong cuộc sống.', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2067, N'Đồng hồ G-SHOCK 40.4 mm Nữ GM-S2100-3ADR', 5, 5111000, 30, N'g-shock-gm-s2100-3adr-nu-thumbb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'• Mẫu đồng hồ này phù hợp cho những bạn nữ ưa chuộng sự cá tính và năng động với kiểu dáng thiết kế thể thao, màu sắc trẻ trung. Đồng hồ G-SHOCK 40.4 mm Nữ GM-S2100-3ADR thuộc dòng G-Shock đến từ thương hiệu Casio - Nhật Bản, nổi tiếng với những chiếc đồng hồ chống sốc bền bỉ.
• Bộ khung viền gia công chắc chắn từ chất liệu thép không gỉ giúp hạn chế hư hỏng khi xảy ra va đập mạnh, kết hợp dây đeo bằng nhựa nhẹ nhàng, khó đứt, bền bỉ mang lại cho bạn sự thoải mái.
• Đồng hồ sỡ hữu đường kính mặt 40.4 mm cùng chất liệu là kính khoáng trên mặt kính cho độ trong suốt, độ cứng cao, dễ dàng đánh bóng lại như mới sau khi đeo một thời gian.
• Chịu được áp lực nước ở độ sâu 200 m tương đương với hệ số chống nước 20 ATM giúp bạn an tâm đeo đồng hồ khi đi tắm, bơi lội hay đi lặn cũng như tham gia các hoạt động thể thao dưới nước. Lưu ý: Không bấm nút điều khiển khi đang bơi hoặc lặn dưới nước.
• Chiếc đồng hồ G-Shock này được tích hợp nhiều tính năng hỗ trợ bạn trong cuộc sống hàng ngày như: Đèn nền, xem giờ thế giới, báo thức, bấm giờ đếm ngược, bấm giờ thể thao, lịch ngày - thứ - tháng, đồng hồ 24 giờ thuận tiện hơn khi theo dõi thời gian mọi lúc. ', 5)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2069, N'Pin sạc dự phòng Polymer 10.000 mAh Type C', 5, 455000, 20, N'sac-du-phong-10000mah-type.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST xanh có kích thước gọn gàng cùng màu sắc đẹp mắt, dễ dàng mang theo đến nhiều nơi và sử dụng khi cần.
Có màu sắc tươi tắn - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Sạc dự phòng có dung lượng pin 10.000 mAh, có thể sạc được nhiều lần cho các thiết bị di động phổ biến trên thị trường hiện nay.
Dung lượng 10.000 mAh - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Pin dự phòng Xmobile PJ JP190ST có 3 nguồn ra, gồm 2 cổng USB và 1 cổng USB Type-C đạt công suất 5V - 2.4A, cho tốc độ sạc nhanh, tiết kiệm thời gian và không gian khi sạc.
Có 3 nguồn ra tiện ích - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Sạc dự phòng Xmobile dễ dàng được sạc lại khi sử dụng hai nguồn vào là Micro USB và Type-C đều có công suất 5V - 2A, khi sạc nhanh chỉ mất 5 đến 6 giờ với cổng USB type-C.
Sạc lại pin nhanh chóng - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Sạc dự phòng Xmobile trang bị lõi pin Polymer bền bỉ, an toàn hơn cho bạn khi sử dụng.
Có lõi pin Polymer - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Trạng bị đèn LED tiện lợi, người dùng nắm bắt tình trạng pin khi sử dụng cũng như khi sạc tốt hơn.
Có đèn LED tiện lợi - Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST Xanh
Nhìn chung, với thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa, pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PJ JP190ST xanh sẽ là một phụ kiện thích hợp dành cho bạn.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2070, N'Pin sạc dự phòng Polymer 10.000 mAh QC3', 10, 360000, 25, N'sac-du-phong-polymer-10000mah.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Pin sạc dự phòng eValu PA F1 Air có vỏ được gia công bằng nhôm rất chắc chắn, không bám vân tay
Kích thước pin nhỏ hơn chiếc iPhone X, các cạnh được bo cong nhằm giúp cầm thoải mái hơn, không bị cấn tay.
Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
Kích thước pin của sạc dự phòng không quá to cũng giúp cho vô túi xách hay ví cầm tay cũng rất dễ dàng.
Lõi pin Polymer (Li-Po) sử dụng an toàn, hạn chế chai pin, cho pin có trọng lượng nhẹ.
Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
Thông tin chi tiết cổng sạc
Pin sạc dung lượng 10.000 mAh trang bị 2 cổng sạc vào, giúp nạp lại pin nhanh hơn.
- Cổng sạc Micro USB: 5V - 2A.
- Cổng sạc Type-C: 5V - 2A.
Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
2 cổng sạc ra với công nghệ sạc thông minh Quick Charge 3.0 rất nhanh
Sạc 2 thiết bị cùng lúc, sạc nhanh iPhone 11 Pro Max chỉ trong 2 - 3 tiếng.
- Cổng sạc Type-C: 5V - 3A.
- Cổng sạc USB Quick Charge 3.0 (dùng được với bất kỳ dây cáp nào): 5V - 3A | 9V - 1.67A | 12V - 1.25A (công suất tối đa 15 W).
Các cổng sạc trên Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
Có đèn Led tiện theo dõi dung lượng pin còn lại.
Pin sạc dự phòng Polymer 10.000 mAh QC 3.0 eValu PA F1 Air Nhôm Bạc
Dung lượng pin cao cho nhiều lần sạc 
Sạc đầy được cho điện thoại và máy tính bảng có dung lượng dưới 7.000 mAh. Sạc iPhone 11 Pro Max 3 lần, hiệu suất tới 65%.
Lưu ý: Trong quá trình sạc pin sẽ bị hao hụt khoảng 35% dung lượng.
Dùng để sạc cho phụ kiện như quạt USB, loa, tai nghe Bluetooth...', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2071, N'Pin sạc dự phòng Polymer 20.000 mAh', 5, 1190000, 20, N'polymer-20000mah-type-c-25w-samsung.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Kiểu dáng đơn giản, nhỏ gọn, màu đen thời trang
Lớp vỏ nhựa cao cấp kháng vỡ, giúp giảm trọng lượng sạc dự phòng, cầm nắm hơi đầm tay nhưng không nặng với 392 gram.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Kiểu dáng đơn giản, nhỏ gọn, màu đen thời trang
Bắt kịp nhịp sống nhanh của bạn với công nghệ sạc nhanh Super Fast Charging, Power Delivery, Quick Charge 2.0
Đáp ứng các tiêu chuẩn sạc nhanh hiện đại, dòng sạc có thể lên đến 25W, làm đầy năng lượng cho thiết bị trong tích tắc và đảm bảo quá trình kết nối, sạc nhanh, an toàn đầy tin cậy. 
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Bắt kịp nhịp sống nhanh của bạn với công nghệ sạc nhanh Super Fast Charging, Power Delivery, Quick Charge 2.0
Trên Samsung EB-P5300 có 1 cổng vào Type-C (5V - 3A, 9V - 2.77A, 12V - 2.1A, 15V - 1.66A, 20V - 1.25A) và 2 cổng ra USB (5V - 2A, 9V - 2A, 12V - 2.1A) và Type C (5V - 3A, 9V - 2.77A, 15V - 1.66A, 20V - 1.25A), 1 nút nguồn và đèn LED báo hiệu lượng pin còn lại dễ dàng theo dõi. 
Để sạc lại cho sạc dự phòng bạn có thể dùng adapter riêng hoặc laptop, thời gian đầy pin từ 12 - 14 giờ khi dùng adapter 2A.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - 3 cổng kết nối
Tương thích và sạc được nhiều loại thiết bị với dung lượng sạc dự phòng 20.000 mAh
Nguồn năng lượng cao, hiệu suất mạnh mẽ 60% và hoạt động tốt với các thiết bị quen thuộc trên thị trường như điện thoại, tablet, tai nghe Bluetooth, laptop,... Sạc dự phòng đem lại sự tự tin hơn cho bạn khi biết chắc rằng lúc nào mình cũng có thể sạc lại cho thiết bị khi cần.
Dựa vào thử nghiệm nội bộ của hãng thì pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 đen sạc đầy pin cho Galaxy S20 Ultra khoảng 3.1 lần, Galaxy Tab S7+ khoảng 1.6 lần.
Lõi pin Polymer bền bỉ, cho dòng xả cao, cung cấp năng lượng liên tục cho thiết bị.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Tương thích và sạc được nhiều loại thiết bị với dung lượng sạc dự phòng 20.000 mAh
Bộ sạc hiệu quả cao cho 3 thiết bị cùng lúc
Nhờ thiết kế 3 cổng ra, pin sạc dự phòng có thể cấp nguồn cho 3 thiết bị đồng thời, giúp tăng sự tiện lợi và giảm rắc rối cho hoạt động trải nghiệm của bạn.
Lưu ý, khi sử dụng để sạc laptop, hiệu suất có thể thay đổi tùy vào nhiều yếu tố khác nhau, ví dụ như do mạng và cách sử dụng. Hãng khuyến cáo nên sạc khi đã tắt nguồn hoặc ở chế độ tiết kiệm năng lượng, có thể sẽ gặp khó khăn nếu sạc nhiều laptop đồng thời.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Bộ sạc hiệu quả cao cho 3 thiết bị cùng lúc
Đảm bảo an toàn 
Nhiều tính năng an toàn của sạc dự phòng Samsung bảo vệ pin thiết bị của bạn, sạc dự phòng và chính bạn tránh khỏi tình trạng sạc quá mức, đoản mạch, nhiệt độ cao, va đập và nhiều tình trạng nguy hại khác.
Pin sạc dự phòng Polymer 20.000mAh Type C PD 25W Samsung EB-P5300 Đen - Đảm bảo an toàn 
Quá nhiều điểm tuyệt vời để thuyết phục bạn chọn ngay sạc dự phòng Samsung EB-P5300 cho mình, đó là thiết kế sang trọng, sạc nhanh, an toàn, chất lượng tốt và giá bán hấp dẫn', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2072, N'Pin sạc dự phòng Polymer 10000mAh AVA', 5, 250000, 20, N'pin-polymer-10000mah-ava.jpeg', NULL, NULL, NULL, NULL, CAST(N'1900-01-01' AS Date), N'Kích thước nhỏ gọn, màu sắc tinh tế, dễ dùng cho mọi người
Pin sạc dự phòng Polymer 10000mAh AVA+ DS006 có 2 màu xanh rêu hoặc xanh navy để lựa chọn theo đối tượng, sở thích người dùng, kích thước nhỏ nhắn, trọng lượng nhẹ chỉ 225 g rất thuận tiện mang theo sử dụng mọi lúc, mọi nơi.
Nhỏ gọn - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
Chia sẻ nguồn năng lượng từ sạc dự phòng AVA+ cho 2 thiết bị cùng lúc
Trang bị 2 cổng ra USB, bạn dễ dàng để sử dụng sạc dự phòng sạc đồng thời cho 2 thiết bị, nhanh chóng nạp lại pin cho điện thoại, tablet, tai nghe… cách an toàn và tiết kiệm thời gian.
2 cổng ra - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
Sử dụng thoải mái, thuận tiện nhờ dung lượng sạc dự phòng 10.000 mAh
Với dung lượng dự trữ này, thật dễ dàng để sạc đến 2.5 lần cho iPhone 12 Pro Max hoặc 2 lần cho OPPO A74, thoải mái sử dụng thiết bị di động với tần suất cao khi du lịch, công tác… mà không lo cạn năng lượng bất chợt.
10.000 mAh - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
Sạc lại pin cho sạc dự phòng qua cổng Micro USB 5V – 2A
Sử dụng adapter đầu ra Micro USB để sạc lại cho sạc dự phòng, thời gian sạc là 5 - 6 giờ khi dùng adapter 5V - 2A và 10 – 11 giờ khi dùng adapter 1A.
Sạc lại đơn giản - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
An toàn, bền bỉ nhờ lõi pin Polymer chất lượng tốt, tuổi thọ cao
Bạn dễ dàng theo dõi dung lượng pin còn lại trên sạc dự phòng thông qua đèn báo Led, mỗi đèn báo tương ứng với 25% dung lượng.
An toàn, bền bỉ - Pin sạc dự phòng Polymer 10000mAh AVA+ DS006
Trang bị pin sạc dự phòng Polymer 10000mAh AVA+ DS006 cho hành trang của mình để an tâm sử dụng các thiết bị di động theo nhu cầu mà không lo chúng cạn năng lượng bất chợt, xử lý công việc hiệu quả hơn, giải trí thoải mái hơn.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2074, N'Pin sạc dự phòng Polymer 10.000 mAh W37Y5', 10, 420000, 10, N'sac-du-phong-polymer-10000mah.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Pin sạc dự phòng Polymer 10.000mAh Type C Xmobile PW37Y5B trắng có kích thước nhỏ gọn và trọng lượng nhẹ, thuận tiện mang theo khi di chuyển.
Thiết kế đẹp mắt - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Pin dự phòng PW37Y5B có cổng USB Type-C hiện đại, và có thể truyền tải điện năng công suất cao, sạc thiết bị của bạn nhanh hơn, cùng 2 cổng sạc USB thông dụng, dễ dàng sạc pin. Dễ nhận biết phần trăm pin còn lại nhờ có đèn LED hiển thị.
Có 3 cổng sạc - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Sạc dự phòng Xmobile tương thích với nhiều thiết bị khác nhau, sạc được cho hầu hết các loại điện thoại có mặt trên thị trường hiện nay.
Tương thích nhiều thiết bị - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Sạc dự phòng có dung lượng pin 10.000 mAh, cùng hiệu suất 65%, sạc được nhiều lần cho 1 thiết bị. Sử dụng lõi pin Polymer giúp sạc được nhiều lần và an toàn.
Có dung lượng 10.000 mAh - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Sạc lại nhanh chóng thông qua cổng sạc USB Type-C, giúp đảm bảo nguồn năng lượng dự trữ luôn đầy đủ. Thời gian sạc đầy lại cục sạc khoảng 5-6 giờ với cổng USB Type-C.
Với thời gian sạc đầy nhanh chóng - Pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B Trắng
Có thể thấy, pin sạc dự phòng Polymer 10000mAh Type C Xmobile PW37Y5B trắng có thiết kế trang nhã và sang trọng, vừa tay người dùng dung lượng pin lớn, phù hợp với các chuyến đi xa.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2075, N'Chuột Có dây Gaming MSI Clutch GM08 Đen', 10, 420000, 25, N'chuot-co-day-gaming-msi.jpeg', NULL, NULL, NULL, NULL, CAST(N'1900-01-01' AS Date), N'Chuột có dây Gaming MSI Clutch GM08 Đen được thiết kế đối xứng khiến cho chuột thân thiện với cả người dùng thuận tay trái.
• Chuột MSI này được chế tạo tỉ mỉ với lớp vảy rồng độc quyền đem đến độ cầm chắc tay khi sử dụng chuột. Thiết kế đa dác đặc biệt trên các nút cho phép bạn bấm nhanh và dễ dàng.
• Chuột có mức thiết lập mặc định DPI của phần cứng từ 200 - 3200, thông số tối đa tốc độ DPI lên đến 4200 điều chỉnh bằng phần mềm.
• Ngay lập tức chuyển đổi giữa 5 mức thiết lập tốc độ DPI để điều chỉnh độ chính xác cho mọi tình huống.
• Khối lượng chuột gaming này có thể điều chỉnh được, làm cho chuột nhẹ hơn hay nặng hơn qua 2 tạ 3 gam và 1 tạ 5 gam tích hợp trong chuột.
• Tận hưởng khả năng chơi game trong nhiều năm với công tắc có độ bền lên đến 10 triệu lần nhấn và cổng USB mạ vàng.
• Chuột có dây kết nối với các thiết bị PC, laptop qua cổng USB thông dụng.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2076, N'Chuột Có dây Gaming MSI Clutch GM11 Đen', 5, 590000, 20, N'chuot-co-day-gaming-msi-clutch.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Chuột có dây Gaming MSI Clutch GM11 Đen được gia công tỉ mỉ với độ bền cao, màu đen nhám làm nổi bật vẻ sang trọng đường nét bên ngoài của GM11.
• Chuột MSI này sở hữu thiết kế đối xứng, phù hợp với cả người dùng thuận tay phải và thuận tay trái.
• Chuột gaming này kết hợp công tắc từ OMRON đạt độ bền hơn 10 triệu cú nhấn chuột cùng mắt đọc quang học của Pixart với tốc độ lên đến 5000 DPI.
• Nút cuộn của chuột được khắc tuyến tính và gờ bám ở cạnh bên giúp bạn nắm chuột chắc chắn hơn khi chơi game.
• Tất cả các thiết lập chi tiết như điều khiển ánh sáng, gán chức năng cho nút, thiết lập mức tốc độ DPI và lưu trữ tổ hợp macro có thể được tiến hành nhờ vào phần mềm Dragon Center.
• Bên cạnh đó, bạn không cần thông qua ứng dụng mà có thể tùy chỉnh DPI, màu sắc đèn LED, độ sáng trực tiếp qua các nút bấm trên chuột có dây.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2077, N'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen', 10, 970000, 20, N'co-day-gaming-msi-vigor-gk30.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen với chân đế gaming vững vàng ngay bên dưới phím Space Bar đem đến sự vững vàng, chống trượt khi chơi game.
• Thiết kế phím nổi chống nước không chỉ giúp bàn phím đẹp hơn, mà còn giúp cho bạn dễ dàng lau chùi bàn phím hơn khi dính bẩn.
• Bàn phím MSI được trang bị các switch tịnh tiến tương tự switch cơ học với ba bộ phận đem đến trải nghiệm gõ phím chắc chắn với độ bền hơn 12 triệu lần nhấn.
• Thông qua phần mềm MSI Center bạn có thể tuỳ biến bàn phím gaming với hàng triệu màu sắc và đến 7 hiệu ứng đèn trên 6 khu vực.
• Ngoài ra, với các phím tắt tiện lợi bạn dễ dàng thay đổi nhanh tốc độ, hướng hay chế độ đèn mà không cần cài đặt phần mềm. Phía trên của bàn phím là dãy phím tắt điều chỉnh âm lượng.
• Bàn phím có dây kết nối nhanh chóng với PC, Laptop qua cổng USB với đầu nối mạ vàng, dây dài 1.85 m.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2078, N'Bàn phím Có dây Gaming MSI Vigor GK20 US Đen', 10, 700000, 20, N'co-day-gaming-msi-vigor.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Là một sản phẩm mới của nhà MSI trong năm 2022, bàn phím Có dây Gaming MSI Vigor GK20 US Đen sở hữu thiết kế gaming đẹp mắt, trang bị đèn LED RGB nổi bật và nhiều tính năng thú vị khác hứa hẹn sẽ đem đến cho bạn một trải nghiệm tuyệt vời.
Thiết kế bề ngoài của bàn phím đẹp mắt, đậm chất gaming
Đầu tiên mình cảm thấy đây là một chiếc bàn phím có dây được thiết kế khá đẹp mắt với logo MSI nổi bật xuất hiện ngay chỗ tựa tay và sắc đen sang trọng bao bọc toàn bộ bàn phím. Nhờ được trang bị hệ thống đèn LED RGB nên bạn có thể dùng để trang trí góc phòng làm việc thêm xịn sò. Bạn chỉ cần kết nối bàn phím thì đèn LED sẽ tự động sáng đèn.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Thiết kế đẹp mắt
Nói thêm một chút về đèn LED trên chiếc bàn phím gaming này, mình thấy nó đã thể hiện màu sắc khá tốt, đặc biệt nếu dùng trong góc phòng dù chỉ hơi tối chút cũng thể hiện vô cùng rõ nét màu sắc của nó. Tuy nhiên, độ xuyên LED thì khá yếu, nó chỉ đủ để keycap sáng lên chứ không thể hiện màu sắc của đèn LED trên keycap.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Đèn LED RGB chất lượng
Nếu những bạn có yêu cầu cao về LED RGB thì sẽ hơi thất vọng một chút. Tuy nhiên với mức sử dụng cơ bản của mình thì như vậy là đủ dùng. Ngoài ra, bạn hoàn toàn có thể thiết lập mức sáng tối của đèn hoặc chuyển đèn về chế độ nhấp nháy từ tối đến các mức độ sáng khác nhau bằng các tổ hợp phím ngay trên bàn phím dễ dàng.
Ở phần sau bàn phím được thiết kế thêm một nấc chân đế giúp bạn nâng cao độ dốc bàn phím khi cần. Phần đệm tay được trang bị thêm giúp người dùng đánh máy dễ dàng và hạn chế tình trạng mỏi phần cổ tay khi dùng lâu.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Chân đế 
Phù hợp cho những bạn thích chơi “hệ bàn phím Fullsize”
Do là bàn phím Fullsize với 104 phím bấm nên sẽ khá thoải mái nếu bạn sử dụng để đánh những tựa game như MOBA, AAA hoặc những công việc cần nhập số liệu thường xuyên vì đã có phần Numpad tiện lợi. Còn với những tác vụ văn phòng thông thường thì bàn phím này có vẻ hơi lớn một chút và phím bấm không cần thiết phải nhiều như vậy.
Không chỉ riêng chiếc bàn phím MSI Vigor GK20 này mà tất cả bàn phím Fullsize đều có kích thước khá lớn. Nên nếu những bạn có góc bàn làm việc nhỏ hoặc sử dụng trên văn phòng thì sẽ hơi chiếm diện tích 
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Phần Numpad tiện lợi
Ngoài ra, do kích thước lớn cũng sẽ gây vướng víu, bất tiện đôi chút với những bạn có nhu cầu di chuyển thường xuyên. Tuy nhiên, nếu chỉ đặt cố định ở góc phòng thì đây không phải vấn đề. Dù hơi lớn về mặt kích thước nhưng về khối lượng, bàn phím này khá nhẹ chỉ gần 900 g nên mình di chuyển nó khá dễ dàng kể cả các bạn nữ sử dụng cũng không tạo cảm giác nặng nề.
Switch và keycap chất lượng, âm gõ phát ra đã tai
Keycap lõm xuống một chút cho cảm giác thoải mái khi bạn gõ. Mình đã thử đánh máy trong một thời gian dài lên tới 3 - 4 tiếng liên tục vẫn không hề cảm thấy khó chịu hay đau nhức ở đầu ngón tay như khi sử dụng bàn phím trên máy tính.
Chất liệu nhựa ABS cho bề mặt hơi nhám giúp tăng độ bền cho phím nhưng vẫn đảm bảo đủ độ mềm mại khi chạm gõ. Ngoài ra, chất nhựa nhám còn có thể hạn chế tình trạng bám dính vân tay khi gõ và giúp lau chùi bụi bẩn dễ dàng. Bạn chỉ cần một chiếc bàn chải chuyên dùng để vệ sinh bàn phím là có thể nhanh chóng quét sạch lớp bụi bám trên bề mặt bàn phím.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Keycap
Độ dày keycap vừa phải, không quá cao, cũng không quá thấp, mình nghĩ độ dày như vậy là phù hợp với hầu hết mọi người dùng rồi.
Sử dụng loại Switch giả cơ Membrane nên âm thanh phát ra khá đanh, nâng cao trải nghiệm lý thú khi chơi game. Độ đàn hồi của phím khá ổn nhưng cảm giác khi gõ sẽ hơi “nhẹ”. Tất nhiên, đây chỉ là bàn phím giả cơ nên độ đầm và phản hồi xúc giác khi bấm của nó sẽ không thể so bì được với bàn phím cơ, nhưng ở những sản phẩm cùng tầm giá như vậy thì mình nghĩ chiếc bàn phím này dư sức đạt yêu cầu.
Bàn phím Có dây Gaming MSI Vigor GK20 US Đen - Switch
Khi đặt bàn phím lên mặt bàn sẽ đảm bảo được độ bám dính rất tốt. Ngay cả khi mình sử dụng chân đế khiến diện tích tiếp xúc bị giảm đáng kể thì khả năng bám dính giúp cố định bàn phím vẫn không hề thay đổi. Do vậy, bạn hoàn toàn có thể yên tâm khi đánh máy và các thao tác cần sử dụng lực khi chơi game mà không lo bàn phím bị xê dịch.
Jack cắm thông dụng phù hợp để kết nối với nhiều loại máy tính
Chiếc bàn phím MSI này được trang bị Jack cắm USB thông dụng trên hầu hết các loại máy tính. Bạn chỉ cần cắm vào cổng USB trên máy tính là ngay lập tức có thể kết nối và thao tác trên bàn phím với khả năng kết nối và độ nhạy cực cao.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2079, N'Chuột Có dây Gaming Asus Keris', 10, 1060000, 10, N'chuot-co-day-gaming-asus-keris-thumb.jpeg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Chuột có dây Gaming Asus Keris có kiểu dáng gọn nhẹ, thiết kế mạnh mẽ, vừa lòng bàn tay khi cầm nắm, tạo cảm giác thoải mái khi chơi game.
• Chuột có thiết kế dạng tổ ong bên trong cung cấp độ cứng cho cấu trúc và giúp giảm trọng lượng tổng thể xuống chỉ 62 gram.
• Các nút PBT trái và phải có bề mặt trượt bền, chống mài mòn, sáng bóng, đảm bảo cảm giác sử dụng luôn đồng nhất.
• Chuột Asus có cảm biến quang học với độ nhạy lên đến 16000 DPI được tối ưu hóa cho các trò chơi FPS, thiết kế công thái học được nghiên cứu từ các chuyên gia thể thao điện tử.
• Tính năng DPI On The Scroll cho phép điều chỉnh độ nhạy của chuột gaming mà không cần truy cập menu. Chỉ cần nhấn và giữ nút DPI và xoay con lăn để thay đổi mức độ nhạy. Ngoài ra, nhấp vào nút sẽ chuyển qua bốn mức DPI.
• Hệ thống chiếu sáng RGB tích hợp trong logo và bánh xe cuộn có thể được tùy chỉnh với dải màu gần như vô tận và một loạt các hiệu ứng động.
• Thêm vào đó, thông qua phần mềm Armory Crate cho phép người dùng dễ dàng tùy chỉnh cài đặt hiệu suất và hiệu chỉnh các nút nhấn, tùy chỉnh hiệu ứng ánh sáng,...', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2080, N'HP AIO ProOne 240 G9 i5 1235U/8GB/512GB', 10, 19190000, 10, N'hp-aio-proone-240-g9-i7.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Máy tính để bàn HP AIO ProOne 240 G9 i5 (6M3V2PA) chinh phục người dùng là dân văn phòng hay thiết kế khi sở hữu một ngoại hình sang trọng, bắt mắt cùng cấu hình mạnh mẽ đến từ bộ vi xử lý Intel Gen 12, đảm bảo không làm bạn thất vọng. 
• Bộ vi xử lý Intel Core i5 1235U kết hợp cùng card đồ họa Intel UHD Graphics giúp xử lý mượt mà các tác vụ văn phòng trên Office, Google,... hay chỉnh sửa ảnh, thiết kế video cơ bản bằng Photoshop, Figma, Canva,... Bạn vẫn có thể nâng cấp lên card Iris Xe để xử lý công việc nhiều hơn bằng cách lắp thanh RAM khác và kích hoạt Dual-Channel.
• Khả năng đa nhiệm mượt mà nhờ bộ nhớ RAM 8 GB cho phép bạn vừa xử lý file Excel nặng vừa nghe nhạc thư giãn trên Spotify mà vẫn không xảy ra tình trạng giật lag. Không gian lưu trữ ổn định nhờ ổ cứng SSD 512 GB giúp tải các tệp tài liệu học tập mà không lo tốn quá nhiều dung lượng. 
• Kích thước màn hình 23.8 inch kết hợp tấm nền IPS mang đến cho chiếc máy tính để bàn này một góc nhìn rộng rãi, cho phép bạn nhìn trực diện hay nhìn nghiêng lên đến 178 độ mà vẫn giữ nguyên chất lượng ảnh, hạn chế tối đa hiện tượng mờ hình. Độ phân giải Full HD (1920 x 1080) hiển thị hình ảnh sắc ảnh hơn trên từng chi tiết.
• Độ sáng 250 nits cùng công nghệ Anti Glare giúp bạn quan sát rõ hình ảnh ở nhiều môi trường ánh sáng khác nhau nhưng vẫn đảm bảo bảo vệ thị giác người dùng, hạn chế tối đa hiện tượng bị chói sáng.
• Công nghệ âm thanh High Definition (HD) Audio cho chất âm rõ ràng, chân thực giúp bạn thư giãn sau những giờ làm việc căng thẳng.
• Chiếc máy tính để bàn HP có lớp vỏ màu đen sang trọng với cân nặng 5.37 kg giúp bạn dễ dàng lắp đặt ở nhiều vị trí khác nhau từ văn phòng, bàn tiếp tân,... mà vẫn toát lên vẻ đẹp sang trọng, thu hút mọi ánh nhìn. Máy đi kèm chuột và bàn phím hỗ trợ người dùng làm việc tốt hơn.
• Chiếc máy tính để bàn đồ họa này được trang bị nhiều cổng kết nối phổ biến như USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2 hỗ trợ tối đa cho quá trình kết xuất và truyền tải dữ liệu đến các thiết bị ngoại vi của người dùng.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2081, N'Asus ExpertCenter AIO E5402WHAT i5 11500B', 10, 21490000, 20, N'asus-expertcenter-aio-e5402what-i5.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Đến với Asus ExpertCenter AIO E5402WHAT (BA017W), bạn sẽ sở hữu chiếc máy tính nguyên bộ cùng hiệu năng đáp ứng mọi nhu cầu học tập, văn phòng và thiết kế nhỏ gọn tiết kiệm diện tích sử dụng.
• Máy tính AIO được trang bị CPU Intel Core i5 11500B mạnh mẽ tích hợp card Intel UHD Graphics mang lại trải nghiệm làm việc trên các phần mềm Office hay chỉnh sửa ảnh cơ bản diễn ra trơn tru.
• Máy tính để bàn Intel core i5 có RAM 8 GB cho khả năng đa nhiệm mượt mà, SSD 512 GB tăng tốc độ truy xuất dữ liệu, thời gian phản hồi trên máy tính nhanh chóng.
• Màn hình cảm ứng 23.8 inch trang bị 100% sRGB cung cấp màu sắc sống động, có độ chuẩn xác cao, tấm nền Wide View mang lại góc nhìn rộng.
• Phiên bản máy tính để bàn đồ hoạ - kỹ thuật này có Camera IR cho phép người dùng đăng nhập bằng khuôn mặt nhanh chóng. Công tắc khoá camera, TPM 2.0 tăng cường bảo mật cho dữ liệu cá nhân.
• Đa dạng cổng giao tiếp trên máy tính bàn Asus AIO USB 3.2 Gen 2 Type-C, HDMI, Thunderbolt 4, LAN,...
• Micro array tích hợp giúp khả năng thu âm tốt hơn cho mọi buổi họp hay học trực tuyến.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2084, N'HP AIO ProOne 240 G9 i7 1255U/8GB/512GB', 10, 22590000, 20, N'hp-aio-proone-240-g9-i7.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Máy tính để bàn HP AIO ProOne 240 G9 i7 (6M3V4PA) gây ấn tượng bởi sự tinh tế đến từ lối thiết kế thanh lịch cùng hiệu năng vượt trội nhờ bộ vi xử lý Intel Core i7 Gen 12 mạnh mẽ, đáp ứng hoàn hảo mọi nhu cầu của người dùng từ các tác vụ văn phòng cho đến đồ họa - kỹ thuật.
• Bộ vi xử lý Intel Core i7 1255U và card đồ họa tích hợp Intel UHD hỗ trợ vận hành mượt mà công việc văn phòng trên các ứng dụng như Word, Excel, PowerPoint,... cũng như thực hiện các thao tác chỉnh sửa hình ảnh đơn giản trên Photoshop, Canva, Lightroom,... Bạn có thể nâng cấp lên card Iris Xe để nâng cao hiệu quả công việc bằng cách lắp thêm một thanh RAM khác và kích hoạt Dual Channel.
• Máy tính để bàn RAM 8 GB hỗ trợ đa nhiệm trơn tru kể cả với những tác vụ nặng, hỗ trợ nâng cấp lên tối đa 16 GB nhờ 1 khe trống để bạn có thể xử lý nhiều khối lượng công việc hơn. Kết hợp cùng ổ cứng SSD 512 GB giúp truy xuất dữ liệu cực nhanh, không gian lưu trữ thoải mái. 
• Màn hình rộng với kích thước 23.8 inch cùng góc nhìn lên đến 178 độ nhờ tấm nền IPS giúp bạn có thể xem được ở mọi góc độ khác nhau. Độ phân giải Full HD (1920 x 1080) cùng công nghệ chống chói Anti Glare đảm bảo nội dung hiển thị luôn có độ sắc nét cao, màu sắc chân thực và không bị hắt sáng gây khó chịu khi bạn làm việc ở văn phòng có cường độ ánh đèn điện cao. 
• Công nghệ High Definition (HD) Audio cho bạn đắm chìm trong không gian âm nhạc sống động và chân thật khi chơi game hay xem phim, nghe nhạc giải trí. 
• Máy tính để bàn HP đi kèm chuột và bàn phím có cùng tông màu đen sang trọng, vừa mang đến sự tiện lợi khi sử dụng vừa phù hợp để bố trí ở mọi không gian văn phòng.
• Máy tính để bàn có Webcam 5 MP đảm bảo chất lượng hình ảnh sắc nét khi bạn tham gia các lớp học, cuộc họp trực tuyến trên các nền tảng như Zoom, Meet, Teams,...
• Chiếc máy tính để bàn đồ hoạ - kỹ thuật này được cài sẵn hệ điều hành Windows 11 Home SL mang đến sự tiện lợi cho quá trình sử dụng, hỗ trợ bạn hoàn thành công việc tốt hơn trong thời gian ngắn hơn.
• Hàng loạt cổng kết nối thông dụng đáp ứng đa nhu cầu sử dụng với thiết bị ngoại vi như: USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2085, N'Lenovo IdeaCentre AIO 3 24ITL6 i3 1115G4/4GB', 10, 15990000, 20, N'lenovo-ideacentre-aio-3-24itl6-i3-f0g000xc.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Lenovo IdeaCentre AIO 3 24ITL6 i3 (F0G000XCVN) là phiên bản máy tính để bàn All in One tiện lợi khi tích hợp CPU, loa, ổ cứng vào chung một màn hình, đi kèm thêm chuột và bàn phím phù hợp cho người dùng là dân văn phòng. 
• Máy tính để bàn 23.8 inch cùng tấm nền IPS cho không gian làm việc rộng rãi, giúp bạn quan sát đầy đủ mọi nội dung hiển thị trên màn hình. 
• Độ phân giải Full HD (1920 x 1080) cùng độ sáng 250 nits cho màu sắc hiển thị rõ nét, tươi tắn hơn, đắm chìm người dùng vào không gian giải trí chân thực.
• Máy tính để bàn Intel core i3 trang bị bộ vi xử lý Intel Core i3 Tiger Lake cùng card Intel UHD Graphics vận hành tốt mọi ứng dụng học tập và làm việc cơ bản trên Word, Excel, PowerPoint,... 
• RAM 4 GB cho khả năng đa nhiệm tương đối ổn định, vừa làm việc vừa nghe nhạc vẫn rất mượt mà. Ổ cứng 256 GB SSD cung cấp không gian lưu trữ vừa đủ, tốc độ mở máy được cải thiện nhanh chóng.
• Chiếc áo màu đen đơn giản nhưng không kém phần hiện đại cùng cân nặng 6.81 kg thích hợp để trong không gian văn phòng hoặc các bàn lễ tân trong nhà hàng, khách sạn,...
• Máy tính để bàn học tập - văn phòng này đi kèm thêm chuột và bàn phím cho các thao tác học tập, làm việc hay giải trí được tiện lợn hơn.
• Đa dạng cổng kết nối được trang bị trên máy tính để bàn như USB 2.0, LAN (RJ45), HDMI và USB 3.2 giúp bạn truyền tải tốt hơn với các thiết bị ngoại vi khác. ', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2086, N'HP AIO 22 dd2002d i5 1235U/8GB/512GB', 10, 20590000, 20, N'hp-aio-22-dd2002d-i5-6k7g1pa-thumb-1-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Nếu bạn đang cần một trợ thủ đắc lực sở hữu đầy đủ mọi ưu điểm từ cấu hình mạnh mẽ đến màn hình lớn, ngoại hình đẹp mắt, máy tính để bàn HP AIO 22 dd2002d i5 (6K7G1PA) sẽ là sản phẩm All-in-one mà bạn không nên bỏ lỡ, cực kỳ phù hợp cho mọi đối tượng là sinh viên, dân văn phòng hay thậm chí là người dùng sáng tạo.
• Mang trên mình bộ vi xử lý Intel Core i5 1235U mạnh mẽ kết hợp với card Intel UHD Graphics giúp bạn vận hành tốt mọi tác vụ học tập - văn phòng từ cơ bản đến nâng cao hay chỉnh sửa hình ảnh, giải trí với các tựa game nhẹ nhàng. Nếu muốn xử lý khối lượng công việc nhiều hơn, bạn hoàn toàn có thể lắp thêm thanh RAM khác và kích hoạt Dual-Channel để nâng cấp lên card Iris Xe.
• Bộ nhớ RAM 8 GB cho phép người dùng xử lý công việc trên nhiều cửa sổ ứng dụng cùng lúc nhưng vẫn đảm bảo trơn tru, hạn chế tình trạng giật lag. Ổ cứng 512 GB SSD mang đến không gian lưu trữ ổn định khi tải các tệp tài liệu, học tập cần thiết đồng thời gia tăng tốc độ khởi động máy chỉ trong vài giây. 
• Làm việc tốt hơn trên kích thước màn hình 21.5 inch cho phép bạn quan sát bao quát nội dung được hiển thị trên máy, độ sáng 250 nits cùng độ phân giải Full HD (1920 x 1080) cung cấp chất lượng khung ảnh sắc nét ở nhiều điều kiện ánh sáng khác nhau với gam màu sắc chuẩn xác trên từng chi tiết. Thời gian làm việc trên máy lâu dài nhưng vẫn bảo vệ tốt cho thị lực của người dùng nhờ màn hình Anti Glare, giảm thiểu độ chói sáng ở những nơi ánh sáng cao.
• Công nghệ High Definition (HD) Audio cho chất âm to rõ, chân thực trên từng thước phim hay bản nhạc.
• Máy tính để bàn học tập được bao bọc bởi chiếc áo màu trắng tinh khôi, toát lên vẻ đẹp tinh tế và sang trọng khi đặt ở mọi vị trí khác nhau, cân nặng 5.7 kg dễ dàng bưng bê và lắp đặt cố định ở không gian văn phòng, bàn lễ tân nhà hàng, khách sạn,...
• Tính năng mở khóa bằng khuôn mặt tích hợp với Camera IR hồng ngoại hiện đại được trang bị trên chiếc máy tính để bàn này giúp bạn mở khóa nhanh chóng và an toàn hơn rất nhiều so với các kiểu bảo mật truyền thống dù ở những nơi có điều kiện ánh sáng thấp.
• Mặt sau máy tính để bàn HP được trang bị đa dạng các cổng kết nối như USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2 cho khả năng kết xuất và truyền tải dữ liệu đến các thiết bị ngoại vi nhanh chóng, dễ dàng hơn.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2087, N'Lenovo IdeaCentre AIO 3 24ITL6 i5', 20, 19390000, 10, N'lenovo-ideacentre-aio-3-24itl6-i5.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Nếu bạn đang tìm kiếm một chiếc máy tính nguyên bộ để phục vụ cho công việc, học tập hay giải trí cơ bản thì máy tính Lenovo IdeaCentre AIO 3 24ITL6 i5 (F0G000XBVN) sẽ là người bạn đồng hành đắc lực cho điều đó. 
• Máy tính để bàn Intel core i5 được trang bị bộ vi xử lý Intel Core i5 1135G7 cùng card Intel UHD Graphics, máy tính để bàn Lenovo cho phép người dùng xử lý tốt các tác vụ học tập, làm việc trên Office hay giải trí với các tựa game nhẹ nhàng. 
• Máy tính để bàn học tập - văn phòng có khả năng đa nhiệm mượt mà hơn đáng kể nhờ bộ nhớ RAM 8 GB, đồng thời gia tăng tốc độ mở máy chỉ trong vài giây với ổ cứng 256 GB SSD (Có thể tháo ra, lắp thanh khác tối đa 512 GB).
• Làm việc hay giải trí tốt hơn với máy tính để bàn 23.8 inch rộng rãi kết hợp với tấm nền IPS cho góc nhìn rộng lên đến 178 độ, độ phân giải Full HD cùng độ sáng 250 nits giúp các chi tiết hình ảnh hiển thị sắc nét hơn. 
• Xem phim, nghe nhạc với chất âm to rõ hơn nhờ công nghệ âm thanh High Definition. Máy còn đi kèm chuột và bàn phím giúp bạn thao tác thuận tiện hơn.
• Phong cách thiết kế đơn giản nhưng không kém phần hiện đại, chiếc máy tính để bàn này phù hợp cho không gian văn phòng làm việc hay các quầy lễ tân phục vụ. 
• Máy tính để bàn học tập - văn phòng được trang bị các cổng kết nối như USB 2.0, LAN (RJ45), HDMI và USB 3.2 giúp kết nối với các thiết bị ngoại vi khác dễ dàng hơn.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2088, N'Mac Mini 2020 M1 8-core/8GB/256GB', 10, 19990000, 10, N'mac-mini-m1-mgnr3saa-thumb-600x600.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'Mac mini 2020 M1 (MGNR3SA/A) là dòng Mac nhỏ gọn, linh hoạt và đa năng khi có thể đáp ứng cả các nhu cầu giải trí và làm đồ họa mạnh mẽ với hiệu năng đột phá từ chip M1.
Bộ vi xử lý M1 mạnh mẽ vượt trội
Apple Mac mini M1 sở hữu chip M1 được chính Apple thiết kế, mang đến hiệu năng vượt trội với 8 nhân CPU mang đến tốc độ xử lý gấp 3 lần và 8 nhân GPU cho khả năng thiết kế đồ họa mạnh mẽ, phục vụ tốt cho việc chỉnh sửa ảnh, làm video trên các phần mềm như Photoshop, AI, Pr,... 
Apple M1 còn mang đến 16 nhân Neural Engine và đầy đủ các công nghệ máy học tiên tiến cho khả năng xử lý các tác vụ về tính toán, phân tích video, nhận dạng giọng nói và nhiều hơn nữa.
Bộ nhớ RAM 8 GB độ trễ thấp giúp đa nhiệm mượt mà, cho phép các ứng dụng chia sẻ dữ liệu giữa CPU, GPU và Neural Engine một cách hiệu quả, làm việc đa tác vụ cùng lúc mà không lo đơ máy, đứng máy.
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cấu hình
Ổ cứng SSD 256 GB mang đến khả năng xử lý nhanh chóng và không gian lưu trữ dữ liệu, bạn có thể tải được nhiều ứng dụng, tài liệu, phục vụ nhu cầu học tập, làm việc hằng ngày hay các file âm nhạc, phim ảnh giải trí.
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - SSD
Kích thước nhỏ gọn, tối giản và bảo mật tối ưu
Mac mini M1 2020 sở hữu thiết kế khối vuông vô cùng nhỏ gọn với độ dày chỉ 36 mm và nhẹ 1.2 kg tiện lợi di chuyển và giúp tiết kiệm điện năng tiêu thụ lên đến 60% so với thế hệ trước đó.
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Thiết kế
Máy tính để bàn Apple có kiểu dáng sang trọng được chế tác hoàn toàn 100% từ hợp kim nhôm tái chế, tông màu bạc kim loại cao cấp với logo Apple nổi bật trên mặt lưng. 
Sử dụng một bộ vi xử lý riêng cho bảo mật mang tên Secure Enclave, cơ chế mã hóa dữ liệu AES trên ổ cứng và định danh tài khoản với Apple ID mang đến khả năng bảo mật gần như hoàn hảo.
Hệ điều hành macOS Big Sur mang lại trải nghiệm thú vị cho người dùng với thiết kế giao diện và những tính năng vô cùng hữu ích, tương thích tốt với chip Apple M1, giúp nâng cao hiệu quả công việc.
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - macOS Big Sur
Hỗ trợ kết nối hiện đại, nhanh chóng
Trang bị 2 cổng Thunderbolt 4 cho tốc độ truyền tải dữ liệu lên đến 40 Gbps, hỗ trợ xuất hình ảnh sáng màn hình 6K sắc nét và các cổng USB-A, HDMI 2.0, Wi-Fi 6, LAN (RJ45) đáp ứng mọi nhu cầu kết nối đa dạng với nhiều thiết bị thông dụng hiện nay như máy chiếu, tivi, màn hình rời,...
Mac Mini M1 8GB/256GB/Silver (MGNR3SA/A) - Cổng kết nối
Mac mini sử dụng giao tiếp mạng chuẩn Bluetooth 5.0 và Wi-Fi 6 AX201 cho băng thông lên đến 10.000 Mbps giúp đường truyền mạng luôn ổn định, hạn chế giật lag, tốc độ lưu tải dữ liệu lên đến 1.2 GB/s.
Mac mini M1 (MGNR3SA/A) là chiếc máy tính để bàn nhỏ gọn, có cấu hình mạnh mẽ và bảo mật tốt, phù hợp với dân thiết kế đồ họa chuyên nghiệp.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2089, N'PC Gaming Asus ROG Strix G15CF-71270F110W', 10, 42990000, 15, N'asus-rog-strix-g15cf-71270f110w.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'PC Gaming Asus ROG Strix G15CF-71270F110W i7 sinh ra để dành cho các game thủ chuyên nghiệp với cấu hình bùng nổ từ con chip Intel Gen 12 kết hợp cùng card đồ họa NVIDIA GeForce RTX 3070 8 GB và phong thái thiết kế hầm hố, mạnh mẽ chuẩn gaming.
• Với thiết kế dựa trên kiến trúc Turing hàng đầu của nhà NVIDIA, card đồ họa NVIDIA GeForce RTX 3070 8 GB chinh phục mọi game thủ với hiệu ứng hình ảnh thể hiện cực sắc nét, độ sâu của màu sắc được tái tạo cực tốt cho mọi tựa game, kết hợp với CPU Intel Core i7 12700F cân hoàn hảo các tác vụ sáng tạo như thiết kế, chỉnh ảnh,...
• Máy tính để bàn Intel core i7 nâng tầm đa nhiệm vượt trội với bộ nhớ RAM 16 GB (nâng cấp tối đa 64 GB) cho phép người dùng vừa phát sóng chơi game trực tiếp vừa sử dụng các nền tảng xã hội như FaceBook, Twitter, Instagram,... một cách mượt mà. 
• Máy tính để bàn đồ hoạ - kỹ thuật sở hữu ổ cứng SSD 512 GB với 2 khe cắm hỗ trợ PCIe x16 và 4 khe cắm hỗ trợ HDD SATA cung cấp không gian lưu trữ rộng rãi cho bạn chiến được nhiều tựa game đình đám cũng như gia tăng tốc độ khởi động máy, truy cập game,... một cách toàn diện.
• PC Gaming có thiết kế thông minh với quai cầm tích hợp trực tiếp vào vỏ máy cùng giá treo tai nghe ngay trên thùng máy giúp bạn di chuyển thuận tiện hơn cũng như dễ dàng sử dụng tai nghe mọi lúc bạn cần.
• Một cạnh bên hông máy tính để bàn Asus được thiết kế mặt kính trong suốt cho thấy đèn RGB cùng các chi tiết bo mạch bên trong đầy bắt mắt, bạn hoàn toàn có thể điều chỉnh màu sắc theo ý thích nhờ phần mềm Aura Sync hiện đại.
• Trọn vẹn những trải nghiệm chiến game chân thực và sống động nhất với khả năng tùy ý tinh chỉnh cài đặt âm thanh để phù hợp với các chế độ chơi game, chất âm cũng được trong trẻo và to rõ hơn nhờ công nghệ âm thanh High Definition 7.1 Channel Audio được trang bị trên chiếc máy tính để bàn này.
• Đảm bảo cho các thiết bị của bạn luôn trong quá trình kết nối tối đa, PC Gaming Asus ROG Strix trang bị hàng loạt các cổng kết nối như Display port, LAN (RJ45), HDMI, USB Type-C, USB 3.2, USB 2.0, Audio jacks, Headphone, Mic in,... với tốc độ truyền tải và kết xuất nhanh chóng.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2091, N'PC Gaming MSI MAG Infinite S3 12TC i5', 10, 32990000, 25, N'msi-mag-infinite-s3-12tc-i5.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-11' AS Date), N'PC MSI MAG Infinite S3 12TC i5 12400F (251MYS) được thiết kế để mang lại trải nghiệm chiến game tốt nhất cho người dùng, là sản phẩm hoàn hảo dành cho các game thủ chuyên nghiệp cần hiệu năng mạnh mẽ và một thiết kế hầm hố đậm chất gaming.
• Tăng cường trải nghiệm chơi game với bộ vi xử lý Intel Core i5 12400F thế hệ thứ 12 tiên tiến, sở hữu cấu trúc lai để nâng cao sức mạnh tính toán cũng như tối ưu mức độ tiêu thụ điện năng. 
• Máy tính để bàn Intel core i5 được trang bị card đồ họa rời GeForce RTX 3060 Ventus 2X 12 GB với kiến trúc NVIDIA Ampere tích hợp các nhân RT, Tensor và các bộ đa xử lý, đem đến cho game thủ cũng như các nhà sáng tạo nội dung khả năng xử lý đồ họa chuyên nghiệp.
• Máy tính để bàn RAM 16 GB hỗ trợ người dùng xử lý đa tác vụ một cách mượt mà, dễ dàng nâng cấp lên đến tối đa 64 GB để nâng cao trải nghiệm sáng tạo, chơi game.
• Ổ cứng SSD 512 GB với khả năng nâng cấp tối đa 2 TB mang đến không gian lưu trữ ấn tượng đồng thời gia tăng tốc độ cao hơn, khởi động game trong tíc tắc.
• PC Gaming có tính năng Air cooling giúp máy tản nhiệt tốt hơn bằng không khí, từ đó cho các game thủ chiến game trong thời gian dài nhưng vẫn hạn chế tối đa hiện tượng nóng máy.
• Máy tính để bàn MSI được thiết kế để tối ưu luồng gió, giữ cho máy luôn chạy ở hiệu năng đỉnh. Thiết kế một mặt hông trong suốt có thể thấy được các chi tiết bên trong thùng máy giúp khơi nguồn cảm ứng và thể hiện phong cách cá nhân mạnh mẽ của riêng bạn.
• Chuẩn Wi-Fi 6E mới nhất trên máy tính để bàn cho tốc độ truyền tải cao trong khi vẫn đảm bảo kết nối mượt mà, ổn định ngay cả khi có nhiều người cùng sử dụng. 
• Đa dạng cổng kết nối như Display port, LAN (RJ45), HDMI, USB 3.2, USB Type-C 3.2 hai chiều để bạn liên kết với mọi thiết bị ngoại vi cùng lúc.', 2005)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2102, N'Tai nghe chụp tai bluetooth P17', 30, 299000, 20, N'Tai-nghe-chup-tai.png', NULL, NULL, NULL, NULL, CAST(N'2022-11-18' AS Date), N'Tai nghe chụp tai bluetooth P17 Chống Ồn, Micro Gắn Trong, Cổng Jack 3,5mm, Đệm Tai Êm Ái Không Gây Đau Tai. Hàng Chính Hãng.', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2116, N'Tai Nghe ATM-40', 35, 3100000, 10, N'Tai-nghe-ATM-40.png', NULL, NULL, NULL, NULL, CAST(N'2022-11-18' AS Date), N'Với hơn 50 năm phát triển, Audio-Technica đã trở thành thương hiệu tai nghe số 1 Nhật Bản và là 1 trong những thương hiệu uy tín nhất trên thế giới về chất lượng tuyệt vời và thiết kế thời thượng, sắc sảo', 8)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2118, N'IphoneX 64GB', 34, 11399000, 15, N'ipX.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-18' AS Date), N'Màn hình: OLED5.8"Super Retina, Hệ điều hành: iOS 12, Camera sau: 2 camera 12 MP, Camera trước: 7 MP, Chip: Apple A11 Bionic, RAM: 3 GB, Dung lượng lưu trữ: 64 GB, SIM: 1 Nano SIM, Pin Sạc: 2716 mAh.', 2)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId]) VALUES (2120, N'Tai nghe blacky - Logitech', 59, 349000, 35, N'headphone.jpg', NULL, NULL, NULL, NULL, CAST(N'2022-11-22' AS Date), N'Tai nghe thiết kế mang tính chất trẻ trung, sang trọng và chất lượng âm thanh siêu mượt. Giúp người dùng trải nghiệm mượt mà nhất.', 8)
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
/****** Object:  Index [UK23fux5pe6yss1vck8iv9juegn]    Script Date: 11/25/2022 8:55:16 PM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UK23fux5pe6yss1vck8iv9juegn] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKef7fbpy09qu6267gf071q71we]    Script Date: 11/25/2022 8:55:16 PM ******/
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
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_FeedBacks_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_FeedBacks_Products]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Accounts1] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_Accounts1]
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
