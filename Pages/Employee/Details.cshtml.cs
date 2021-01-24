using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace EmployeeAppraisal.Pages.Employee
{
    public class DetailsModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public DetailsModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        public EmployeeAppraisal.Models.Employee Employee { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Employee = await _context.Employees.FirstOrDefaultAsync(m => m.Id == id);

            if (Employee == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
