//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using ServiceStack.FluentValidation;
using Tmpi.Pyrene.ServiceModel;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceInterface.Validators
{
	/// <summary>
	/// Validation pour la requête <see cref="TVA"/>.
	/// </summary>
	public partial class TVAValidator : AbstractValidator<TVA>
	{
		/// <summary>
		/// Initialise une nouvelle instance de la classe <see cref="TVAValidator" />.
		/// </summary>
		public TVAValidator()
		{
			RuleFor(x => x.CodTVA)
				.NotEmpty()
				.Length(0, 100);
			RuleFor(x => x.LibTVA)
				.NotEmpty()
				.Length(0, 200);
			RuleFor(x => x.TxtTVA)
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