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
	/// Service qui traite les requêtes sur les ressources <see cref="GenCompteur" />.
	/// </summary>
	public partial class GenCompteurService : Service
	{
		/// <summary>
		/// Retourne la ressource <see cref="GenCompteur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenCompteur" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenCompteur Get(GetGenCompteur request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var errFields = ModelDefinitionHelper.GetUndefinedFields<GenCompteur>(request.Fields);
                if (errFields.Any())
                {
                    string str = string.Join(", ", errFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenCompteur), str));
                }
            }

            var q = Db.From<GenCompteur>().Where<GenCompteur>(x => x.CodCompteur == request.CodCompteur).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenCompteur), request.Id));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenCompteurValeur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenCompteurValeur" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenCompteurValeur Get(GetGenCompteurValeur request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var errFields = ModelDefinitionHelper.GetUndefinedFields<GenCompteurValeur>(request.Fields);
                if (errFields.Any())
                {
                    string str = string.Join(", ", errFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenCompteurValeur), str));
                }
            }

            var q = Db.From<GenCompteurValeur>().Join<GenCompteur>().Where<GenCompteur>(x => x.CodCompteur == request.CodCompteur).Join<GenCompteurGenCompteurValeur>().Where<GenCompteurGenCompteurValeur>(x => x.ValPeriode == request.ValPeriode).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenCompteurValeur), request.Id));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenCompteurValeurMachin" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenCompteurValeurMachin" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenCompteurValeurMachin Get(GetGenCompteurValeurMachin request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var errFields = ModelDefinitionHelper.GetUndefinedFields<GenCompteurValeurMachin>(request.Fields);
                if (errFields.Any())
                {
                    string str = string.Join(", ", errFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenCompteurValeurMachin), str));
                }
            }

            var q = Db.From<GenCompteurValeurMachin>().Join<GenCompteur>().Where<GenCompteur>(x => x.CodCompteur == request.CodCompteur).Join<GenCompteurGenCompteurValeur>().Where<GenCompteurGenCompteurValeur>(x => x.ValPeriode == request.ValPeriode).Join<GenCompteurGenCompteurValeurGenCompteurValeurMachin>().Where<GenCompteurGenCompteurValeurGenCompteurValeurMachin>(x => x.CodMachin == request.CodMachin).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenCompteurValeurMachin), request.Id));
			}

			return entity;
		}

	}
}
