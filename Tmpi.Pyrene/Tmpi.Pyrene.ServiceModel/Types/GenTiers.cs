// <auto-generated />
// This file was generated by a T4 template.
// Don't change it directly as your change would get overwritten.  Instead, make changes
// to the .tt file (i.e. the T4 template) and save it to regenerate this file.

// Make sure the compiler doesn't complain about missing Xml comments
#pragma warning disable 1591

using System;

using ServiceStack.DataAnnotations;
using ServiceStack.Model;
using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel.Types
{
    public partial class GenTiers 
    {
        [AutoIncrement]
		[PrimaryKey]
        public int CleTiers { get; set;}
        [Required]
        public string NumTiers { get; set;}
        [Required]
        public string NomTiers { get; set;}
        public string TxtTiers { get; set;}
        [Required]
        public bool EstActif { get; set;}
        [Required]
        public DateTime DatCreation { get; set;}
        [Required]
        public DateTime DatModif { get; set;}
        public string CodExterne { get; set;}
        public string AdrRue { get; set;}
        public string AdrCode { get; set;}
        public string AdrVille { get; set;}
        public string AdrPays { get; set;}
        public decimal? AdrLatitude { get; set;}
        public decimal? AdrLongitude { get; set;}
        public string NumTelep { get; set;}
        public string NumFax { get; set;}
        public string NumEmail { get; set;}
        public string CodCompta { get; set;}
        public string NumInsee { get; set;}
        [Required]
        public short CleTypIdent { get; set;}
        public string AdrVilleSuite { get; set;}
        public short? CleCivilite { get; set;}
        public short? CleLangue { get; set;}
        public int? ClePointP { get; set;}
        public short? ClePropriete1 { get; set;}
        public short? ClePropriete2 { get; set;}
        public short? ClePropriete3 { get; set;}
    }

}
#pragma warning restore 1591
