//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

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
	/// Service qui traite les requêtes sur les entités <see cref="Mandat"/>.
	/// </summary>
	/// <seealso cref="MandatMandataire"/>
	public partial class MandatService : ServiceStack.Service
	{
		private static readonly object _mandatLock = new object();
		private static readonly object _mandatMandataireLock = new object();

		/// <summary>
		/// Teste l'unicité d'une entité <see cref="Mandat"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool Mandat_TypMandat_NivMandat_EstUnique(Mandat model, IEnumerable<string> fields = null)
		{
			var q = Db.From<Mandat>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(Mandat.TypMandat), nameof(Mandat.NivMandat) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN Mandat t2 ON t2.CleMandat=xxx [...]
					Expression<Func<Mandat, Mandat, bool>> joinExpr = (t1, t2)
						=> (t2.CleMandat == model.CleMandat);

					if (!fields.Contains(nameof(Mandat.TypMandat), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.TypMandat=t2.TypMandat
						joinExpr = joinExpr.And((t1, t2) => t1.TypMandat == t2.TypMandat);
					}
					if (!fields.Contains(nameof(Mandat.NivMandat), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.NivMandat=t2.NivMandat
						joinExpr = joinExpr.And((t1, t2) => t1.NivMandat == t2.NivMandat);
					}

					q.Join<Mandat>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(Mandat.TypMandat), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.TypMandat == model.TypMandat);
			}
			if (fields == null || fields.Contains(nameof(Mandat.NivMandat), StringComparer.OrdinalIgnoreCase))
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
		/// Teste l'unicité d'une entité <see cref="Mandat"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool Mandat_CodMandat_EstUnique(Mandat model, IEnumerable<string> fields = null)
		{
			var q = Db.From<Mandat>();

			if (fields == null || fields.Contains(nameof(Mandat.CodMandat), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="Mandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteMandat request)
		{
			using (var scope = AuditScope.Create("Mandat:Delete", () => request))
			{
				int count = Db.DeleteById<Mandat>(request.CleMandat);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Mandat), request.CleMandat));
				}

				scope.Save();
			}
		}

		/// <summary>
		/// Teste l'unicité d'une entité <see cref="MandatMandataire"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool MandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(MandatMandataire model, IEnumerable<string> fields = null)
		{
			var q = Db.From<MandatMandataire>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(MandatMandataire.CleMandat), nameof(MandatMandataire.ClePersonne), nameof(MandatMandataire.CleService) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN MandatMandataire t2 ON t2.CleMandataire=xxx [...]
					Expression<Func<MandatMandataire, MandatMandataire, bool>> joinExpr = (t1, t2)
						=> (t2.CleMandataire == model.CleMandataire);

					if (!fields.Contains(nameof(MandatMandataire.CleMandat), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleMandat=t2.CleMandat
						joinExpr = joinExpr.And((t1, t2) => t1.CleMandat == t2.CleMandat);
					}
					if (!fields.Contains(nameof(MandatMandataire.ClePersonne), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.ClePersonne=t2.ClePersonne
						joinExpr = joinExpr.And((t1, t2) => t1.ClePersonne == t2.ClePersonne);
					}
					if (!fields.Contains(nameof(MandatMandataire.CleService), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleService=t2.CleService
						joinExpr = joinExpr.And((t1, t2) => t1.CleService == t2.CleService);
					}

					q.Join<MandatMandataire>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(MandatMandataire.CleMandat), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CleMandat == model.CleMandat);
			}
			if (fields == null || fields.Contains(nameof(MandatMandataire.ClePersonne), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.ClePersonne == model.ClePersonne);
			}
			if (fields == null || fields.Contains(nameof(MandatMandataire.CleService), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="MandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteMandatMandataire request)
		{
			using (var scope = AuditScope.Create("MandatMandataire:Delete", () => request))
			{
				int count = Db.DeleteById<MandatMandataire>(request.CleMandataire);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(MandatMandataire), request.CleMandataire));
				}

				scope.Save();
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="Mandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Mandat"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public Mandat Get(GetMandat request)
		{
			//ModelDefinitionHelper.UndefinedFields<Mandat>(request.Fields);

			var q = Db.From<Mandat>().Where(x => x.CleMandat == request.CleMandat).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Mandat), request.CleMandat));
			}

			return entity;
		}

		/// <summary>
		/// Retourne l'entité <see cref="MandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="MandatMandataire"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public MandatMandataire Get(GetMandatMandataire request)
		{
			//ModelDefinitionHelper.UndefinedFields<MandatMandataire>(request.Fields);

			var q = Db.From<MandatMandataire>().Where(x => x.CleMandataire == request.CleMandataire).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(MandatMandataire), request.CleMandataire));
			}

			return entity;
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="Mandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Mandat"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public Mandat Post(Mandat request)
		{
			lock (_mandatLock)
			{
				bool unique1 = Mandat_TypMandat_NivMandat_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Mandat)));
				}
				bool unique2 = Mandat_CodMandat_EstUnique(request);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Mandat)));
				}

				if (request.CleMandat == 0)
				{
					using (var scope = AuditScope.Create("Mandat:Insert", () => request))
					{
						long id = Db.Insert(request, selectIdentity: true);
						request.CleMandat = (int)id;

						scope.Save();
					}
				}
				else
				{
					using (var scope = AuditScope.Create("Mandat:Update", () => request))
					{
						int count = Db.Update(request);
						if (count == 0)
						{
							throw HttpError.NotFound(
								string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Mandat), request.CleMandat));
						}

						scope.Save();
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="MandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="MandatMandataire"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public MandatMandataire Post(MandatMandataire request)
		{
			lock (_mandatMandataireLock)
			{
				bool unique1 = MandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(MandatMandataire)));
				}

				if (request.CleMandataire == 0)
				{
					using (var scope = AuditScope.Create("MandatMandataire:Insert", () => request))
					{
						long id = Db.Insert(request, selectIdentity: true);
						request.CleMandataire = (int)id;

						scope.Save();
					}
				}
				else
				{
					using (var scope = AuditScope.Create("MandatMandataire:Update", () => request))
					{
						int count = Db.Update(request);
						if (count == 0)
						{
							throw HttpError.NotFound(
								string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(MandatMandataire), request.CleMandataire));
						}

						scope.Save();
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="Mandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchMandat request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

			var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

			//ModelDefinitionHelper.UndefinedFields<Mandat>(patchDic.Keys);

			var entity = new Mandat();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<Mandat>().Where(x => x.CleMandat == request.CleMandat).Update(patchDic.Keys);

			lock (_mandatLock)
			{
				bool unique1 = Mandat_TypMandat_NivMandat_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Mandat)));
				}
				bool unique2 = Mandat_CodMandat_EstUnique(entity, patchDic.Keys);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Mandat)));
				}

				using (var scope = AuditScope.Create("Mandat:Update", () => entity))
				{
					int count = Db.UpdateOnly(entity, q);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Mandat), request.CleMandat));
					}

					scope.Save();
				}
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="MandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchMandatMandataire request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

			var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

			//ModelDefinitionHelper.UndefinedFields<MandatMandataire>(patchDic.Keys);

			var entity = new MandatMandataire();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<MandatMandataire>().Where(x => x.CleMandataire == request.CleMandataire).Update(patchDic.Keys);

			lock (_mandatMandataireLock)
			{
				bool unique1 = MandatMandataire_CleMandat_ClePersonne_CleService_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(MandatMandataire)));
				}

				using (var scope = AuditScope.Create("MandatMandataire:Update", () => entity))
				{
					int count = Db.UpdateOnly(entity, q);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(MandatMandataire), request.CleMandataire));
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
		public SearchMandatResponse Get(SearchMandat request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

			var q = Db.From<Mandat>()
				.Where(x => x.LibMandat.Contains(request.Text))
				.Select(x => new { CleObjet = x.CleMandat,  CodObjet = x.CodMandat, LibObjet = x.LibMandat });
			if (request.Max > 0)
			{
				q.Limit(request.Max);
			}

			var items = Db.Select<BaseEntity>(q);

			return new SearchMandatResponse
			{
				Results = items
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="Mandat"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Mandat"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectMandatResponse Get(SelectMandat request)
		{
			var q = Db.From<Mandat>()
				.Limit(request.Skip, request.Take);

			if (request.Sort.IsNullOrEmpty())
			{
				q.OrderBy(x => x.LibMandat); // Tri par défaut.
			}
			else
			{
				q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectMandatResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="MandatMandataire"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="MandatMandataire"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectMandatMandataireResponse Get(SelectMandatMandataire request)
		{
			var q = Db.From<MandatMandataire>()
				.Limit(request.Skip, request.Take);

			if (request.Sort.IsNullOrEmpty())
			{
				q.OrderBy(x => x.CleMandataire); // Tri par défaut.
			}
			else
			{
				q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectMandatMandataireResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

	}
}
