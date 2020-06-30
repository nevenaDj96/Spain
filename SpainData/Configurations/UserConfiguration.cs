using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
   public class UserConfiguration : IEntityTypeConfiguration<User>
    {

        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.UserName).HasMaxLength(20).IsRequired();

            builder.HasIndex(x => x.UserName).IsUnique();
            
            builder.Property(x => x.RoleId).IsRequired();

            builder.Property(x => x.Password).HasMaxLength(30).IsRequired();
            builder.Property(x => x.LastName).HasMaxLength(30).IsRequired();
            builder.Property(x => x.FirstName).HasMaxLength(30).IsRequired();
            builder.Property(x => x.Email).HasMaxLength(40).IsRequired();
            builder.HasIndex(x => x.Email).IsUnique();

            builder.Property(x => x.CreatedAt).HasDefaultValueSql("GETDATE()");

            builder.Property(x => x.IsActive).HasDefaultValue(true);
            builder.Property(x => x.IsDeleted).HasDefaultValue(false);

            builder.HasOne(x => x.Role).WithMany(r => r.Users).HasForeignKey(x => x.RoleId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.Posts).WithOne(p => p.User).HasForeignKey(p => p.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.LikeComms).WithOne(lc => lc.User).HasForeignKey(lc => lc.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.Likes).WithOne( l=> l.User).HasForeignKey(l => l.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.Comments).WithOne(c => c.User).HasForeignKey(c => c.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.UserUseCases).WithOne(c => c.User).HasForeignKey(c => c.UserId).OnDelete(DeleteBehavior.Restrict);

        }
    }
}
