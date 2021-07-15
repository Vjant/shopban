using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shopban.Models
{
    public class Giohang
    {
        ShopDataDataContext data = new ShopDataDataContext();
        public int iMaSp { set; get; }
        public string sTenSp { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }

        }
        public Giohang(int MaSp)
        {
            iMaSp = MaSp;
            SANPHAM sp = data.SANPHAMs.Single(n => n.MaSP == iMaSp);
            sTenSp = sp.TenSP;
            sAnhbia = sp.Anhbia;
            dDongia = double.Parse(sp.Giaban.ToString());
            iSoluong = 1;
        }
    }
}