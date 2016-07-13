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

namespace Tmpi.Pyrene.Core.Models.Entities
{
    using Tmpi.Pyrene.Core.Models.Enums;

    // Personne
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.21.1.0")]
    public class Personne
    {
        public int ClePersonne { get; set; } // ClePersonne (Primary key)
        public string CodPersonne { get; set; } // CodPersonne (length: 100)
        public string NomPersonne { get; set; } // NomPersonne (length: 100)
        public string PrePersonne { get; set; } // PrePersonne (length: 100)
        public string TxtPersonne { get; set; } // TxtPersonne (length: 500)
        public bool EstActif { get; set; } // EstActif
        public System.DateTime DatCreation { get; set; } // DatCreation
        public System.DateTime DatModif { get; set; } // DatModif
        public string CodExterne { get; set; } // CodExterne (length: 100)
        public TypGenre? TypGenre { get; set; } // TypGenre
        public string NumTelep { get; set; } // NumTelep (length: 25)
        public string NumEmail { get; set; } // NumEmail (length: 100)

        // Reverse navigation
        [Newtonsoft.Json.JsonIgnore]
        public virtual PersonneSignature PersonneSignature { get; set; } // PersonneSignature.FK_PersonneSignature_ClePersonne
        [Newtonsoft.Json.JsonIgnore]
        public virtual System.Collections.Generic.ICollection<MandatMandataire> MandatMandataire { get; set; } // MandatMandataire.FK_MandatMandataire_ClePersonne
        [Newtonsoft.Json.JsonIgnore]
        public virtual System.Collections.Generic.ICollection<PersonneProfil> PersonneProfil { get; set; } // PersonneProfil.FK_PersonneProfil_ClePersonne

        public Personne()
        {
            MandatMandataire = new System.Collections.Generic.List<MandatMandataire>();
            PersonneProfil = new System.Collections.Generic.List<PersonneProfil>();
        }
    }

}
// </auto-generated>
