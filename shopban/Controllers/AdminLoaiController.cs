using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopban.Models;
namespace shopban.Controllers
{
    public class AdminLoaiController : Controller
    {
        // GET: AlinLoai
        ShopDataDataContext data = new ShopDataDataContext();
        // GET: Nhacungcap
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var loai = from l in data.LOAIs select l;
                return View(loai);
            }
        }

        public ActionResult Details(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var loai = from l in data.LOAIs where l.MaL == id select l;
                return View(loai.Single());
            }
        }

        [HttpGet]
        public ActionResult Themmoil()
        {
            ViewBag.Madm = new SelectList(data.DANHMUCs.ToList().OrderBy(n => n.TenDanhMuc), "MaDm", "TenDanhMuc");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoil(LOAI l)
        {
            ViewBag.Madm = new SelectList(data.DANHMUCs.ToList().OrderBy(n => n.TenDanhMuc), "MaDm", "TenDanhMuc");
            data.LOAIs.InsertOnSubmit(l);
            data.SubmitChanges();

            return RedirectToAction("Index", "AdminLoai");

        }
        public ActionResult Xoal(int id)
        {
            LOAI l = data.LOAIs.SingleOrDefault(n => n.MaL == id);
            ViewBag.Mal = l.MaL;
            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(l);
        }

        [HttpPost, ActionName("Xoal")]
        public ActionResult Xacnhanxoa(int id)
        {
            LOAI l = data.LOAIs.Select(p => p).Where(p => p.MaL == id).FirstOrDefault();
            ViewBag.Mal = l.MaL;
            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.LOAIs.DeleteOnSubmit(l);
            data.SubmitChanges();
            return RedirectToAction("Index", "AdminLoai");
        }
        public ActionResult Sual(int id)
        {
           
            LOAI l = data.LOAIs.SingleOrDefault(n => n.MaL == id);
            if (l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.Madm = new SelectList(data.DANHMUCs.ToList().OrderBy(n => n.TenDanhMuc), "MaDm", "TenDanhMuc",l.MaL);
            return View(l);
        }
        [HttpPost, ActionName("Sual")]
        [ValidateInput(false)]
        public ActionResult Sual(LOAI Nhal)
        {
            ViewBag.Madm = new SelectList(data.DANHMUCs.ToList().OrderBy(n => n.TenDanhMuc), "MaDm", "TenDanhMuc");
            LOAI l = data.LOAIs.SingleOrDefault(s => s.MaL == Nhal.MaL);
            l.MaDM = Nhal.MaDM;
            l.TenLoai = Nhal.TenLoai;
            data.SubmitChanges();

            return RedirectToAction("Index", "AdminLoai");

        }
    }
}