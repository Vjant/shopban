using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using shopban.Models;
namespace shopban.Controllers
{
    public class AdminDanhMucController : Controller
    {
        // GET: AdminDanhMuc
        ShopDataDataContext data = new ShopDataDataContext();
        // GET: Nhacungcap
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var danhmuc = from dm in data.DANHMUCs select dm;
                return View(danhmuc);
            }
        }

        public ActionResult Details(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var danhmuc = from dm in data.DANHMUCs where dm.MaDM == id select dm;
                return View(danhmuc.Single());
            }
        }

        [HttpGet]
        public ActionResult Themmoidanhmuc()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoidanhmuc(DANHMUC dm)
        {
            data.DANHMUCs.InsertOnSubmit(dm);
            data.SubmitChanges();

            return RedirectToAction("Index", "AdminDanhMuc");

        }
        public ActionResult Xoadm(int id)
        {
            DANHMUC dm = data.DANHMUCs.SingleOrDefault(n => n.MaDM == id);
            ViewBag.MaDM = dm.MaDM;
            if (dm == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(dm);
        }

        [HttpPost, ActionName("Xoadm")]
        public ActionResult Xacnhanxoa(int id)
        {
            DANHMUC dm = data.DANHMUCs.Select(p => p).Where(p => p.MaDM == id).FirstOrDefault();
            ViewBag.MaDM = dm.MaDM;
            if (dm == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.DANHMUCs.DeleteOnSubmit(dm);
            data.SubmitChanges();
            return RedirectToAction("Index", "AdminDanhMuc");
        }
        public ActionResult SuaDm(int id)
        {
            DANHMUC dm = data.DANHMUCs.SingleOrDefault(n => n.MaDM == id);
            if (dm == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(dm);
        }
        [HttpPost, ActionName("SuaDm")]
        [ValidateInput(false)]
        public ActionResult SuaDm(DANHMUC NhaDm)
        {
            DANHMUC dm = data.DANHMUCs.SingleOrDefault(s => s.MaDM == NhaDm.MaDM);
            dm.TenDanhMuc = NhaDm.TenDanhMuc;
            data.SubmitChanges();

            return RedirectToAction("Index", "AdminDanhMuc");

        }
    }
}
