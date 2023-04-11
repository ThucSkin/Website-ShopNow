## WEBSITE THƯƠNG MẠI ĐIỆN TỬ SHOPNOW

**ShopNow** là một trang web bán hàng điện tử đa dụng, cung cấp đa dạng sản phẩm từ các nhà cung cấp uy tín và chất lượng. Trang web có giao diện thân thiện, dễ sử dụng, giúp người dùng tìm kiếm, mua hàng và theo dõi đơn hàng một cách thuận tiện. Admin có thể quản lý sản phẩm, danh mục, đơn hàng, thống kê và thông tin khách hàng. Trang web sử dụng nhiều công nghệ như **HTML/CSS**, **Bootstrap**, **AngularJS**, **Java Spring Boot**, **JavaScript** và **SQL Server**. Tôi hy vọng **ShopNow** sẽ mang đến cho người dùng một trải nghiệm mua sắm trực tuyến tốt nhất.

### GIAO DIỆN WEBSITE

Một vài ảnh demo giao diện phía người dùng:

## ![Tên ảnh](/src/main/resources/static/assets/images/anh1.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh2.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh3.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh4cart.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh5Thongtinkh.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh5.5Chitietdon.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh6lichsudathang.png)

Một vài ảnh demo giao diện phía **Admin**:

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh7QLorder.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh8.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh9.png)

---

## ![Tên ảnh](/src/main/resources/static/assets/images/hinh10.png)

---

**Link Website ShopNow**

[Click here](https://github.com/ThucSkin/Website-ShopNow)

### Hướng dẫn cấu hình kết nối DATABASE

**Nhấn [vào đây](https://github.com/ThucSkin/Website-ShopNow/blob/main/src/main/resources/db/data_ShopNow.sql) để lấy Link DATABASE**

Chọn file **application.properties** và cấu hình theo hướng dẫn bên dưới:

```
    spring.datasource.url=jdbc:sqlserver://localhost;database=[**data_name**];
    encrypt=true;trustServerCertificate=true;sslProtocol=TLSv1.2
    spring.datasource.username=[**Database_Name**]
    spring.datasource.password=[**password**]
    spring.datasource.driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver
    spring.jpa.hibernate.dialect=org.hibernate.dialect.SQLServer2012Dialect
```
