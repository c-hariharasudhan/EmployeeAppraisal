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
    public class IndexModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public IndexModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        public IList<Appraisal> Appraisal { get;set; }

        public async Task OnGetAsync()
        {
            Appraisal = await _context.Appraisals
                .Include(a => a.Department)
                .Include(a => a.Grade)
                .Include(a => a.Rating).ToListAsync();
        }
    }
}
