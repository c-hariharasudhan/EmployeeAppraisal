using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class Employee
    {
        public Employee()
        {
            EmployeeAppraisals = new HashSet<EmployeeAppraisal>();
            EmployeeSalaries = new HashSet<EmployeeSalary>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Dob { get; set; }
        public DateTime Doj { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<EmployeeAppraisal> EmployeeAppraisals { get; set; }
        public virtual ICollection<EmployeeSalary> EmployeeSalaries { get; set; }
    }
}
