using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Shelter.Model.Models
{
    public class Animal
    {
        [Key]
        public int AnimalID { get; set; }

        public string AnimalType { get; set; }
        public string AnimalGender { get; set; }
        public int AnimalAge { get; set; }
        [ForeignKey("AnimalParent")]
        public int ParentID { get; set; }
        public virtual AnimalParent AnimalParents { get; set; }
    }
}
