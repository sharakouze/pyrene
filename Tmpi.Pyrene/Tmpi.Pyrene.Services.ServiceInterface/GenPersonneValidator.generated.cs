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
    /// Validation pour la requête <see cref="GenPersonne"/>.
    /// </summary>
    public partial class GenPersonneValidator : AbstractValidator<GenPersonne>
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe <see cref="GenPersonneValidator" />.
        /// </summary>
        public GenPersonneValidator()
        {
            RuleFor(x => x.CodObjet).NotEmpty();
            RuleFor(x => x.CodObjet).Length(0, 100);

            RuleFor(x => x.NomPersonne).NotEmpty();
            RuleFor(x => x.NomPersonne).Length(0, 100);

            RuleFor(x => x.PrePersonne).Length(0, 100);

            RuleFor(x => x.TxtObjet).Length(0, 500);

            RuleFor(x => x.CodExterne).Length(0, 100);

            RuleFor(x => x.NumTelep).Length(0, 25);

            RuleFor(x => x.NumFax).Length(0, 25);

            RuleFor(x => x.NumEmail).Length(0, 100);
            RuleFor(x => x.NumEmail).EmailAddress();

            SetRules();
        }
        
        partial void SetRules();
    }
}
