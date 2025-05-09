using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using WebApplication.Models;

namespace WebApplication.Controllers
{
    public class ContactController : Controller
    {

        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: Contact
        public ActionResult Index(string search, int page = 1)
        {
            int pageSize = 10;
            var query = db.ContactMessages.AsQueryable();

            if (!string.IsNullOrWhiteSpace(search))
            {
                query = query.Where(m => m.Name.Contains(search) || m.Email.Contains(search) || m.Message.Contains(search));
            }

            var messages = query
                            .OrderByDescending(m => m.DateMessage)
                            .Skip((page - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();

            int totalMessages = query.Count();
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalMessages / pageSize);
            ViewBag.CurrentPage = page;
            ViewBag.Search = search;
            return View(messages);
        }

        // GET: Contact/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Contact/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contact/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ContactMessage model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.ContactMessages.Add(model);
                    db.SaveChanges();

                    ViewBag.Message = "Thank you for contacting us!";
                    return View("Success");
                }

                return View(model);
            }
            catch
            {
                return View(model);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


        // GET: Contact/Edit/5
        public ActionResult Edit(int id)
        {
            var message = db.ContactMessages.Find(id);
            if (message == null)
            {
                return HttpNotFound();
            }
            return View(message);
        }

        // POST: Contact/Edit/5
        [HttpPost]
        public ActionResult Edit(ContactMessage model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(model).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(model);
            }
            catch
            {
                return View();
            }
        }

        // GET: Contact/Delete/5
        public ActionResult Delete(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }

            var contact = db.ContactMessages.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }

            return View(contact);
        }

        // POST: Contact/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {

                var contact = db.ContactMessages.Find(id);
                if (contact != null)
                {
                    db.ContactMessages.Remove(contact);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
