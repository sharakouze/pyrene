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
using Tmpi.Pyrene.Services.ServiceModel.Messages;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;
using Tmpi.Pyrene.Infrastructure.Linq;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les ressources <see cref="GenMandat"/>.
	/// </summary>
	public partial class GenMandatService : Service
	{
		private static readonly object _syncLock = new object();

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenMandat"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenMandat_TypMandat_NivMandat_EstUnique(GenMandat model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenMandat>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(GenMandat.TypMandat), nameof(GenMandat.NivMandat) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN GenMandat t2 ON t2.CleMandat=xxx [...]
					Expression<Func<GenMandat, GenMandat, bool>> joinExpr = (t1, t2)
						=> (t2.CleMandat == model.CleMandat);

					if (!fields.Contains(nameof(GenMandat.TypMandat), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.TypMandat=t2.TypMandat
						joinExpr = joinExpr.And((t1, t2) => t1.TypMandat == t2.TypMandat);
					}
					if (!fields.Contains(nameof(GenMandat.NivMandat), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.NivMandat=t2.NivMandat
						joinExpr = joinExpr.And((t1, t2) => t1.NivMandat == t2.NivMandat);
					}

					q = q.Join<GenMandat>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(GenMandat.TypMandat), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.TypMandat == model.TypMandat);
			}
			if (fields == null || fields.Contains(nameof(GenMandat.NivMandat), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.NivMandat == model.NivMandat);
			}

			if (model.CleMandat != 0)
			{
				q.Where(t1 => t1.CleMandat != model.CleMandat);
			}

			return !Db.Exists(q);
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenMandat"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenMandat_CodMandat_EstUnique(GenMandat model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenMandat>();

			if (fields == null || fields.Contains(nameof(GenMandat.CodMandat), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodMandat == model.CodMandat);
			}
			else
			{
				return true;
			}

			if (model.CleMandat != 0)
			{
				q.Where(t1 => t1.CleMandat != model.CleMandat);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenMandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenMandat request)
		{
			int count = Db.DeleteById<GenMandat>(request.CleMandat);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandat), request.CleMandat));
			}
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenMandatMandataire"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenMandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(GenMandatMandataire model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenMandatMandataire>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(GenMandatMandataire.CleMandat), nameof(GenMandatMandataire.ClePersonne), nameof(GenMandatMandataire.CleService) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN GenMandatMandataire t2 ON t2.CleMandataire=xxx [...]
					Expression<Func<GenMandatMandataire, GenMandatMandataire, bool>> joinExpr = (t1, t2)
						=> (t2.CleMandataire == model.CleMandataire);

					if (!fields.Contains(nameof(GenMandatMandataire.CleMandat), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleMandat=t2.CleMandat
						joinExpr = joinExpr.And((t1, t2) => t1.CleMandat == t2.CleMandat);
					}
					if (!fields.Contains(nameof(GenMandatMandataire.ClePersonne), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.ClePersonne=t2.ClePersonne
						joinExpr = joinExpr.And((t1, t2) => t1.ClePersonne == t2.ClePersonne);
					}
					if (!fields.Contains(nameof(GenMandatMandataire.CleService), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleService=t2.CleService
						joinExpr = joinExpr.And((t1, t2) => t1.CleService == t2.CleService);
					}

					q = q.Join<GenMandatMandataire>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(GenMandatMandataire.CleMandat), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleMandat == model.CleMandat);
			}
			if (fields == null || fields.Contains(nameof(GenMandatMandataire.ClePersonne), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.ClePersonne == model.ClePersonne);
			}
			if (fields == null || fields.Contains(nameof(GenMandatMandataire.CleService), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleService == model.CleService);
			}

			if (model.CleMandataire != 0)
			{
				q.Where(t1 => t1.CleMandataire != model.CleMandataire);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenMandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenMandatMandataire request)
		{
			int count = Db.DeleteById<GenMandatMandataire>(request.CleMandataire);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandatMandataire), request.CleMandataire));
			}
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenMandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenMandat"/> ajoutée.</returns>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenMandat Post(GenMandat request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenMandat_TypMandat_NivMandat_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandat)));
				}
				bool unique2 = GenMandat_CodMandat_EstUnique(request);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandat)));
				}

				long id = Db.Insert(request, selectIdentity: true);
				request.CleMandat = (int)id;

				return request;
			}
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenMandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Put(GenMandat request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenMandat_TypMandat_NivMandat_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandat)));
				}
				bool unique2 = GenMandat_CodMandat_EstUnique(request);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandat)));
				}

				int count = Db.Update(request);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandat), request.CleMandat));
				}
			}
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenMandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenMandatMandataire"/> ajoutée.</returns>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenMandatMandataire Post(GenMandatMandataire request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenMandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandatMandataire)));
				}

				long id = Db.Insert(request, selectIdentity: true);
				request.CleMandataire = (int)id;

				return request;
			}
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenMandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Put(GenMandatMandataire request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenMandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandatMandataire)));
				}

				int count = Db.Update(request);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandatMandataire), request.CleMandataire));
				}
			}
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenMandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenMandat"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenMandat Get(GetGenMandat request)
		{
            ModelDefinitionHelper.UndefinedFields<GenMandat>(request.Fields);

            var q = Db.From<GenMandat>().Where(x => x.CleMandat == request.CleMandat).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandat), request.CleMandat));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenMandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenMandatMandataire"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenMandatMandataire Get(GetGenMandatMandataire request)
		{
            ModelDefinitionHelper.UndefinedFields<GenMandatMandataire>(request.Fields);

            var q = Db.From<GenMandatMandataire>().Where(x => x.CleMandataire == request.CleMandataire).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandatMandataire), request.CleMandataire));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenMandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenMandat request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenMandat>(patchDic.Keys);

			var entity = new GenMandat();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenMandat>().Where(x => x.CleMandat == request.CleMandat).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenMandat_TypMandat_NivMandat_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandat)));
				}
				bool unique2 = GenMandat_CodMandat_EstUnique(entity, patchDic.Keys);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandat)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandat), request.CleMandat));
				}
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenMandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenMandatMandataire request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenMandatMandataire>(patchDic.Keys);

			var entity = new GenMandatMandataire();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenMandatMandataire>().Where(x => x.CleMandataire == request.CleMandataire).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenMandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenMandatMandataire)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenMandatMandataire), request.CleMandataire));
				}
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BasicEntity> Get(SearchGenMandat request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<GenMandat>().Where(x => x.LibMandat.Contains(request.Text));
            if (request.Max > 0)
            {
                q = q.Limit(request.Max);
            }

            var items = Db.Select<BasicEntity>(q);
            return items;
		}

	}
}
