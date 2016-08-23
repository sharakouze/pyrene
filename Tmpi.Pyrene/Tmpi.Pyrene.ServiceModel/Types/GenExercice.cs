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
    public partial class GenExercice 
    {
        [AutoIncrement]
		[PrimaryKey]
        public int CleExercice { get; set;}
        [Required]
        public string CodExercice { get; set;}
        [Required]
        public string LibExercice { get; set;}
        public string TxtExercice { get; set;}
        [Required]
        public bool EstActif { get; set;}
        [Required]
        public DateTime DatCreation { get; set;}
        [Required]
        public DateTime DatModif { get; set;}
        public string CodExterne { get; set;}
        [Required]
        public DateTime DatDebut { get; set;}
        [Required]
        public DateTime DatFin { get; set;}
    }

}
#pragma warning restore 1591
