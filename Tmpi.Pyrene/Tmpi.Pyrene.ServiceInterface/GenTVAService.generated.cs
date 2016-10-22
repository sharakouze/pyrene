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
using System.Linq.Expressions;
using ServiceStack;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.ServiceModel.Messages;
using Tmpi.Pyrene.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;
using Tmpi.Pyrene.Infrastructure.Linq;

namespace Tmpi.Pyrene.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les ressources <see cref="GenTVA"/>.
	/// </summary>
	public partial class GenTVAService : Service
	{
		private static readonly object _syncLock = new object();

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenTVA"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenTVA_CodTVA_EstUnique(GenTVA model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenTVA>();

			if (fields == null || fields.Contains(nameof(GenTVA.CodTVA), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodTVA == model.CodTVA);
			}
			else
			{
				return true;
			}

			if (model.CleTVA != 0)
			{
				q.Where(t1 => t1.CleTVA != model.CleTVA);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenTVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenTVA request)
		{
			int count = Db.DeleteById<GenTVA>(request.CleTVA);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenTVA), request.CleTVA));
			}
		}

		/// <summary>
		/// Ajoute ou remplace la ressource <see cref="GenTVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenTVA"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenTVA Post(GenTVA request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenTVA_CodTVA_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenTVA)));
				}

				if (request.CleTVA == 0)
				{
					long id = Db.Insert(request, selectIdentity: true);
					request.CleTVA = (int)id;
				}
				else
				{
					int count = Db.Update(request);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenTVA), request.CleTVA));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenTVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenTVA"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenTVA Get(GetGenTVA request)
		{
            ModelDefinitionHelper.UndefinedFields<GenTVA>(request.Fields);

            var q = Db.From<GenTVA>().Where(x => x.CleTVA == request.CleTVA).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenTVA), request.CleTVA));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenTVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenTVA request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenTVA>(patchDic.Keys);

			var entity = new GenTVA();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenTVA>().Where(x => x.CleTVA == request.CleTVA).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenTVA_CodTVA_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenTVA)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenTVA), request.CleTVA));
				}
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BasicEntity> Get(SearchGenTVA request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<GenTVA>().Where(x => x.LibTVA.Contains(request.Text));
            if (request.Max > 0)
            {
                q = q.Limit(request.Max);
            }

            var items = Db.Select<BasicEntity>(q);
            return items;
		}

	}
}
