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
    /// Validation pour la requête <see cref="GenTVA"/>.
    /// </summary>
    public partial class GenTVAValidator : AbstractValidator<GenTVA>
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe <see cref="GenTVAValidator" />.
        /// </summary>
        public GenTVAValidator()
        {
            RuleFor(x => x.CodObjet)
                .NotEmpty()
                .Length(0, 100);
            RuleFor(x => x.LibObjet)
                .NotEmpty()
                .Length(0, 200);
            RuleFor(x => x.TxtObjet)
                .Length(0, 500);
            RuleFor(x => x.CodExterne)
                .Length(0, 100);

            SetRules();
        }
        
        /// <summary>
        /// Définit des règles de validation supplémentaires.
        /// </summary>
        partial void SetRules();
    }
}
