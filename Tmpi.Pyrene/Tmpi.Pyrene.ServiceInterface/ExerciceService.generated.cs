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
using Tmpi.Pyrene.Infrastructure;
using Tmpi.Pyrene.Infrastructure.Linq;
using Tmpi.Pyrene.ServiceModel.Messages;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les entités <see cref="Exercice"/>.
	/// </summary>
	public partial class ExerciceService : ServiceStack.Service
	{
		private static readonly object _exerciceLock = new object();

        /// <summary>
		/// Teste l'unicité d'une entité <see cref="Exercice"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool Exercice_CodExercice_EstUnique(Exercice model, IEnumerable<string> fields = null)
		{
			var q = Db.From<Exercice>();

			if (fields == null || fields.Contains(nameof(Exercice.CodExercice), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="Exercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteExercice request)
		{
			int count = Db.DeleteById<Exercice>(request.CleExercice);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Exercice), request.CleExercice));
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="Exercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Exercice"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public Exercice Post(Exercice request)
		{
			lock (_exerciceLock)
			{
				bool unique1 = Exercice_CodExercice_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Exercice)));
				}

				if (request.CleExercice == 0)
				{
					long id = Db.Insert(request, selectIdentity: true);
					request.CleExercice = (int)id;
				}
				else
				{
					int count = Db.Update(request);
					if (count == 0)
					{
						throw HttpError.NotFound(
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Exercice), request.CleExercice));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="Exercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Exercice"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public Exercice Get(GetExercice request)
		{
            ModelDefinitionHelper.UndefinedFields<Exercice>(request.Fields);

            var q = Db.From<Exercice>().Where(x => x.CleExercice == request.CleExercice).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Exercice), request.CleExercice));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="Exercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchExercice request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<Exercice>(patchDic.Keys);

			var entity = new Exercice();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<Exercice>().Where(x => x.CleExercice == request.CleExercice).Update(patchDic.Keys);

			lock (_exerciceLock)
			{
				bool unique1 = Exercice_CodExercice_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Exercice)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Exercice), request.CleExercice));
				}
			}
		}

		/// <summary>
		/// Retourne le résultat d'une recherche.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BaseEntity> Get(SearchExercice request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<Exercice>()
				.Where(x => x.LibExercice.Contains(request.Text))
				.Select(x => new { CleObjet = x.CleExercice,  CodObjet = x.CodExercice, LibObjet = x.LibExercice });
            if (request.Max > 0)
            {
                q.Limit(request.Max);
            }

            var items = Db.Select<BaseEntity>(q);
            return items;
		}

		/// <summary>
		/// Retourne l'entité <see cref="Exercice"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Exercice"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectExerciceResponse Get(SelectExercice request)
		{
			var q = Db.From<Exercice>()
				.Limit(request.Skip, request.Take);
            
			if (request.Sort.IsNullOrEmpty())
            {
                q.OrderBy(x => x.LibExercice); // Tri par défaut.
            }
			else
			{
				foreach (string s in request.Sort)
				{
					if (s.StartsWith("-"))
					{
						q.OrderByDescending(s.Substring(1));
					}
					else
					{
						q.OrderBy(s);
					}
				}
			}

			long count = Db.Count(q);
			var lst = Db.LoadSelect(q);

			return new SelectExerciceResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

	}
}
