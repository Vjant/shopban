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
       
        [HttpGet]
        public ActionResult Themmoinhacungcap()
        {
            
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoinhacungcap(NHACUNGCAP nhacc)
        {
           


            data.NHACUNGCAPs.InsertOnSubmit(nhacc);
            data.SubmitChanges();

            return RedirectToAction("Index", "Nhacungcap");

        }
        public ActionResult XoaNcc(int id)
        {
            NHACUNGCAP ncc = data.NHACUNGCAPs.SingleOrDefault(n => n.MaNCC == id);
            ViewBag.MaNCC = ncc.MaNCC;
            if (ncc == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(ncc);
        }

        [HttpPost, ActionName("Xoancc")]
        public ActionResult Xacnhanxoa(int id)
        {
            NHACUNGCAP ncc = data.NHACUNGCAPs.Select(p => p).Where(p => p.MaNCC == id).FirstOrDefault();
            ViewBag.MaCC = ncc.MaNCC;
            if (ncc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.NHACUNGCAPs.DeleteOnSubmit(ncc);
            data.SubmitChanges();
            return RedirectToAction("Index", "Nhacungcap");
        }
        public ActionResult SuaNhacc(int id)
        {
            NHACUNGCAP ncc = data.NHACUNGCAPs.SingleOrDefault(n => n.MaNCC == id);
            if (ncc == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            
            return View(ncc);
        }
        [HttpPost, ActionName("SuaNhacc")]
        [ValidateInput(false)]
        public ActionResult SuaNhacc(NHACUNGCAP Nhacc)
        {
           

                    NHACUNGCAP ncc = data.NHACUNGCAPs.SingleOrDefault(s => s.MaNCC == Nhacc.MaNCC);
                    ncc.TenNCC = Nhacc.TenNCC;
            ncc.Diachi = Nhacc.Diachi;
            ncc.DienThoai = Nhacc.DienThoai;
                    

                    data.SubmitChanges();
                
                return RedirectToAction("Index", "Nhacungcap");
            
        }
    }
}