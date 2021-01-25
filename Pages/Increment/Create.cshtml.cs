using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using EmployeeAppraisal.Models;

namespace EmployeeAppraisal.Pages.Increment
{
    public class CreateModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public CreateModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            ViewData["DepartmentId"] = new SelectList(_context.Departments, "Id", "DepartmentName");
            // Departments = new SelectList(_context.Departments, "Id", "DepartmentName");
            ViewData["GradeId"] = new SelectList(_context.Grades, "Id", "GradeName");
            ViewData["RatingId"] = new SelectList(_context.Ratings, "Id", "RatingValue");
            return Page();
        }

        [BindProperty]
        public Appraisal Appraisal { get; set; }
        public SelectList Departments { get; set; }
        [BindProperty(SupportsGet =true)]
        public int DepartmentId { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Appraisals.Add(Appraisal);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }

        //public JsonResult OnGetGradesAndRatings()
        //{
        //    var grades = _context.Grades.Where(g => g.DepartmentId == DepartmentId);
        //    var ratings = _context.Ratings.Where(r => r.DepartmentId == DepartmentId);
        //    return new JsonResult(new { grades, ratings });
        //}
    }
}
