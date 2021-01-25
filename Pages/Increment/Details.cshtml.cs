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
    public class DetailsModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public DetailsModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

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
    }
}
