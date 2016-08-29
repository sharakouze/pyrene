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
    public partial class GenPersonneProfil : IHasId<int> 
    {
        [Alias("Id")]
        [AutoIncrement]
        public int Id { get; set;}
         [References(typeof(GenPersonne))]          
        [Required]
        public int CleGenPersonne { get; set;}
        [Required]
        public string CodProfil { get; set;}
         [References(typeof(GenSociete))]          
        public int? CleGenSociete { get; set;}
         [References(typeof(GenSecteur))]          
        public int? CleGenSecteur { get; set;}
         [References(typeof(GenService))]          
        public int? CleGenService { get; set;}
    }

}
#pragma warning restore 1591
