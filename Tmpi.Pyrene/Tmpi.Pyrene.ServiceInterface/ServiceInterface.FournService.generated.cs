//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Audit.Core;
using ServiceStack;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.Common;
using Tmpi.Pyrene.Common.Linq;
using Tmpi.Pyrene.ServiceModel;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les entités <see cref="Fourn"/>.
	/// </summary>
	/// <seealso cref="FournBanque"/>
	/// <seealso cref="FournContact"/>
	public partial class FournService : ServiceStack.Service
	{
		private static readonly object _fournLock = new object();
		private static readonly object _fournBanqueLock = new object();
		private static readonly object _fournContactLock = new object();
		/// <summary>
		/// Teste l'unicité d'une entité <see cref="Fourn"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool Fourn_CodFourn_EstUnique(Fourn model, IEnumerable<string> fields = null)
		{
			var q = Db.From<Fourn>();

			if (fields == null || fields.Contains(nameof(Fourn.CodFourn), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="Fourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteFourn request)
		{
			using (var scope = AuditScope.Create("Fourn:Delete", () => request))
			{
				int count = Db.DeleteById<Fourn>(request.CleFourn);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Fourn), request.CleFourn));
				}

				scope.Save();
			}
		}

		/// <summary>
		/// Teste l'unicité d'une entité <see cref="FournBanque"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool FournBanque_CleFourn_CodIBAN_EstUnique(FournBanque model, IEnumerable<string> fields = null)
		{
			var q = Db.From<FournBanque>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(FournBanque.CleFourn), nameof(FournBanque.CodIBAN) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN FournBanque t2 ON t2.CleBanque=xxx [...]
					Expression<Func<FournBanque, FournBanque, bool>> joinExpr = (t1, t2)
						=> (t2.CleBanque == model.CleBanque);

					if (!fields.Contains(nameof(FournBanque.CleFourn), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleFourn=t2.CleFourn
						joinExpr = joinExpr.And((t1, t2) => t1.CleFourn == t2.CleFourn);
					}
					if (!fields.Contains(nameof(FournBanque.CodIBAN), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CodIBAN=t2.CodIBAN
						joinExpr = joinExpr.And((t1, t2) => t1.CodIBAN == t2.CodIBAN);
					}

					q.Join<FournBanque>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(FournBanque.CleFourn), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleFourn == model.CleFourn);
			}
			if (fields == null || fields.Contains(nameof(FournBanque.CodIBAN), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="FournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteFournBanque request)
		{
			using (var scope = AuditScope.Create("FournBanque:Delete", () => request))
			{
				int count = Db.DeleteById<FournBanque>(request.CleBanque);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournBanque), request.CleBanque));
				}

				scope.Save();
			}
		}

		/// <summary>
		/// Teste l'unicité d'une entité <see cref="FournContact"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool FournContact_CleFourn_NomContact_EstUnique(FournContact model, IEnumerable<string> fields = null)
		{
			var q = Db.From<FournContact>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(FournContact.CleFourn), nameof(FournContact.NomContact) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN FournContact t2 ON t2.CleContact=xxx [...]
					Expression<Func<FournContact, FournContact, bool>> joinExpr = (t1, t2)
						=> (t2.CleContact == model.CleContact);

					if (!fields.Contains(nameof(FournContact.CleFourn), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleFourn=t2.CleFourn
						joinExpr = joinExpr.And((t1, t2) => t1.CleFourn == t2.CleFourn);
					}
					if (!fields.Contains(nameof(FournContact.NomContact), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.NomContact=t2.NomContact
						joinExpr = joinExpr.And((t1, t2) => t1.NomContact == t2.NomContact);
					}

					q.Join<FournContact>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(FournContact.CleFourn), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleFourn == model.CleFourn);
			}
			if (fields == null || fields.Contains(nameof(FournContact.NomContact), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="FournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteFournContact request)
		{
			using (var scope = AuditScope.Create("FournContact:Delete", () => request))
			{
				int count = Db.DeleteById<FournContact>(request.CleContact);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournContact), request.CleContact));
				}

				scope.Save();
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="Fourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Fourn"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public Fourn Post(Fourn request)
		{
			lock (_fournLock)
			{
				bool unique1 = Fourn_CodFourn_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Fourn)));
				}

				if (request.CleFourn == 0)
				{
					using (var scope = AuditScope.Create("Fourn:Insert", () => request))
					{
						long id = Db.Insert(request, selectIdentity: true);
						request.CleFourn = (int)id;

						scope.Save();
					}
				}
				else
				{
					using (var scope = AuditScope.Create("Fourn:Update", () => request))
					{
						int count = Db.Update(request);
						if (count == 0)
						{
							throw HttpError.NotFound(
								string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Fourn), request.CleFourn));
						}

						scope.Save();
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="FournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="FournBanque"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public FournBanque Post(FournBanque request)
		{
			lock (_fournBanqueLock)
			{
				bool unique1 = FournBanque_CleFourn_CodIBAN_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(FournBanque)));
				}

				if (request.CleBanque == 0)
				{
					using (var scope = AuditScope.Create("FournBanque:Insert", () => request))
					{
						long id = Db.Insert(request, selectIdentity: true);
						request.CleBanque = (int)id;

						scope.Save();
					}
				}
				else
				{
					using (var scope = AuditScope.Create("FournBanque:Update", () => request))
					{
						int count = Db.Update(request);
						if (count == 0)
						{
							throw HttpError.NotFound(
								string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournBanque), request.CleBanque));
						}

						scope.Save();
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="FournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="FournContact"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public FournContact Post(FournContact request)
		{
			lock (_fournContactLock)
			{
				bool unique1 = FournContact_CleFourn_NomContact_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(FournContact)));
				}

				if (request.CleContact == 0)
				{
					using (var scope = AuditScope.Create("FournContact:Insert", () => request))
					{
						long id = Db.Insert(request, selectIdentity: true);
						request.CleContact = (int)id;

						scope.Save();
					}
				}
				else
				{
					using (var scope = AuditScope.Create("FournContact:Update", () => request))
					{
						int count = Db.Update(request);
						if (count == 0)
						{
							throw HttpError.NotFound(
								string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournContact), request.CleContact));
						}

						scope.Save();
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="Fourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Fourn"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public Fourn Get(GetFourn request)
		{
			//ModelDefinitionHelper.UndefinedFields<Fourn>(request.Fields);

			var q = Db.From<Fourn>().Where(x => x.CleFourn == request.CleFourn).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Fourn), request.CleFourn));
			}

			return entity;
		}

		/// <summary>
		/// Retourne l'entité <see cref="FournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="FournBanque"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public FournBanque Get(GetFournBanque request)
		{
			//ModelDefinitionHelper.UndefinedFields<FournBanque>(request.Fields);

			var q = Db.From<FournBanque>().Where(x => x.CleBanque == request.CleBanque).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournBanque), request.CleBanque));
			}

			return entity;
		}

		/// <summary>
		/// Retourne l'entité <see cref="FournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="FournContact"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public FournContact Get(GetFournContact request)
		{
			//ModelDefinitionHelper.UndefinedFields<FournContact>(request.Fields);

			var q = Db.From<FournContact>().Where(x => x.CleContact == request.CleContact).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournContact), request.CleContact));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="Fourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchFourn request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

			var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

			//ModelDefinitionHelper.UndefinedFields<Fourn>(patchDic.Keys);

			var entity = new Fourn();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<Fourn>().Where(x => x.CleFourn == request.CleFourn).Update(patchDic.Keys);

			lock (_fournLock)
			{
				bool unique1 = Fourn_CodFourn_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Fourn)));
				}

				using (var scope = AuditScope.Create("Fourn:Update", () => entity))
				{
					int count = Db.UpdateOnly(entity, q);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Fourn), request.CleFourn));
					}

					scope.Save();
				}
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="FournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchFournBanque request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

			var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

			//ModelDefinitionHelper.UndefinedFields<FournBanque>(patchDic.Keys);

			var entity = new FournBanque();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<FournBanque>().Where(x => x.CleBanque == request.CleBanque).Update(patchDic.Keys);

			lock (_fournBanqueLock)
			{
				bool unique1 = FournBanque_CleFourn_CodIBAN_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(FournBanque)));
				}

				using (var scope = AuditScope.Create("FournBanque:Update", () => entity))
				{
					int count = Db.UpdateOnly(entity, q);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournBanque), request.CleBanque));
					}

					scope.Save();
				}
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="FournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchFournContact request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

			var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

			//ModelDefinitionHelper.UndefinedFields<FournContact>(patchDic.Keys);

			var entity = new FournContact();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<FournContact>().Where(x => x.CleContact == request.CleContact).Update(patchDic.Keys);

			lock (_fournContactLock)
			{
				bool unique1 = FournContact_CleFourn_NomContact_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(FournContact)));
				}

				using (var scope = AuditScope.Create("FournContact:Update", () => entity))
				{
					int count = Db.UpdateOnly(entity, q);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(FournContact), request.CleContact));
					}

					scope.Save();
				}
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public SearchFournResponse Get(SearchFourn request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

			var q = Db.From<Fourn>()
				.Where(x => x.LibFourn.Contains(request.Text))
				.Select(x => new { CleObjet = x.CleFourn,  CodObjet = x.CodFourn, LibObjet = x.LibFourn });
			if (request.Max > 0)
			{
				q.Limit(request.Max);
			}

			var items = Db.Select<BaseEntity>(q);

			return new SearchFournResponse
			{
				Results = items
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="Fourn"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Fourn"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectFournResponse Get(SelectFourn request)
		{
			var q = Db.From<Fourn>()
				.Limit(request.Skip, request.Take);

			if (request.Sort.IsNullOrEmpty())
			{
				q.OrderBy(x => x.LibFourn); // Tri par défaut.
			}
			else
			{
				q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectFournResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="FournBanque"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="FournBanque"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectFournBanqueResponse Get(SelectFournBanque request)
		{
			var q = Db.From<FournBanque>()
				.Limit(request.Skip, request.Take);

			if (request.Sort.IsNullOrEmpty())
			{
				q.OrderBy(x => x.CleBanque); // Tri par défaut.
			}
			else
			{
				q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectFournBanqueResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="FournContact"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="FournContact"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectFournContactResponse Get(SelectFournContact request)
		{
			var q = Db.From<FournContact>()
				.Limit(request.Skip, request.Take);

			if (request.Sort.IsNullOrEmpty())
			{
				q.OrderBy(x => x.NomContact); // Tri par défaut.
			}
			else
			{
				q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectFournContactResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

	}
}
