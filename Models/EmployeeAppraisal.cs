using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class EmployeeAppraisal
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int AppraisalId { get; set; }
        public bool? Active { get; set; }

        public virtual Appraisal Appraisal { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
