using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using EmployeeAppraisal.Models;

namespace EmployeeAppraisal.Pages.Grade
{
    public class DeleteModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public DeleteModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Models.Grade Grade { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Grade = await _context.Grades
                .Include(g => g.Department).FirstOrDefaultAsync(m => m.Id == id);

            if (Grade == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Grade = await _context.Grades.FindAsync(id);

            if (Grade != null)
            {
                _context.Grades.Remove(Grade);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
