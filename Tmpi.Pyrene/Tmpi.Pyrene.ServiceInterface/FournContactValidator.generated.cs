//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using ServiceStack.FluentValidation;
using Tmpi.Pyrene.ServiceModel;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceInterface
{
	/// <summary>
	/// Validation pour la requête <see cref="FournContact"/>.
	/// </summary>
	public partial class FournContactValidator : AbstractValidator<FournContact>
	{
		/// <summary>
		/// Initialise une nouvelle instance de la classe <see cref="FournContactValidator" />.
		/// </summary>
		public FournContactValidator()
		{
			RuleFor(x => x.NomContact)
				.NotEmpty()
				.Length(0, 100);
			RuleFor(x => x.PreContact)
				.Length(0, 100);
			RuleFor(x => x.TxtContact)
				.Length(0, 500);
			RuleFor(x => x.NumTelep)
				.Length(0, 25);
			RuleFor(x => x.NumFax)
				.Length(0, 25);
			RuleFor(x => x.NumEmail)
				.Length(0, 100)
				.EmailAddress();
			RuleFor(x => x.LibFonction)
				.Length(0, 100);

			SetRules();
		}

		/// <summary>
		/// Définit des règles de validation supplémentaires.
		/// </summary>
		partial void SetRules();
	}
}
