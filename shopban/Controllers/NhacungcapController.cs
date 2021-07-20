using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopban.Models;

namespace shopban.Controllers
{
    public class NhacungcapController : Controller
    {
        ShopDataDataContext data = new ShopDataDataContext();
        // GET: Nhacungcap
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var nhacungcap = from ncc in data.NHACUNGCAPs select ncc;
                return View(nhacungcap);
            }
        }

        public ActionResult Details(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var nhacungcap = from ncc in data.NHACUNGCAPs where ncc.MaNCC == id select ncc;
                return View(nhacungcap.Single());
            }
        }
    }
}