using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using EmployeeAppraisal.Models;

namespace EmployeeAppraisal.Pages.Rating
{
    public class DeleteModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public DeleteModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Models.Rating Rating { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Rating = await _context.Ratings
                .Include(r => r.Department).FirstOrDefaultAsync(m => m.Id == id);

            if (Rating == null)
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

            Rating = await _context.Ratings.FindAsync(id);

            if (Rating != null)
            {
                _context.Ratings.Remove(Rating);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
