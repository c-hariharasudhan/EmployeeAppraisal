using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace EmployeeAppraisal.Pages.Employee
{
    public class IndexModel : PageModel
    {
        private readonly EmployeeAppraisal.Models.PayrollContext _context;

        public IndexModel(EmployeeAppraisal.Models.PayrollContext context)
        {
            _context = context;
        }

        public IList<EmployeeAppraisal.Models.Employee> Employee { get;set; }

        public async Task OnGetAsync()
        {
            Employee = await _context.Employees.ToListAsync();
        }
    }
}
