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

    // Mandat
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.21.1.0")]
    public class Mandat
    {
        public int CleMandat { get; set; } // CleMandat (Primary key)
        public string CodMandat { get; set; } // CodMandat (length: 100)
        public string LibMandat { get; set; } // LibMandat (length: 200)
        public string TxtMandat { get; set; } // TxtMandat (length: 500)
        public bool EstActif { get; set; } // EstActif
        public System.DateTime DatCreation { get; set; } // DatCreation
        public System.DateTime DatModif { get; set; } // DatModif
        public string CodExterne { get; set; } // CodExterne (length: 100)
        public byte TypMandat { get; set; } // TypMandat
        public byte NivMandat { get; set; } // NivMandat
        public byte NbrSignature { get; set; } // NbrSignature
        public string TxtMessage { get; set; } // TxtMessage

        // Reverse navigation
        [Newtonsoft.Json.JsonIgnore]
        public virtual System.Collections.Generic.ICollection<MandatMandataire> MandatMandataire { get; set; } // MandatMandataire.FK_MandatMandataire_CleMandat

        public Mandat()
        {
            MandatMandataire = new System.Collections.Generic.List<MandatMandataire>();
        }
    }

}
// </auto-generated>