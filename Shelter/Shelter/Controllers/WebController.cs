using Microsoft.AspNetCore.Mvc;

namespace Shelter.Controllers
{
    public class WebController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
