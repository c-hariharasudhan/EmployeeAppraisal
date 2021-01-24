using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using EmployeeAppraisal.Models;

namespace EmployeeAppraisal.Pages.Grade
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
            return Page();
        }

        [BindProperty]
        public Models.Grade Grade { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Grades.Add(Grade);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
