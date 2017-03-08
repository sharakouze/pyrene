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
	/// Validation pour la requête <see cref="Fourn"/>.
	/// </summary>
	public partial class FournValidator : AbstractValidator<Fourn>
	{
		/// <summary>
		/// Initialise une nouvelle instance de la classe <see cref="FournValidator" />.
		/// </summary>
		public FournValidator()
		{
			RuleFor(x => x.CodFourn)
				.NotEmpty()
				.Length(0, 100);
			RuleFor(x => x.LibFourn)
				.NotEmpty()
				.Length(0, 200);
			RuleFor(x => x.TxtFourn)
				.Length(0, 500);
			RuleFor(x => x.CodExterne)
				.Length(0, 100);
			RuleFor(x => x.AdrRue)
				.Length(0, 200);
			RuleFor(x => x.AdrCode)
				.Length(0, 10);
			RuleFor(x => x.AdrCommune)
				.Length(0, 100);
			RuleFor(x => x.AdrPays)
				.Length(0, 100);
			RuleFor(x => x.NumTelep)
				.Length(0, 25);
			RuleFor(x => x.NumFax)
				.Length(0, 25);
			RuleFor(x => x.NumEmail)
				.Length(0, 100)
				.EmailAddress();
			RuleFor(x => x.CodCompta)
				.Length(0, 100);
			RuleFor(x => x.NumClient)
				.Length(0, 100);
			RuleFor(x => x.NumTVAIntra)
				.Length(0, 25);

			SetRules();
		}

		/// <summary>
		/// Définit des règles de validation supplémentaires.
		/// </summary>
		partial void SetRules();
	}

	/// <summary>
	/// Validation pour la requête <see cref="FournBanque"/>.
	/// </summary>
	public partial class FournBanqueValidator : AbstractValidator<FournBanque>
	{
		/// <summary>
		/// Initialise une nouvelle instance de la classe <see cref="FournBanqueValidator" />.
		/// </summary>
		public FournBanqueValidator()
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