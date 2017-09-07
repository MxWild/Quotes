using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Quotes;

namespace Quotes.Controllers
{
    public class QuotesController : Controller
    {
        private QuotesDBModelContainer db = new QuotesDBModelContainer();

        // GET: Quotes
        public ActionResult Index()
        {
            var quotesSet = db.QuotesSet.Include(q => q.Category);
            return View(quotesSet.ToList());
        }

        // GET: Quotes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Quotes quotes = db.QuotesSet.Find(id);
            if (quotes == null)
            {
                return HttpNotFound();
            }
            return View(quotes);
        }

        // GET: Quotes/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.CategoriesSet, "CategoryId", "CategoryName");
            return View();
        }

        // POST: Quotes/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "QuoteId,QuoteText,DateAdded,NameOfAuthor,CategoryId")] Quotes quotes)
        {
            if (ModelState.IsValid)
            {
                db.QuotesSet.Add(quotes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.CategoriesSet, "CategoryId", "CategoryName", quotes.CategoryId);
            return View(quotes);
        }

        // GET: Quotes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Quotes quotes = db.QuotesSet.Find(id);
            if (quotes == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.CategoriesSet, "CategoryId", "CategoryName", quotes.CategoryId);
            return View(quotes);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "QuoteId,QuoteText,DateAdded,NameOfAuthor,CategoryId")] Quotes quotes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(quotes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.CategoriesSet, "CategoryId", "CategoryName", quotes.CategoryId);
            return View(quotes);
        }

        // GET: Quotes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Quotes quotes = db.QuotesSet.Find(id);
            if (quotes == null)
            {
                return HttpNotFound();
            }
            return View(quotes);
        }

        // POST: Quotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Quotes quotes = db.QuotesSet.Find(id);
            db.QuotesSet.Remove(quotes);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
