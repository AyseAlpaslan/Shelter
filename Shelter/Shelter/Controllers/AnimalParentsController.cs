using Microsoft.AspNetCore.Mvc;
using Shelter.Data.Data;
using Shelter.Model.Models;
using System.Linq;
using System.Threading.Tasks;

namespace Shelter.Controllers
{
    public class AnimalParentsController : Controller
    {
    
        private readonly ApplicationDbContext _db;

        public AnimalParentsController(ApplicationDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            var objList = _db.AnimalParents.ToList();
            return View(objList);
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(AnimalParent obj)
        {
            if (ModelState.IsValid)
            {
                _db.Add(obj);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var ob = await _db.AnimalParents.FindAsync(id);
            return View(ob);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(AnimalParent ob)
        {
            if (ModelState.IsValid)
            {
                _db.Update(ob);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(ob);
        }
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var ob = await _db.AnimalParents.FindAsync(id);
            return View(ob);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            var obj = await _db.AnimalParents.FindAsync(id);
            _db.AnimalParents.Remove(obj);
            await _db.SaveChangesAsync();
            return RedirectToAction("Index");
        }






    }
}
