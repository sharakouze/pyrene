// <auto-generated>
// ReSharper disable ConvertPropertyToExpressionBody
// ReSharper disable DoNotCallOverridableMethodsInConstructor
// ReSharper disable InconsistentNaming
// ReSharper disable PartialMethodWithSinglePart
// ReSharper disable PartialTypeWithSinglePart
// ReSharper disable RedundantNameQualifier
// ReSharper disable RedundantOverridenMember
// ReSharper disable UseNameofExpression
// TargetFrameworkVersion = 4.61
#pragma warning disable 1591    //  Ignore "Missing XML Comment" warning

namespace Tmpi.Pyrene.Core.Data
{
    using Tmpi.Pyrene.Core.Models.Entities;

    // Societe
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.21.1.0")]
    public class SocieteConfiguration : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Societe>
    {
        public SocieteConfiguration()
            : this("CORE")
        {
        }

        public SocieteConfiguration(string schema)
        {
            ToTable(schema + ".Societe");
            HasKey(x => x.CleSociete);

            Property(x => x.CleSociete).HasColumnName(@"CleSociete").IsRequired().HasColumnType("int").HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.Identity);
            Property(x => x.CodSociete).HasColumnName(@"CodSociete").IsRequired().IsUnicode(false).HasColumnType("varchar").HasMaxLength(100);
            Property(x => x.LibSociete).HasColumnName(@"LibSociete").IsRequired().IsUnicode(false).HasColumnType("varchar").HasMaxLength(200);
            Property(x => x.TxtSociete).HasColumnName(@"TxtSociete").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(500);
            Property(x => x.EstActif).HasColumnName(@"EstActif").IsRequired().HasColumnType("bit");
            Property(x => x.DatCreation).HasColumnName(@"DatCreation").IsRequired().HasColumnType("datetime");
            Property(x => x.DatModif).HasColumnName(@"DatModif").IsRequired().HasColumnType("datetime");
            Property(x => x.CodExterne).HasColumnName(@"CodExterne").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(100);
            Property(x => x.AdrRue).HasColumnName(@"AdrRue").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(200);
            Property(x => x.AdrCode).HasColumnName(@"AdrCode").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(10);
            Property(x => x.AdrVille).HasColumnName(@"AdrVille").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(100);
            Property(x => x.AdrPays).HasColumnName(@"AdrPays").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(100);
            Property(x => x.NumTelep).HasColumnName(@"NumTelep").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(25);
            Property(x => x.NumFax).HasColumnName(@"NumFax").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(25);
            Property(x => x.NumEmail).HasColumnName(@"NumEmail").IsOptional().IsUnicode(false).HasColumnType("varchar").HasMaxLength(100);
        }
    }

}
// </auto-generated>
