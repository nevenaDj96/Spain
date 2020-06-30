using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
   public class PictureConfiguration : IEntityTypeConfiguration<Picture>
    {    

        public void Configure(EntityTypeBuilder<Picture> builder)
        {
            builder.Property(x => x.CreatedAt).HasDefaultValueSql("GETDATE()");
            builder.Property(x => x.Alt).HasMaxLength(350).IsRequired();
            builder.Property(x => x.Route).IsRequired();

            builder.Property(x => x.IsActive).HasDefaultValue(true);
            builder.Property(x => x.IsDeleted).HasDefaultValue(false);

            builder.HasMany(x => x.Posts).WithOne(p => p.Picture).HasForeignKey(p => p.PictureId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
