﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopban.Models;

namespace shopban.Controllers
{
    public class SanphamController : Controller
    {
        ShopDataDataContext data = new ShopDataDataContext();
        // GET: Sanpham
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TenNhaCungCap(int id)
        {
            var sp = from s in data.SANPHAMs where s.MaNCC == id select s;
            return View(sp);
        }
        public ActionResult SPLoai(int id)
        {
            var sp = from s in data.SANPHAMs where s.MaL == id select s;
            return View(sp);
        }

    }
}