const app = angular.module("shopping-cart-app", []);


app.controller("shopping-cart-ctrl", function ($scope, $http) {
    //Quanligiohang
    $scope.cart = {
        items: [],
        //themsanphamvaogiohang
        add(id) {
            var item = this.items.find(item => item.productId == id);
            if (item) {
                item.qty++;
                this.saveToLocalStorage();
                alert("Đã thêm vào giỏ!");
            } else {
                $http.get(`/rest/products/${id}`).then(resp => {
                    resp.data.qty = 1;
                    this.items.push(resp.data);
                    this.saveToLocalStorage();
                })
            }
        },

        //xoasanphamkhoigiohang
        remove(id) {
            var index = this.items.findIndex(item => item.productId == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },
        //clear
        clear() {
            this.items = [];
            this.saveToLocalStorage();
        },
        //tinhtiencua1sanpham
        amt_of(item) { },
        //tinh tong so luong cac mat hang trong gio
        get count() {
            return this.items
                .map(item => item.qty)
                .reduce((total, qty) => total += qty, 0);
        },
        //tongthanhtien cac mat hang trong gio
        get amount() {
            return this.items
                .map(item => item.qty * item.unitPrice)
                .reduce((total, qty) => total += qty, 0);
        },

        //luu gio hang vao localstorage
        saveToLocalStorage() {
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        //doc gio hang tu local storage
        loadFromLocalStorage() {
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json) : [];
        }
    }
    $scope.cart.loadFromLocalStorage();

    // order
    $scope.order = {
        createDay: new Date(),
        address: "",
        telePhone: "",
        name: "",
        email: "",
        total: $scope.cart.amount + 30000,
        status: "Đang chờ xác nhận",
        account: { username: $("#username").text() },
        get orderDetails() {
            return $scope.cart.items.map(item => {
                return {
                    product: { productId: item.productId },
                    price: item.unitPrice,
                    discount: item.discount,
                    discription: "Duyệt",
                    quantity: item.qty,
                    amount: item.qty * (item.unitPrice - ((item.unitPrice * item.discount) / 100))
                }
            });
        },
        purchase() {
            var order = angular.copy(this);
            // Thực hiện đặt hàng
            if ($scope.order.total < 40000) {
                alert("Vui lòng thêm sản phẩm trước khi đặt hàng!");
            } else if ($scope.order.name == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
            } else if ($scope.order.telePhone == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
            } else if ($scope.order.email == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
            } else if ($scope.order.address == "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
            } else {
                $http.post("/rest/orders", order).then(resp => {
                    alert("Đặt hàng thành công!");
                    $scope.cart.clear();
                    location.href = "/orderHistory/detail/" + resp.data.orderId;
                })
                    .catch(error => {
                        alert("Đặt hàng thất bại!")
                        console.log(error)
                    })
            }
        }
    }

    //Phan trang
    $scope.pager = {
        page: 0,
        size: 10,
        get items() {
            var start = this.page * this.size;
            return $scope.items.slice(start, start + this.size);
        },
        get count() {
            return Math.ceil(1.0 * $scope.items.length / this.size);
        },
        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }
})