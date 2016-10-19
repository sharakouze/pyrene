using ServiceStack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Tmpi.Pyrene.Services.ServiceModel.Messages;

namespace Tmpi.Pyrene.UI.Controllers
{
    public class GenPersonneController : Controller
    {
        private readonly IServiceClient _client = ServiceClientFactory.Create();

        // GET: GenPersonne
        public async Task<ActionResult> Index()
        {
            var r = await _client.GetAsync(new GetGenPersonne() { ClePersonne = 1, Fields= new string[] { } });

            return View();
        }

        // GET: GenPersonne/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: GenPersonne/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GenPersonne/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: GenPersonne/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: GenPersonne/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: GenPersonne/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: GenPersonne/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
