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
    /// Validation pour la requête <see cref="GenPersonneProfil"/>.
    /// </summary>
    public partial class GenPersonneProfilValidator : AbstractValidator<GenPersonneProfil>
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe <see cref="GenPersonneProfilValidator" />.
        /// </summary>
        public GenPersonneProfilValidator()
        {
            RuleFor(x => x.CodProfil)
                .NotEmpty()
                .Length(0, 100);

            SetRules();
        }
        
        /// <summary>
        /// Définit des règles de validation supplémentaires.
        /// </summary>
        partial void SetRules();
    }
}