using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCSatisTakip.Models;
using PagedList;

namespace MVCSatisTakip.Controllers
{
    public class KategoriController : Controller
    {
        satistakipEntities db=new satistakipEntities();
        // GET: Kategori
        public ActionResult Index(int sayfa=1)
        {
            var kategori = db.tbl_kategori.ToList().ToPagedList(sayfa, 7);
            return View(kategori);
        }
        [HttpGet]
        public ActionResult Yenikategori()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Yenikategori(tbl_kategori p1)
        {
            if (!ModelState.IsValid)
            {
                return View("Yenikategori");
            }
            var ktg = db.tbl_kategori.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var kategori = db.tbl_kategori.Find(id);
            db.tbl_kategori.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult kategorigetir(int id)
        {
            var ktg=db.tbl_kategori.Find(id);
            return View("kategorigetir",ktg);
        }

        public ActionResult Guncelle(tbl_kategori p1)
        {
            var ktg = db.tbl_kategori.Find(p1.KategoriID);
            ktg.KategoriAd = p1.KategoriAd;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}