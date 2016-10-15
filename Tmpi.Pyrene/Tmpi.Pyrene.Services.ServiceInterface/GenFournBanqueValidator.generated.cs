//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using ServiceStack.FluentValidation;
using Tmpi.Pyrene.Services.ServiceModel;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
    /// <summary>
    /// Validation pour la requête <see cref="GenFournBanque"/>.
    /// </summary>
    public partial class GenFournBanqueValidator : AbstractValidator<GenFournBanque>
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe <see cref="GenFournBanqueValidator" />.
        /// </summary>
        public GenFournBanqueValidator()
        {
            RuleFor(x => x.CodIBAN)
                .NotEmpty()
                .Length(0, 34);
            RuleFor(x => x.CodBIC)
                .NotEmpty()
                .Length(0, 11);
            RuleFor(x => x.LibEtablissement)
                .NotEmpty()
                .Length(0, 200);

            SetRules();
        }
        
        /// <summary>
        /// Définit des règles de validation supplémentaires.
        /// </summary>
        partial void SetRules();
    }
}
