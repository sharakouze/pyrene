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
	/// Service qui traite les requêtes sur les ressources <see cref="GenFourn"/>.
	/// </summary>
	public partial class GenFournService : Service
	{
		private static readonly object _syncLock = new object();

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenFourn"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenFourn_CodFourn_EstUnique(GenFourn model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenFourn>();

			if (fields == null || fields.Contains(nameof(GenFourn.CodFourn), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodFourn == model.CodFourn);
			}
			else
			{
				return true;
			}

			if (model.CleFourn != 0)
			{
				q.Where(t1 => t1.CleFourn != model.CleFourn);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenFourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenFourn request)
		{
			int count = Db.DeleteById<GenFourn>(request.CleFourn);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.CleFourn));
			}
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenFournBanque"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenFournBanque_CleFourn_CodIBAN_EstUnique(GenFournBanque model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenFournBanque>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(GenFournBanque.CleFourn), nameof(GenFournBanque.CodIBAN) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN GenFournBanque t2 ON t2.CleBanque=xxx [...]
					Expression<Func<GenFournBanque, GenFournBanque, bool>> joinExpr = (t1, t2)
						=> (t2.CleBanque == model.CleBanque);

					if (!fields.Contains(nameof(GenFournBanque.CleFourn), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleFourn=t2.CleFourn
						joinExpr = joinExpr.And((t1, t2) => t1.CleFourn == t2.CleFourn);
					}
					if (!fields.Contains(nameof(GenFournBanque.CodIBAN), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CodIBAN=t2.CodIBAN
						joinExpr = joinExpr.And((t1, t2) => t1.CodIBAN == t2.CodIBAN);
					}

					q = q.Join<GenFournBanque>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(GenFournBanque.CleFourn), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleFourn == model.CleFourn);
			}
			if (fields == null || fields.Contains(nameof(GenFournBanque.CodIBAN), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodIBAN == model.CodIBAN);
			}

			if (model.CleBanque != 0)
			{
				q.Where(t1 => t1.CleBanque != model.CleBanque);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenFournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenFournBanque request)
		{
			int count = Db.DeleteById<GenFournBanque>(request.CleBanque);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.CleBanque));
			}
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenFournContact"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenFournContact_CleFourn_NomContact_EstUnique(GenFournContact model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenFournContact>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(GenFournContact.CleFourn), nameof(GenFournContact.NomContact) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN GenFournContact t2 ON t2.CleContact=xxx [...]
					Expression<Func<GenFournContact, GenFournContact, bool>> joinExpr = (t1, t2)
						=> (t2.CleContact == model.CleContact);

					if (!fields.Contains(nameof(GenFournContact.CleFourn), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleFourn=t2.CleFourn
						joinExpr = joinExpr.And((t1, t2) => t1.CleFourn == t2.CleFourn);
					}
					if (!fields.Contains(nameof(GenFournContact.NomContact), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.NomContact=t2.NomContact
						joinExpr = joinExpr.And((t1, t2) => t1.NomContact == t2.NomContact);
					}

					q = q.Join<GenFournContact>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(GenFournContact.CleFourn), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleFourn == model.CleFourn);
			}
			if (fields == null || fields.Contains(nameof(GenFournContact.NomContact), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.NomContact == model.NomContact);
			}

			if (model.CleContact != 0)
			{
				q.Where(t1 => t1.CleContact != model.CleContact);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenFournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenFournContact request)
		{
			int count = Db.DeleteById<GenFournContact>(request.CleContact);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.CleContact));
			}
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenFourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFourn"/> ajoutée.</returns>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenFourn Post(GenFourn request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenFourn_CodFourn_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFourn)));
				}

				long id = Db.Insert(request, selectIdentity: true);
				request.CleFourn = (int)id;

				return request;
			}
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenFourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Put(GenFourn request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenFourn_CodFourn_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFourn)));
				}

				int count = Db.Update(request);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.CleFourn));
				}
			}
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenFournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFournBanque"/> ajoutée.</returns>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenFournBanque Post(GenFournBanque request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenFournBanque_CleFourn_CodIBAN_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFournBanque)));
				}

				long id = Db.Insert(request, selectIdentity: true);
				request.CleBanque = (int)id;

				return request;
			}
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenFournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Put(GenFournBanque request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenFournBanque_CleFourn_CodIBAN_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFournBanque)));
				}

				int count = Db.Update(request);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.CleBanque));
				}
			}
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenFournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFournContact"/> ajoutée.</returns>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenFournContact Post(GenFournContact request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenFournContact_CleFourn_NomContact_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFournContact)));
				}

				long id = Db.Insert(request, selectIdentity: true);
				request.CleContact = (int)id;

				return request;
			}
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenFournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Put(GenFournContact request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenFournContact_CleFourn_NomContact_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFournContact)));
				}

				int count = Db.Update(request);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.CleContact));
				}
			}
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenFourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFourn"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenFourn Get(GetGenFourn request)
		{
            ModelDefinitionHelper.UndefinedFields<GenFourn>(request.Fields);

            var q = Db.From<GenFourn>().Where(x => x.CleFourn == request.CleFourn).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.CleFourn));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenFournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFournBanque"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenFournBanque Get(GetGenFournBanque request)
		{
            ModelDefinitionHelper.UndefinedFields<GenFournBanque>(request.Fields);

            var q = Db.From<GenFournBanque>().Where(x => x.CleBanque == request.CleBanque).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.CleBanque));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenFournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFournContact"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenFournContact Get(GetGenFournContact request)
		{
            ModelDefinitionHelper.UndefinedFields<GenFournContact>(request.Fields);

            var q = Db.From<GenFournContact>().Where(x => x.CleContact == request.CleContact).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.CleContact));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenFourn request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenFourn>(patchDic.Keys);

			var entity = new GenFourn();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenFourn>().Where(x => x.CleFourn == request.CleFourn).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenFourn_CodFourn_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFourn)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.CleFourn));
				}
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenFournBanque request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenFournBanque>(patchDic.Keys);

			var entity = new GenFournBanque();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenFournBanque>().Where(x => x.CleBanque == request.CleBanque).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenFournBanque_CleFourn_CodIBAN_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFournBanque)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.CleBanque));
				}
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenFournContact request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenFournContact>(patchDic.Keys);

			var entity = new GenFournContact();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenFournContact>().Where(x => x.CleContact == request.CleContact).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenFournContact_CleFourn_NomContact_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenFournContact)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.CleContact));
				}
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BasicEntity> Get(SearchGenFourn request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<GenFourn>().Where(x => x.LibFourn.Contains(request.Text));
            if (request.Max > 0)
            {
                q = q.Limit(request.Max);
            }

            var items = Db.Select<BasicEntity>(q);
            return items;
		}

	}
}
