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

    // SocieteService
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.21.1.0")]
    public class SocieteService
    {
        public int CleService { get; set; } // CleService (Primary key)
        public string CodService { get; set; } // CodService (length: 100)
        public string LibService { get; set; } // LibService (length: 200)
        public string TxtService { get; set; } // TxtService (length: 500)
        public bool EstActif { get; set; } // EstActif
        public System.DateTime DatCreation { get; set; } // DatCreation
        public System.DateTime DatModif { get; set; } // DatModif
        public string CodExterne { get; set; } // CodExterne (length: 100)
        public int CleSecteur { get; set; } // CleSecteur
        public string AdrRue { get; set; } // AdrRue (length: 200)
        public string AdrCode { get; set; } // AdrCode (length: 10)
        public string AdrVille { get; set; } // AdrVille (length: 100)
        public string AdrPays { get; set; } // AdrPays (length: 100)
        public string NumTelep { get; set; } // NumTelep (length: 25)
        public string NumFax { get; set; } // NumFax (length: 25)
        public string NumEmail { get; set; } // NumEmail (length: 100)

        // Reverse navigation
        public virtual System.Collections.Generic.ICollection<Compteur> Compteur { get; set; } // Compteur.FK_Compteur_CleService
        public virtual System.Collections.Generic.ICollection<MandatMandataire> MandatMandataire { get; set; } // MandatMandataire.FK_MandatMandataire_CleService
        public virtual System.Collections.Generic.ICollection<PersonneProfil> PersonneProfil { get; set; } // PersonneProfil.FK_PersonneProfil_CleService

        // Foreign keys
        [Newtonsoft.Json.JsonIgnore]
        public virtual SocieteSecteur SocieteSecteur { get; set; } // FK_SocieteService_CleSecteur

        public SocieteService()
        {
            Compteur = new System.Collections.Generic.List<Compteur>();
            MandatMandataire = new System.Collections.Generic.List<MandatMandataire>();
            PersonneProfil = new System.Collections.Generic.List<PersonneProfil>();
        }
    }

}
// </auto-generated>
