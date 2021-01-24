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
    public class IndexModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public IndexModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        public IList<Models.Rating> Rating { get;set; }

        public async Task OnGetAsync()
        {
            Rating = await _context.Ratings
                .Include(r => r.Department).ToListAsync();
        }
    }
}
