using MVCSatisTakip.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCSatisTakip.Controllers
{
    public class SatisController : Controller
    {
        // GET: Satis
        satistakipEntities db=new satistakipEntities();
        public ActionResult Index(int sayfa=1)
        {
            var satis = db.tbl_satis.ToList().ToPagedList(sayfa, 7);
            return View(satis);
        }
        public ActionResult Sil(int id)
        {
            var satis = db.tbl_satis.Find(id);
            db.tbl_satis.Remove(satis);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult satisekle() /*=> View();*/
        {
            List<SelectListItem> musteriler = (from i in db.tbl_musteri.ToList()
                                                select new SelectListItem
                                                {
                                Text = i.MusteriAdsoyad,
                      Value = i.MusteriID.ToString()
                                                }).ToList();

            List<SelectListItem> urunler = (from i in db.tbl_urun.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.Urunad,
                                                Value = i.UrunID.ToString()
                                            }).ToList();


            ViewBag.mus = musteriler;
            ViewBag.urn = urunler;
            return View();

        }

        [HttpPost]
        public ActionResult satisekle(tbl_satis s)
        {
            var prod = db.tbl_urun.Find(s.tbl_urun.UrunID);
            if (s.Satisadet <= prod.UrunStok)
            {
                if(s.Satisadet==null || s.SatisFiyat==null ||  s.Satistarih==null)
                {
                    List<SelectListItem> musteriler = (from i in db.tbl_musteri.ToList()
                                                       select new SelectListItem
                                                       {
                                                           Text = i.MusteriAdsoyad,
                                                           Value = i.MusteriID.ToString()
                                                       }).ToList();

                    List<SelectListItem> urunler = (from i in db.tbl_urun.ToList()
                                                    select new SelectListItem
                                                    {
                                                        Text = i.Urunad,
                                                        Value = i.UrunID.ToString()
                                                    }).ToList();


                    ViewBag.mus = musteriler;
                    ViewBag.urn = urunler;
                    return View();
                }
                else
                {
                 var must = db.tbl_musteri.Where(x => x.MusteriID == s.tbl_musteri.MusteriID).FirstOrDefault();
                 s.tbl_musteri = must;

                 var urn = db.tbl_urun.Where(x => x.UrunID == s.tbl_urun.UrunID).FirstOrDefault();
                    s.tbl_urun = urn;
                    db.tbl_satis.Add(s);
                    db.SaveChanges();

                    return RedirectToAction("Index");

                }

                
            }
            return View(s);
        }

        public ActionResult satisgetir(int id)
        {
            var a = db.tbl_satis.Find(id);
            List<SelectListItem> musteriler = (from i in db.tbl_musteri.ToList()
                                               select new SelectListItem
                                               {
                                      Text = i.MusteriAdsoyad,
                                  Value = i.MusteriID.ToString()
                                               }).ToList();

            List<SelectListItem> urunler = (from i in db.tbl_urun.ToList()
                                            select new SelectListItem
                                            {
                                    Text = i.Urunad,
                                    Value = i.UrunID.ToString()
                                            }).ToList();


            ViewBag.mus = musteriler;
            ViewBag.urn = urunler;

            return View("satisgetir",a);
        }

        public ActionResult Guncelle(tbl_satis p1)
        {
            var sts = db.tbl_satis.Find(p1.SatisID);
            var must = db.tbl_musteri.Where(x => x.MusteriID == p1.tbl_musteri.MusteriID).FirstOrDefault();
            sts.Musteri = must.MusteriID; // değişen

            var urn = db.tbl_urun.Where(x => x.UrunID == p1.tbl_urun.UrunID).FirstOrDefault();
            sts.Urun = urn.UrunID; //değişen
            sts.Satisadet = p1.Satisadet;
            sts.SatisFiyat = p1.SatisFiyat;
            if (p1.Satistarih == null)
                sts.Satistarih = DateTime.Now;
            else { 
            sts.Satistarih = p1.Satistarih;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public int GetFiyat(int id)
        {
            int fiyat = (int)db.tbl_urun.Find(id).UrunFiyat;
            return fiyat;
        }
    }
}