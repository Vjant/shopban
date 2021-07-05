using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shopban.Models
{
    public class SanPham_Loai
    {
        public int MaSp { get; set; }
        public int MaL { get; set; }
        public string TenSp { get; set; }
        public string Mota { get; set; }
        public decimal? Gia { get; set; }
        public string Anhbia { get; set; }

    }
}