using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configurations
{
    public class UseCaseLogConfiguration : IEntityTypeConfiguration<UseCaseLog>
    {

        public void Configure(EntityTypeBuilder<UseCaseLog> builder)
        {
            builder.Property(x => x.UseCaseName).IsRequired();
            builder.Property(x => x.Data).IsRequired();
            builder.Property(x => x.Actor).IsRequired();

        }
    }
}
