using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class EmployeeSalary
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int DepartmentId { get; set; }
        public int GradeId { get; set; }
        public decimal Basic { get; set; }
        public bool? Active { get; set; }

        public virtual Department Department { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Grade Grade { get; set; }
    }
}
