using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class DepartmentPayComponent
    {
        public int Id { get; set; }
        public int DepartmentId { get; set; }
        public int ComponentId { get; set; }
        public bool? Active { get; set; }

        public virtual PayComponent Component { get; set; }
        public virtual Department Department { get; set; }
    }
}
