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
    /// Validation pour la requête <see cref="GenMandat"/>.
    /// </summary>
    public partial class GenMandatValidator : AbstractValidator<GenMandat>
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe <see cref="GenMandatValidator" />.
        /// </summary>
        public GenMandatValidator()
        {
            RuleFor(x => x.CodMandat)
                .NotEmpty()
                .Length(0, 100);
            RuleFor(x => x.LibMandat)
                .NotEmpty()
                .Length(0, 200);
            RuleFor(x => x.TxtMandat)
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