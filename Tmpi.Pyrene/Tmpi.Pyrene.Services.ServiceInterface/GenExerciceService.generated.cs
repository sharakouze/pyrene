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
using Tmpi.Pyrene.Services.ServiceModel;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;
using Tmpi.Pyrene.Infrastructure.Linq;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les ressources <see cref="GenExercice"/>.
	/// </summary>
	public partial class GenExerciceService : Service
	{
		private static readonly object _syncLock = new object();

		/// <summary>
		/// Supprime la ressource <see cref="GenExercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenExercice request)
		{
			int count = Db.DeleteById<GenExercice>(request.CleExercice);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenExercice), request.CleExercice));
			}
		}

        /// <summary>
		/// Teste l'unicité d'un <see cref="GenExercice"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool GenExerciceCodExerciceEstUnique(GenExercice model, IEnumerable<string> fields = null)
		{
			var q = Db.From<GenExercice>();

			if (fields == null || fields.Contains(nameof(GenExercice.CodExercice), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodExercice == model.CodExercice);
			}
			else
			{
				return true;
			}

			if (model.CleExercice != 0)
			{
				q.Where(t1 => t1.CleExercice != model.CleExercice);
			}

			return !Db.Exists(q);
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenExercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenExercice"/> ajoutée.</returns>
		public GenExercice Post(GenExercice request)
		{
			using (var tran = Db.OpenTransaction())
			{
				bool unique1 = GenExerciceCodExerciceEstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenExercice)));
				}

				long id = Db.Insert(request, selectIdentity: true);
				request.CleExercice = (int)id;

				tran.Commit();

				return request;
			}
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenExercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Put(GenExercice request)
		{
			using (var tran = Db.OpenTransaction())
			{
				bool unique1 = GenExerciceCodExerciceEstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.ResourceNotUnique, nameof(GenExercice)));
				}

				int count = Db.Update(request);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenExercice), request.CleExercice));
				}

				tran.Commit();
			}
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenExercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenExercice"/> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenExercice Get(GetGenExercice request)
		{
            ModelDefinitionHelper.UndefinedFields<GenExercice>(request.Fields);

            var q = Db.From<GenExercice>().Where(x => x.CleExercice == request.CleExercice).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenExercice), request.CleExercice));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenExercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Patch(PatchGenExercice request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<GenExercice>(patchDic.Keys);

			var entity = new GenExercice();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenExercice>().Where(x => x.CleExercice == request.CleExercice).Update(patchDic.Keys);

			using (var tran = Db.OpenTransaction())
			{
				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.ResourceByIdNotFound, nameof(GenExercice), request.CleExercice));
				}

				tran.Commit();
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BasicEntity> Get(SearchGenExercice request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<GenExercice>().Where(x => x.LibExercice.Contains(request.Text));
            if (request.Max > 0)
            {
                q = q.Limit(request.Max);
            }

            var items = Db.Select<BasicEntity>(q);
            return items;
		}

	}
}
