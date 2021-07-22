using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopban.Models;

namespace shopban.Controllers
{
    public class HomeController : Controller
    {
        ShopDataDataContext data = new ShopDataDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Search(String search)
        {
            var sanpham = from sp in data.SANPHAMs // lấy toàn bộ liên kết
                        select sp;

            if (!String.IsNullOrEmpty(search)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                sanpham = sanpham.Where(s => s.TenSP.Contains(search)); //lọc theo chuỗi tìm kiếm
            }

            return View(sanpham); //trả về kết quả
        }
        public ActionResult ThongTinCuaHang()
        {
            return View();
        }
        public ActionResult Blog()
        {
            return View();
        }
        

        public PartialViewResult DanhMuc()
        {
            var danhmuc = (from dm in data.DANHMUCs select dm).ToList();
            return PartialView(danhmuc);
        }
        public PartialViewResult Loai(int danhmuc)
        {
            var loai = (from l in data.LOAIs where l.MaDM == danhmuc select l).ToList();
            return PartialView(loai);
        }
       
        public PartialViewResult SanPhamBanChay()
        {
            var sanpham = (from sm in data.SANPHAMs select sm).ToList();
            return PartialView(sanpham);
        }
        public PartialViewResult NhaCungCap()
        {
            var nhacungcap = (from nhacc in data.NHACUNGCAPs select nhacc).ToList();
            return PartialView(nhacungcap);
        }
    }
}