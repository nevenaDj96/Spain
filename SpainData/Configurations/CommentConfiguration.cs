using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x => x.CreatedAt).HasDefaultValueSql("GETDATE()");
            builder.Property(x => x.Text).HasMaxLength(350).IsRequired();

            builder.Property(x => x.IsActive).HasDefaultValue(true);
            builder.Property(x => x.IsDeleted).HasDefaultValue(false);

            builder.HasOne(x => x.User).WithMany(u => u.Comments).HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.Post).WithMany(p => p.Comments).HasForeignKey(x => x.PostId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.likeComms).WithOne(l => l.Comment).HasForeignKey(l => l.CommentId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
