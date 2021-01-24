using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class PayComponent
    {
        public PayComponent()
        {
            DepartmentPayComponents = new HashSet<DepartmentPayComponent>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Value { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<DepartmentPayComponent> DepartmentPayComponents { get; set; }
    }
}
