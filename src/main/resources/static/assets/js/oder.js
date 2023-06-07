//quản lý sự kiện Jquery
$(document).ready(function () {

    var orderid = 0;

    $(".editmodal").click(function (e) {
        e.preventDefault();//ngăn sự kiện xảy ra

        var status = $(this).parents('tr').find('.status').text();
        orderid = $(this).data('orderid');

        console.log(status);//show ra giá trị của biến

        $(".optionorder").val(status).change();
    });

    $(".submitstatus").click(function (e) {
        e.preventDefault();//ngăn sự kiện xảy ra

        var newstatus = $(".optionorder").val();
        console.log(newstatus);//show ra giá trị của biến
        console.log(orderid);//show ra giá trị của biến

        $.post("/updatestatus", {//pt post
            "orderid": orderid,
            "status": newstatus
        }
        )
            .done(function (data, status) {
                var quantity = parseInt(data);
                console.log(quantity);
                if (quantity == 0) {//nếu sl = 0 đưa ra tb
                    Swal.fire({//sử dụng hộp thoại SweetAlert đưa ra tb 
                        icon: 'error',
                        title: 'Có lỗi ! Vui lòng thử lại...'
                    })
                }
                else if (quantity == -1) {//nếu số lượng -1 đưa ra tb
                    Swal.fire({
                        icon: 'error',
                        title: 'Số lượng trong kho không đủ !'
                    })
                }
                else if (quantity == -2) {//nếu số lượng -2 đưa ra tb
                    Swal.fire({
                        icon: 'error',
                        title: 'Sản phẩm chưa được cập nhật trong kho !'
                    })
                }
                else if (quantity == 1) {//số lượng = 1 đưa ra tb 
                    Swal.fire({
                        icon: 'success',
                        title: 'Thêm thành công !'
                    })
                }
                else if (quantity < 0) {//nhỏ hơn 0 
                    alert("Có gì đó sai sai...^^ !");
                }
                setTimeout(function () {//thiết lập thời gian 2 giây tải lại trang
                    window.location.reload();// tải lại url hiện tại
                }, 2000);
            });

    });
});