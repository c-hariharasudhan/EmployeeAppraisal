using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class Appraisal
    {
        public Appraisal()
        {
            EmployeeAppraisals = new HashSet<EmployeeAppraisal>();
        }

        public int Id { get; set; }
        public int DepartmentId { get; set; }
        public int GradeId { get; set; }
        public int RatingId { get; set; }
        public int Year { get; set; }
        public int Increment { get; set; }
        public bool? Active { get; set; }

        public virtual Department Department { get; set; }
        public virtual Grade Grade { get; set; }
        public virtual Rating Rating { get; set; }
        public virtual ICollection<EmployeeAppraisal> EmployeeAppraisals { get; set; }
    }
}
