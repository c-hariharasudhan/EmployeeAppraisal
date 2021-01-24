using System;
using System.Collections.Generic;

#nullable disable

namespace EmployeeAppraisal.Models
{
    public partial class Rating
    {
        public Rating()
        {
            Appraisals = new HashSet<Appraisal>();
        }

        public int Id { get; set; }
        public string RatingValue { get; set; }
        public int DepartmentId { get; set; }
        public int Rank { get; set; }
        public bool? Active { get; set; }

        public virtual Department Department { get; set; }
        public virtual ICollection<Appraisal> Appraisals { get; set; }
    }
}
