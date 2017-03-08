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
	/// Service qui traite les requêtes sur les entités <see cref="ServiceModel.Types.Service"/>.
	/// </summary>
	public partial class ServiceService : ServiceStack.Service
	{
		private static readonly object _serviceLock = new object();

		/// <summary>
		/// Teste l'unicité d'une entité <see cref="ServiceModel.Types.Service"/>.
		/// </summary>
		/// <param name="model"></param>
		/// <param name="fields"></param>
		/// <returns></returns>
		protected bool Service_CodService_EstUnique(ServiceModel.Types.Service model, IEnumerable<string> fields = null)
		{
			var q = Db.From<ServiceModel.Types.Service>();

			if (fields == null || fields.Contains(nameof(ServiceModel.Types.Service.CodService), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodService == model.CodService);
			}
			else
			{
				return true;
			}

			if (model.CleService != 0)
			{
				q.Where(t1 => t1.CleService != model.CleService);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Supprime l'entité <see cref="ServiceModel.Types.Service"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteService request)
		{
			using (var scope = AuditScope.Create("Service:Delete", () => request))
			{
				int count = Db.DeleteById<ServiceModel.Types.Service>(request.CleService);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(ServiceModel.Types.Service), request.CleService));
				}

				scope.Save();
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="ServiceModel.Types.Service"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="ServiceModel.Types.Service"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public ServiceModel.Types.Service Get(GetService request)
		{
			//ModelDefinitionHelper.UndefinedFields<ServiceModel.Types.Service>(request.Fields);

			var q = Db.From<ServiceModel.Types.Service>().Where(x => x.CleService == request.CleService).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(ServiceModel.Types.Service), request.CleService));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="ServiceModel.Types.Service"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchService request)
		{
			if (request.Operations.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Operations));
			}

			var patchDic = request.Operations.ToDictionary(f => f.Field, f => f.Value);

			//ModelDefinitionHelper.UndefinedFields<ServiceModel.Types.Service>(patchDic.Keys);

			var entity = new ServiceModel.Types.Service();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<ServiceModel.Types.Service>().Where(x => x.CleService == request.CleService).Update(patchDic.Keys);

			lock (_serviceLock)
			{
				bool unique1 = Service_CodService_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(ServiceModel.Types.Service)));
				}

				using (var scope = AuditScope.Create("Service:Update", () => entity))
				{
					int count = Db.UpdateOnly(entity, q);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(ServiceModel.Types.Service), request.CleService));
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
		public SearchServiceResponse Get(SearchService request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

			var q = Db.From<ServiceModel.Types.Service>()
				.Where(x => x.LibService.Contains(request.Text))
				.Select(x => new { CleObjet = x.CleService,  CodObjet = x.CodService, LibObjet = x.LibService });
			if (request.Max > 0)
			{
				q.Limit(request.Max);
			}

			var items = Db.Select<BaseEntity>(q);

			return new SearchServiceResponse
			{
				Results = items
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="ServiceModel.Types.Service"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="ServiceModel.Types.Service"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectServiceResponse Get(SelectService request)
		{
			var q = Db.From<ServiceModel.Types.Service>()
				.Limit(request.Skip, request.Take);

			if (request.Sort.IsNullOrEmpty())
			{
				q.OrderBy(x => x.LibService); // Tri par défaut.
			}
			else
			{
				q.OrderByFields(request.Sort);
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectServiceResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="ServiceModel.Types.Service"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="ServiceModel.Types.Service"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public ServiceModel.Types.Service Post(ServiceModel.Types.Service request)
		{
			lock (_serviceLock)
			{
				bool unique1 = Service_CodService_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(ServiceModel.Types.Service)));
				}

				if (request.CleService == 0)
				{
					using (var scope = AuditScope.Create("Service:Insert", () => request))
					{
						long id = Db.Insert(request, selectIdentity: true);
						request.CleService = (int)id;

						scope.Save();
					}
				}
				else
				{
					using (var scope = AuditScope.Create("Service:Update", () => request))
					{
						int count = Db.Update(request);
						if (count == 0)
						{
							throw HttpError.NotFound(
								string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(ServiceModel.Types.Service), request.CleService));
						}

						scope.Save();
					}
				}

				return request;
			}
		}

	}
}