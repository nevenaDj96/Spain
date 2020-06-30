using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {
            builder.HasIndex(x => x.Heading).IsUnique();
            builder.Property(x => x.Heading).HasMaxLength(50).IsRequired();
            builder.Property(x => x.CreatedAt).HasDefaultValueSql("GETDATE()");
            builder.Property(x => x.Text).HasMaxLength(600).IsRequired();

            builder.Property(x => x.IsActive).HasDefaultValue(true);
            builder.Property(x => x.IsDeleted).HasDefaultValue(false);

            builder.HasOne(x => x.User).WithMany(u => u.Posts).HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.Picture).WithMany(p => p.Posts).HasForeignKey(x => x.PictureId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.Category).WithMany(c => c.Posts).HasForeignKey(x => x.CategoryId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.Likes).WithOne(l => l.Post).HasForeignKey(l => l.PostId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.Comments).WithOne(com => com.Post).HasForeignKey(com => com.PostId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
