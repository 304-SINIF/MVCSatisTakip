using MVCSatisTakip.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCSatisTakip.Controllers
{
    public class UrunController : Controller
    {
        satistakipEntities db = new satistakipEntities();
        // GET: Urun
        public ActionResult Index(int sayfa = 1)
        {
            var urunler = db.tbl_urun.ToList().ToPagedList(sayfa, 7);
            return View(urunler);
        }

        public ActionResult Urunekle()
        {
            List<SelectListItem> kategoriler = (from i in db.tbl_kategori.ToList()
                                                select new SelectListItem
                                                {
                            Text = i.KategoriAd,
                            Value = i.KategoriID.ToString()
                                                }).ToList();

            ViewBag.ktgr=kategoriler;
            return View();

        }

        [HttpPost]

        public ActionResult Urunekle(tbl_urun p1)
        {
            if (p1.Urunad==null ||p1.UrunFiyat==null || p1.UrunStok==null ||p1.Marka==null) { 
            List<SelectListItem> kategoriler = (from i in db.tbl_kategori.ToList()
                                                select new SelectListItem
                                                {
                                       Text = i.KategoriAd,
                                Value = i.KategoriID.ToString()
                                                }).ToList();

            ViewBag.ktgr = kategoriler;
            return View();
            }
            else
            {
                var ktg=db.tbl_kategori.Where(m=>m.KategoriID==p1.tbl_kategori.KategoriID).FirstOrDefault();
                p1.tbl_kategori=ktg;
                db.tbl_urun.Add(p1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

        }
    }
}