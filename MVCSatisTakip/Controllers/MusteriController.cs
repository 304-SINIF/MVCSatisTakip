using MVCSatisTakip.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCSatisTakip.Controllers
{
    public class MusteriController : Controller
    {
        // GET: Musteri
        satistakipEntities db = new satistakipEntities();
        public ActionResult Index(int sayfa=1)
        {
            var musteriler = db.tbl_musteri.ToList().ToPagedList(sayfa, 7);
            return View(musteriler);
        }

        public ActionResult Musteriekle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Musteriekle(tbl_musteri p1)
        {
            if (!ModelState.IsValid)
            {
                return View("Musteriekle");
            }
            var must = db.tbl_musteri.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Sil(int id)
        {
            var musteri=db.tbl_musteri.Find(id);
            db.tbl_musteri.Remove(musteri);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult musterigetir(int id)
        {
            var must = db.tbl_musteri.Find(id);
            return View("musterigetir", must);
        }

        public ActionResult Guncelle(tbl_musteri p1)
        {
            var must=db.tbl_musteri.Find(p1.MusteriID);
            must.TC = p1.TC;
            must.MusteriAdsoyad = p1.MusteriAdsoyad;
            must.Meslek = p1.Meslek;
            must.Sehir = p1.Sehir;
            must.Telno = p1.Telno;
            must.Adres = p1.Adres;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}