<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer-table {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
        margin-top: 40px;
        background-color: #f5f5f5;
    }
    .footer-table caption {
        font-size: 1.2em;
        font-weight: bold;
        margin-bottom: 10px;
        color: #ffffff;
        background-color: #d32f2f; /* Tiêu đề có nền đỏ */
        padding: 10px;
    }
    .footer-table th,
    .footer-table td {
        border: 1px solid #ddd;
        padding: 15px;
        vertical-align: top;
    }
    .footer-table th {
        background-color: #f2f2f2;
        text-align: left;
    }
    /* Tô màu cho từng cột */
    .footer-contact {
        background-color: #e3f2fd; /* Xanh nhạt cho thông tin liên hệ */
    }
    .footer-register {
        background-color: #fff9c4; /* Vàng nhạt cho form đăng ký */
    }
    .register-form input,
    .register-form select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        margin-bottom: 10px;
        box-sizing: border-box;
    }
    .register-form button {
        background: #d32f2f;
        color: white;
        padding: 10px;
        border: none;
        width: 100%;
        cursor: pointer;
    }
    .register-form button:hover {
        background: #b71c1c;
    }
    .footer-bottom {
        text-align: center;
        margin-top: 20px;
        font-size: 0.9em;
        color: #666;
        background-color: #eceff1; /* Nền xám nhạt cho phần cuối */
        padding: 10px;
    }
</style>

<!-- Footer Section sử dụng bảng -->
<table class="footer-table">
    <caption>HỆ THỐNG BÁN ĐIỆN THOẠI SELLPHONES</caption>
    <tr>
        <!-- Cột bên trái: Thông tin liên hệ -->
        <td style="width: 50%;" class="footer-contact">
            <strong>Thông tin liên hệ</strong><br>
            Địa chỉ: Số 14, Ngõ 33, Đại học FPT, Thạch Thất, Hà Nội<br>
            Điện thoại: 024.3623.1086<br>
            Di động: 0948 788 55<br>
            Email: sellphone@gmail.com<br>
            Website: www.sellphones.com.vn
        </td>
        <!-- Cột bên phải: Form đăng ký -->
        <td style="width: 50%;" class="footer-register">
            <strong>ĐĂNG KÝ TƯ VẤN MIỄN PHÍ</strong>
            <!-- Sử dụng onsubmit để hiện thông báo và ngăn chuyển trang -->
            <form class="register-form" onsubmit="alert('Chúng tôi sẽ sớm liên hệ tới bạn, vui lòng chú ý điện thoại'); return false;">
                <input type="text" name="fullname" placeholder="Họ tên" required>
                <input type="tel" name="phone" placeholder="Điện thoại" required>
                <input type="email" name="email" placeholder="Email" required>
                <select name="phone_model"  required>
                    <option value="">Chọn điện thoại</option>
                    <option value="iphone">Iphone</option>
                    <option value="samsung">SamSung</option>
                    <option value="oppo">Oppo</option>
                    <option value="vsmart">Vsmart</option>
                </select>
                <button type="submit">ĐĂNG KÝ NGAY</button>
            </form>
        </td>
    </tr>
</table>

<div class="footer-bottom">
    © 2025 SELLPHONES. All rights reserved.
</div>
