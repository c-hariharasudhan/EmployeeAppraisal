using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using EmployeeAppraisal.Models;

namespace EmployeeAppraisal.Pages.Increment
{
    public class DeleteModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public DeleteModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Appraisal Appraisal { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Appraisal = await _context.Appraisals
                .Include(a => a.Department)
                .Include(a => a.Grade)
                .Include(a => a.Rating).FirstOrDefaultAsync(m => m.Id == id);

            if (Appraisal == null)
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

            Appraisal = await _context.Appraisals.FindAsync(id);

            if (Appraisal != null)
            {
                _context.Appraisals.Remove(Appraisal);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
