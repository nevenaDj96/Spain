using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class LikeCommConfiguration : IEntityTypeConfiguration<LikeComm>
    {
        public void Configure(EntityTypeBuilder<LikeComm> builder)
        {

            builder.Property(x => x.IsActive).HasDefaultValue(true);
            builder.Property(x => x.IsDeleted).HasDefaultValue(false);

            builder.HasOne(x => x.User).WithMany(u => u.LikeComms).HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.Comment).WithMany(c => c.likeComms).HasForeignKey(x => x.CommentId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
