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
        public ActionResult Index()
        {
            return View();
        }
        ShopDataDataContext data = new ShopDataDataContext();

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
        public PartialViewResult ListDanhMuc()
        {
            var danhmuc = (from dm in data.DANHMUCs select dm).ToList();
            return PartialView(danhmuc);
        }
        public PartialViewResult SanPhamBanChay()
        {
            var sanpham = (from sm in data.SANPHAMs select sm).ToList();
            return PartialView(sanpham);
        }

    }
}