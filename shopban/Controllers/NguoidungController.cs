using shopban.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shopban.Controllers
{
    public class NguoidungController : Controller
    {
        ShopDataDataContext data = new ShopDataDataContext();
        // GET: Nguoidung
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KHACHHANG kh)
        {
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var nhaplaimk = collection["nhaplaiMK"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được bỏ trống";
            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            }
            else if (String.IsNullOrEmpty(nhaplaimk))
            {
                ViewData["Loi4"] = "phải nhập lại mật khẩu";
            }
            else if (matkhau != nhaplaimk)
            {
                ViewData["Loi8"] = "nhập lại sai mật khẩu";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "phải nhập email";
            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi6"] = "Phải nhập địa chỉ";
            }
            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi7"] = "phải nhập SĐT";
            }

            else
            {
                kh.HoTen = hoten;
                kh.Taikhoan = tendn;
                kh.Matkhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienthoaiKH = dienthoai;
                kh.Ngaysinh = DateTime.Parse(ngaysinh);
                data.KHACHHANGs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("Dangnhap","Nguoidung");
            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = " Phải nhập mật khẩu";
            }
            else
            {
                KHACHHANG kh = data.KHACHHANGs.SingleOrDefault(n => n.Taikhoan == tendn && n.Matkhau == matkhau);
                if (kh != null)
                {
                    //ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = kh;
                    Session["Name"] = data.KHACHHANGs.FirstOrDefault().HoTen;
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        public ActionResult ThongTinVeChungToi()
        {
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}