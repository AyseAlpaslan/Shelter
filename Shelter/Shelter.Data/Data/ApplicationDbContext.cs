using Microsoft.EntityFrameworkCore;
using Shelter.Model.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shelter.Data.Data
{
    public class ApplicationDbContext: DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Animal> Animals { get; set; }
        public DbSet<AnimalParent> AnimalParents{ get; set; }
        public object AnimalParent { get; set; }
    }
}
