using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EmployeeAppraisal.Models;

namespace EmployeeAppraisal.Pages.Increment
{
    public class EditModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public EditModel(EmployeeAppraisal.Models.PayrollContext context)
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
           ViewData["DepartmentId"] = new SelectList(_context.Departments, "Id", "DepartmentName");
           ViewData["GradeId"] = new SelectList(_context.Grades, "Id", "GradeName");
           ViewData["RatingId"] = new SelectList(_context.Ratings, "Id", "RatingValue");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Appraisal).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AppraisalExists(Appraisal.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool AppraisalExists(int id)
        {
            return _context.Appraisals.Any(e => e.Id == id);
        }
    }
}
