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
	/// Service qui traite les requêtes sur les ressources <see cref="GenPersonne"/>.
	/// </summary>
	public partial class GenPersonneService : Service
	{
		private static readonly object _syncLock = new object();

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenPersonne"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenPersonne_CodPersonne_EstUnique(GenPersonne model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenPersonne>();

			if (fields == null || fields.Contains(nameof(GenPersonne.CodPersonne), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodPersonne == model.CodPersonne);
			}
			else
			{
				return true;
			}

			if (model.ClePersonne != 0)
			{
				q.Where(t1 => t1.ClePersonne != model.ClePersonne);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenPersonne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenPersonne request)
		{
			int count = Db.DeleteById<GenPersonne>(request.ClePersonne);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonne), request.ClePersonne));
			}
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenPersonneProfil"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenPersonneProfil_ClePersonne_CleService_EstUnique(GenPersonneProfil model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenPersonneProfil>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(GenPersonneProfil.ClePersonne), nameof(GenPersonneProfil.CleService) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN GenPersonneProfil t2 ON t2.CleProfil=xxx [...]
					Expression<Func<GenPersonneProfil, GenPersonneProfil, bool>> joinExpr = (t1, t2)
						=> (t2.CleProfil == model.CleProfil);

					if (!fields.Contains(nameof(GenPersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.ClePersonne=t2.ClePersonne
						joinExpr = joinExpr.And((t1, t2) => t1.ClePersonne == t2.ClePersonne);
					}
					if (!fields.Contains(nameof(GenPersonneProfil.CleService), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleService=t2.CleService
						joinExpr = joinExpr.And((t1, t2) => t1.CleService == t2.CleService);
					}

					q = q.Join<GenPersonneProfil>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(GenPersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.ClePersonne == model.ClePersonne);
			}
			if (fields == null || fields.Contains(nameof(GenPersonneProfil.CleService), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleService == model.CleService);
			}

			if (model.CleProfil != 0)
			{
				q.Where(t1 => t1.CleProfil != model.CleProfil);
			}

			return !Db.Exists(q);
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenPersonneProfil"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenPersonneProfil_CodProfil_ClePersonne_EstUnique(GenPersonneProfil model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenPersonneProfil>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(GenPersonneProfil.CodProfil), nameof(GenPersonneProfil.ClePersonne) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN GenPersonneProfil t2 ON t2.CleProfil=xxx [...]
					Expression<Func<GenPersonneProfil, GenPersonneProfil, bool>> joinExpr = (t1, t2)
						=> (t2.CleProfil == model.CleProfil);

					if (!fields.Contains(nameof(GenPersonneProfil.CodProfil), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CodProfil=t2.CodProfil
						joinExpr = joinExpr.And((t1, t2) => t1.CodProfil == t2.CodProfil);
					}
					if (!fields.Contains(nameof(GenPersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.ClePersonne=t2.ClePersonne
						joinExpr = joinExpr.And((t1, t2) => t1.ClePersonne == t2.ClePersonne);
					}

					q = q.Join<GenPersonneProfil>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(GenPersonneProfil.CodProfil), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodProfil == model.CodProfil);
			}
			if (fields == null || fields.Contains(nameof(GenPersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.ClePersonne == model.ClePersonne);
			}

			if (model.CleProfil != 0)
			{
				q.Where(t1 => t1.CleProfil != model.CleProfil);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenPersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenPersonneProfil request)
		{
			int count = Db.DeleteById<GenPersonneProfil>(request.CleProfil);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneProfil), request.CleProfil));
			}
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenPersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenPersonneSignature request)
		{
			int count = Db.DeleteById<GenPersonneSignature>(request.ClePersonne);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneSignature), request.ClePersonne));
			}
		}

		/// <summary>
		/// Ajoute ou remplace la ressource <see cref="GenPersonne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonne"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenPersonne Post(GenPersonne request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenPersonne_CodPersonne_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenPersonne)));
				}

				if (request.ClePersonne == 0)
				{
					long id = Db.Insert(request, selectIdentity: true);
					request.ClePersonne = (int)id;
				}
				else
				{
					int count = Db.Update(request);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonne), request.ClePersonne));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace la ressource <see cref="GenPersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonneProfil"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenPersonneProfil Post(GenPersonneProfil request)
		{
			lock (_syncLock)
			{
				bool unique1 = GenPersonneProfil_ClePersonne_CleService_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenPersonneProfil)));
				}
				bool unique2 = GenPersonneProfil_CodProfil_ClePersonne_EstUnique(request);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenPersonneProfil)));
				}

				if (request.CleProfil == 0)
				{
					long id = Db.Insert(request, selectIdentity: true);
					request.CleProfil = (int)id;
				}
				else
				{
					int count = Db.Update(request);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneProfil), request.CleProfil));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace la ressource <see cref="GenPersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonneSignature"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public GenPersonneSignature Post(GenPersonneSignature request)
		{
			lock (_syncLock)
			{

				if (request.ClePersonne == 0)
				{
					long id = Db.Insert(request, selectIdentity: true);
					request.ClePersonne = (int)id;
				}
				else
				{
					int count = Db.Update(request);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneSignature), request.ClePersonne));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenPersonne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonne"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenPersonne Get(GetGenPersonne request)
		{
            ModelDefinitionHelper.UndefinedFields<GenPersonne>(request.Fields);

            var q = Db.From<GenPersonne>().Where(x => x.ClePersonne == request.ClePersonne).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonne), request.ClePersonne));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenPersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonneProfil"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenPersonneProfil Get(GetGenPersonneProfil request)
		{
            ModelDefinitionHelper.UndefinedFields<GenPersonneProfil>(request.Fields);

            var q = Db.From<GenPersonneProfil>().Where(x => x.CleProfil == request.CleProfil).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneProfil), request.CleProfil));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenPersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenPersonneSignature"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		public GenPersonneSignature Get(GetGenPersonneSignature request)
		{
            ModelDefinitionHelper.UndefinedFields<GenPersonneSignature>(request.Fields);

            var q = Db.From<GenPersonneSignature>().Where(x => x.ClePersonne == request.ClePersonne).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneSignature), request.ClePersonne));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenPersonne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenPersonne request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenPersonne>(patchDic.Keys);

			var entity = new GenPersonne();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenPersonne>().Where(x => x.ClePersonne == request.ClePersonne).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenPersonne_CodPersonne_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenPersonne)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonne), request.ClePersonne));
				}
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenPersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenPersonneProfil request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenPersonneProfil>(patchDic.Keys);

			var entity = new GenPersonneProfil();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenPersonneProfil>().Where(x => x.CleProfil == request.CleProfil).Update(patchDic.Keys);

			lock (_syncLock)
			{
				bool unique1 = GenPersonneProfil_ClePersonne_CleService_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenPersonneProfil)));
				}
				bool unique2 = GenPersonneProfil_CodProfil_ClePersonne_EstUnique(entity, patchDic.Keys);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenPersonneProfil)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneProfil), request.CleProfil));
				}
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenPersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">La ressource spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchGenPersonneSignature request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenPersonneSignature>(patchDic.Keys);

			var entity = new GenPersonneSignature();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenPersonneSignature>().Where(x => x.ClePersonne == request.ClePersonne).Update(patchDic.Keys);

			lock (_syncLock)
			{

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenPersonneSignature), request.ClePersonne));
				}
			}
		}

	}
}
