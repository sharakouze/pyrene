//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using ServiceStack;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.Services.ServiceModel;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les ressources <see cref="GenPersonne" />.
	/// </summary>
	public partial class GenPersonneService : Service
	{
		/// <summary>
		/// Retourne la ressource <see cref="GenPersonne" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonne" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenPersonne Get(GetGenPersonne request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var errFields = ModelDefinitionHelper.GetUndefinedFields<GenPersonne>(request.Fields);
                if (errFields.Any())
                {
                    string str = string.Join(", ", errFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenPersonne), str));
                }
            }

            var q = Db.From<GenPersonne>().Where<GenPersonne>(x => x.CodPersonne == request.CodPersonne).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenPersonne), ""));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenPersonneProfil" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonneProfil" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenPersonneProfil Get(GetGenPersonneProfil request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var errFields = ModelDefinitionHelper.GetUndefinedFields<GenPersonneProfil>(request.Fields);
                if (errFields.Any())
                {
                    string str = string.Join(", ", errFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenPersonneProfil), str));
                }
            }

            var q = Db.From<GenPersonneProfil>().Join<GenPersonne>().Where<GenPersonne>(x => x.CodPersonne == request.CodPersonne).Where<GenPersonneProfil>(x => x.CodProfil == request.CodProfil).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenPersonneProfil), ""));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenPersonneSignature" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonneSignature" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenPersonneSignature Get(GetGenPersonneSignature request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var errFields = ModelDefinitionHelper.GetUndefinedFields<GenPersonneSignature>(request.Fields);
                if (errFields.Any())
                {
                    string str = string.Join(", ", errFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenPersonneSignature), str));
                }
            }

            var q = Db.From<GenPersonneSignature>().Join<GenPersonne>().Where<GenPersonne>(x => x.CodPersonne == request.CodPersonne).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenPersonneSignature), ""));
			}

			return entity;
		}

	}
}
