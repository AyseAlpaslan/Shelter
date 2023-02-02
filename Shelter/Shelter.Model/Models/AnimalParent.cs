using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Shelter.Model.Models
{
    public class AnimalParent
    {
        [Key]
        public int ParentID { get; set; }
      
        public string ParentName { get; set; }
        public string ParentSurname { get; set; }
        public string ParentJob { get; set; }
        public int ParentAge { get; set; }
        public string ParentPhone { get; set; }
        public virtual List<Animal> Animals { get; set; } = new List<Animal>();



    }
}
