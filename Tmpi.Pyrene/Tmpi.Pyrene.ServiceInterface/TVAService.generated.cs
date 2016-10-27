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
using Tmpi.Pyrene.Common;
using Tmpi.Pyrene.Common.Linq;
using Tmpi.Pyrene.ServiceModel.Messages;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les entités <see cref="TVA"/>.
	/// </summary>
	public partial class TVAService : ServiceStack.Service
	{
		private static readonly object _tvaLock = new object();

        /// <summary>
		/// Teste l'unicité d'une entité <see cref="TVA"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool TVA_CodTVA_EstUnique(TVA model, IEnumerable<string> fields = null)
		{
			var q = Db.From<TVA>();

			if (fields == null || fields.Contains(nameof(TVA.CodTVA), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="TVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteTVA request)
		{
			int count = Db.DeleteById<TVA>(request.CleTVA);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(TVA), request.CleTVA));
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="TVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="TVA"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public TVA Get(GetTVA request)
		{
            ModelDefinitionHelper.UndefinedFields<TVA>(request.Fields);

            var q = Db.From<TVA>().Where(x => x.CleTVA == request.CleTVA).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(TVA), request.CleTVA));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="TVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchTVA request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

            var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<TVA>(patchDic.Keys);

			var entity = new TVA();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<TVA>().Where(x => x.CleTVA == request.CleTVA).Update(patchDic.Keys);

			lock (_tvaLock)
			{
				bool unique1 = TVA_CodTVA_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(TVA)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(TVA), request.CleTVA));
				}
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BaseEntity> Get(SearchTVA request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<TVA>()
				.Where(x => x.LibTVA.Contains(request.Text))
				.Select(x => new { CleObjet = x.CleTVA,  CodObjet = x.CodTVA, LibObjet = x.LibTVA });
            if (request.Max > 0)
            {
                q.Limit(request.Max);
            }

            var items = Db.Select<BaseEntity>(q);
            return items;
		}

		/// <summary>
		/// Retourne l'entité <see cref="TVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="TVA"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectTVAResponse Get(SelectTVA request)
		{
			var q = Db.From<TVA>()
				.Limit(request.Skip, request.Take);
            
			if (request.Sort.IsNullOrEmpty())
            {
                q.OrderBy(x => x.LibTVA); // Tri par défaut.
            }
			else
			{
                q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectTVAResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="TVA"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="TVA"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public TVA Post(TVA request)
		{
			lock (_tvaLock)
			{
				bool unique1 = TVA_CodTVA_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(TVA)));
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
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(TVA), request.CleTVA));
					}
				}

				return request;
			}
		}

	}
}
