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
    }
}