using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class Department
    {
        public Department()
        {
            Appraisals = new HashSet<Appraisal>();
            DepartmentPayComponents = new HashSet<DepartmentPayComponent>();
            EmployeeSalaries = new HashSet<EmployeeSalary>();
            Grades = new HashSet<Grade>();
            Ratings = new HashSet<Rating>();
        }

        public int Id { get; set; }
        public string DepartmentName { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Appraisal> Appraisals { get; set; }
        public virtual ICollection<DepartmentPayComponent> DepartmentPayComponents { get; set; }
        public virtual ICollection<EmployeeSalary> EmployeeSalaries { get; set; }
        public virtual ICollection<Grade> Grades { get; set; }
        public virtual ICollection<Rating> Ratings { get; set; }
    }
}
