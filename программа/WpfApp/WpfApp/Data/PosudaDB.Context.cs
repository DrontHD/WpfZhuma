﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PosudaDBEntities : DbContext
    {
        public PosudaDBEntities()
            : base("name=PosudaDBEntities")
        {
        }

        public static PosudaDBEntities _context;

        public static PosudaDBEntities GetContext()
        {
            if (_context == null)
            {
                _context = new PosudaDBEntities();
            } return _context;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Manufacturer> Manufacturer { get; set; }
        public virtual DbSet<OrderInformation> OrderInformation { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<PointsIssuance> PointsIssuance { get; set; }
        public virtual DbSet<ProductCategory> ProductCategory { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Staff> Staff { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Warehouse> Warehouse { get; set; }
    }
}
