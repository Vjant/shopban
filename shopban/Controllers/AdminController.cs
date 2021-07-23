using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopban.Models;
using PagedList;
using PagedList.Mvc;

namespace shopban.Controllers
{
    public class AdminController : Controller
    {
        ShopDataDataContext data = new ShopDataDataContext();
        // GET: Admin
        private List<SANPHAM> Themmoisanpham(int count)
        {
            return data.SANPHAMs.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                return View();
            }
        }

        public ActionResult SanPham(int ?page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 7;
            return View(data.SANPHAMs.ToList().OrderBy(n => n.MaSP).ToPagedList(pageNumber,pageSize));
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            // Gán các giá trị người dùng nhập liệu cho các biến 
            var tendn = f["txtUser"];
            var matkhau = f["txtPass"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)
                ADMIN ad = data.ADMINs.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    // ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        [HttpGet]
        public ActionResult Themmoisanpham()
        {
            ViewBag.MaL = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaL", "TenLoai");
            ViewBag.MaNCC = new SelectList(data.NHACUNGCAPs.ToList().OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoisanpham(SANPHAM sanpham, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaL = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaL", "TenLoai", sanpham.MaL);
            ViewBag.MaNCC = new SelectList(data.NHACUNGCAPs.ToList().OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", sanpham.MaNCC);

            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);

                    var path = Path.Combine(Server.MapPath("/assets/images/sanpham"), fileName);
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                    {
                        fileUpload.SaveAs(path);
                    }

                    sanpham.Anhbia = "/assets/images/sanpham/"+fileName;

                    data.SANPHAMs.InsertOnSubmit(sanpham);
                    data.SubmitChanges();
                }

                return RedirectToAction("SanPham","Admin");
            }
        }
        
        // Hiển thị sản phẩm
        public ActionResult Chitietsanpham(int id)
        {
            SANPHAM sanpham = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sanpham.MaSP;
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanpham);
        }
        [HttpGet]
        public ActionResult Xoasanpham(int id)
        {
            SANPHAM sanpham = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sanpham.MaSP;
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(sanpham);
        }

        [HttpPost, ActionName("Xoasanpham")]
        public ActionResult Xacnhanxoa(int id)
        {
            SANPHAM sanpham = data.SANPHAMs.Select(p => p).Where(p => p.MaSP == id).FirstOrDefault();
            ViewBag.MaL = sanpham.MaL;
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.SANPHAMs.DeleteOnSubmit(sanpham);
            data.SubmitChanges();
            return RedirectToAction("SanPham");
        }

        [HttpGet]
        public ActionResult Suasanpham(int id)
        {
            SANPHAM sanpham = data.SANPHAMs.SingleOrDefault(n => n.MaSP == id);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaL = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaL", "TenLoai", sanpham.MaL);
            ViewBag.MaNCC = new SelectList(data.NHACUNGCAPs.ToList().OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", sanpham.MaNCC);
            return View(sanpham);
        }
        [HttpPost, ActionName("Suasanpham")]
        [ValidateInput(false)]
        public ActionResult Suasanpham(SANPHAM sanpham, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaL = new SelectList(data.LOAIs.ToList().OrderBy(n => n.TenLoai), "MaL", "TenLoai");
            ViewBag.MaNCC = new SelectList(data.NHACUNGCAPs.ToList().OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");

            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View(sanpham);
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("/assets/images/sanpham/"), fileName);

                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại !";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }

                    sanpham.Anhbia = fileName;
                    SANPHAM sp = data.SANPHAMs.SingleOrDefault(s => s.MaSP == sanpham.MaSP);
                    sp.TenSP = sanpham.TenSP;
                    sp.Giaban = sanpham.Giaban;
                    sp.Mota = sanpham.Mota;
                    sp.Anhbia = "/assets/images/sanpham/" + sanpham.Anhbia;
                    sp.Ngaycapnhat = sp.Ngaycapnhat;
                    sp.Soluongton = sp.Soluongton;
                    sp.MaNCC = sanpham.MaNCC;
                    sp.MaL = sanpham.MaL;
                    
                    data.SubmitChanges();
                }
                return RedirectToAction("SanPham");
            }
        }
    }
}