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
	/// Service qui traite les requêtes sur les entités <see cref="Personne"/>.
	/// </summary>
	/// <seealso cref="PersonneProfil"/>
	/// <seealso cref="PersonneSignature"/>
	public partial class PersonneService : ServiceStack.Service
	{
		private static readonly object _personneLock = new object();
		private static readonly object _personneProfilLock = new object();
		private static readonly object _personneSignatureLock = new object();

        /// <summary>
		/// Teste l'unicité d'une entité <see cref="Personne"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool Personne_CodPersonne_EstUnique(Personne model, IEnumerable<string> fields = null)
		{
			var q = Db.From<Personne>();

			if (fields == null || fields.Contains(nameof(Personne.CodPersonne), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="Personne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeletePersonne request)
		{
			int count = Db.DeleteById<Personne>(request.ClePersonne);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Personne), request.ClePersonne));
			}
		}

        /// <summary>
		/// Teste l'unicité d'une entité <see cref="PersonneProfil"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool PersonneProfil_ClePersonne_CleService_EstUnique(PersonneProfil model, IEnumerable<string> fields = null)
		{
			var q = Db.From<PersonneProfil>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(PersonneProfil.ClePersonne), nameof(PersonneProfil.CleService) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN PersonneProfil t2 ON t2.CleProfil=xxx [...]
					Expression<Func<PersonneProfil, PersonneProfil, bool>> joinExpr = (t1, t2)
						=> (t2.CleProfil == model.CleProfil);

					if (!fields.Contains(nameof(PersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.ClePersonne=t2.ClePersonne
						joinExpr = joinExpr.And((t1, t2) => t1.ClePersonne == t2.ClePersonne);
					}
					if (!fields.Contains(nameof(PersonneProfil.CleService), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CleService=t2.CleService
						joinExpr = joinExpr.And((t1, t2) => t1.CleService == t2.CleService);
					}

					q = q.Join<PersonneProfil>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(PersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.ClePersonne == model.ClePersonne);
			}
			if (fields == null || fields.Contains(nameof(PersonneProfil.CleService), StringComparer.OrdinalIgnoreCase))
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
		/// Teste l'unicité d'une entité <see cref="PersonneProfil"/>.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
		protected bool PersonneProfil_CodProfil_ClePersonne_EstUnique(PersonneProfil model, IEnumerable<string> fields = null)
		{
			var q = Db.From<PersonneProfil>();

			if (fields != null)
			{
				var uniqueFields = new[] { nameof(PersonneProfil.CodProfil), nameof(PersonneProfil.ClePersonne) };
				if (fields.Any(f => uniqueFields.Contains(f, StringComparer.OrdinalIgnoreCase)))
				{
					// INNER JOIN PersonneProfil t2 ON t2.CleProfil=xxx [...]
					Expression<Func<PersonneProfil, PersonneProfil, bool>> joinExpr = (t1, t2)
						=> (t2.CleProfil == model.CleProfil);

					if (!fields.Contains(nameof(PersonneProfil.CodProfil), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.CodProfil=t2.CodProfil
						joinExpr = joinExpr.And((t1, t2) => t1.CodProfil == t2.CodProfil);
					}
					if (!fields.Contains(nameof(PersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
					{
						// [...] AND t1.ClePersonne=t2.ClePersonne
						joinExpr = joinExpr.And((t1, t2) => t1.ClePersonne == t2.ClePersonne);
					}

					q = q.Join<PersonneProfil>(joinExpr, Db.JoinAlias("t2"));
				}
				else
				{
					return true;
				}
			}
			
			if (fields == null || fields.Contains(nameof(PersonneProfil.CodProfil), StringComparer.OrdinalIgnoreCase))
			{
				q.Where(t1 => t1.CodProfil == model.CodProfil);
			}
			if (fields == null || fields.Contains(nameof(PersonneProfil.ClePersonne), StringComparer.OrdinalIgnoreCase))
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
		/// Supprime l'entité <see cref="PersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeletePersonneProfil request)
		{
			int count = Db.DeleteById<PersonneProfil>(request.CleProfil);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneProfil), request.CleProfil));
			}
		}

		/// <summary>
		/// Supprime l'entité <see cref="PersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeletePersonneSignature request)
		{
			int count = Db.DeleteById<PersonneSignature>(request.ClePersonne);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneSignature), request.ClePersonne));
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="Personne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Personne"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public Personne Get(GetPersonne request)
		{
            ModelDefinitionHelper.UndefinedFields<Personne>(request.Fields);

            var q = Db.From<Personne>().Where(x => x.ClePersonne == request.ClePersonne).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Personne), request.ClePersonne));
			}

			return entity;
		}

		/// <summary>
		/// Retourne l'entité <see cref="PersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="PersonneProfil"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public PersonneProfil Get(GetPersonneProfil request)
		{
            ModelDefinitionHelper.UndefinedFields<PersonneProfil>(request.Fields);

            var q = Db.From<PersonneProfil>().Where(x => x.CleProfil == request.CleProfil).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneProfil), request.CleProfil));
			}

			return entity;
		}

		/// <summary>
		/// Retourne l'entité <see cref="PersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="PersonneSignature"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public PersonneSignature Get(GetPersonneSignature request)
		{
            ModelDefinitionHelper.UndefinedFields<PersonneSignature>(request.Fields);

            var q = Db.From<PersonneSignature>().Where(x => x.ClePersonne == request.ClePersonne).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneSignature), request.ClePersonne));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="Personne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchPersonne request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<Personne>(patchDic.Keys);

			var entity = new Personne();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<Personne>().Where(x => x.ClePersonne == request.ClePersonne).Update(patchDic.Keys);

			lock (_personneLock)
			{
				bool unique1 = Personne_CodPersonne_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Personne)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Personne), request.ClePersonne));
				}
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="PersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchPersonneProfil request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<PersonneProfil>(patchDic.Keys);

			var entity = new PersonneProfil();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<PersonneProfil>().Where(x => x.CleProfil == request.CleProfil).Update(patchDic.Keys);

			lock (_personneProfilLock)
			{
				bool unique1 = PersonneProfil_ClePersonne_CleService_EstUnique(entity, patchDic.Keys);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(PersonneProfil)));
				}
				bool unique2 = PersonneProfil_CodProfil_ClePersonne_EstUnique(entity, patchDic.Keys);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(PersonneProfil)));
				}

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneProfil), request.CleProfil));
				}
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="PersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public void Patch(PatchPersonneSignature request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            ModelDefinitionHelper.UndefinedFields<PersonneSignature>(patchDic.Keys);

			var entity = new PersonneSignature();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<PersonneSignature>().Where(x => x.ClePersonne == request.ClePersonne).Update(patchDic.Keys);

			lock (_personneSignatureLock)
			{

				int count = Db.UpdateOnly(entity, q);
				if (count == 0)
				{
					throw HttpError.NotFound(
						string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneSignature), request.ClePersonne));
				}
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="Personne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Personne"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public Personne Post(Personne request)
		{
			lock (_personneLock)
			{
				bool unique1 = Personne_CodPersonne_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(Personne)));
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
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(Personne), request.ClePersonne));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="PersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="PersonneProfil"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public PersonneProfil Post(PersonneProfil request)
		{
			lock (_personneProfilLock)
			{
				bool unique1 = PersonneProfil_ClePersonne_CleService_EstUnique(request);
				if (!unique1)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(PersonneProfil)));
				}
				bool unique2 = PersonneProfil_CodProfil_ClePersonne_EstUnique(request);
				if (!unique2)
				{
					throw HttpError.Conflict(
						string.Format(ServiceErrorMessages.EntityNotUnique, nameof(PersonneProfil)));
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
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneProfil), request.CleProfil));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Ajoute ou remplace l'entité <see cref="PersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="PersonneSignature"/> ajoutée.</returns>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		/// <exception cref="HttpError.Conflict"></exception>
		public PersonneSignature Post(PersonneSignature request)
		{
			lock (_personneSignatureLock)
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
							string.Format(ServiceErrorMessages.EntityByIdNotFound, nameof(PersonneSignature), request.ClePersonne));
					}
				}

				return request;
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="Personne"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="Personne"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectPersonneResponse Get(SelectPersonne request)
		{
			var q = Db.From<Personne>()
				.Limit(request.Skip, request.Take);
            
			if (request.Sort.IsNullOrEmpty())
            {
                q.OrderBy(x => x.LibPersonne); // Tri par défaut.
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

			return new SelectPersonneResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="PersonneProfil"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="PersonneProfil"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectPersonneProfilResponse Get(SelectPersonneProfil request)
		{
			var q = Db.From<PersonneProfil>()
				.Limit(request.Skip, request.Take);
            
			if (request.Sort.IsNullOrEmpty())
            {
                q.OrderBy(x => x.LibProfil); // Tri par défaut.
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

			return new SelectPersonneProfilResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

		/// <summary>
		/// Retourne l'entité <see cref="PersonneSignature"/> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="PersonneSignature"/> trouvée.</returns>
		/// <exception cref="ArgumentException">L'entité ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError.NotFound">L'entité spécifiée est introuvable.</exception>
		public SelectPersonneSignatureResponse Get(SelectPersonneSignature request)
		{
			var q = Db.From<PersonneSignature>()
				.Limit(request.Skip, request.Take);
            
			if (request.Sort.IsNullOrEmpty())
            {
                q.OrderBy(x => x.LibSignature); // Tri par défaut.
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

			return new SelectPersonneSignatureResponse
			{
				TotalCount = (int)count,
				Results = lst
			};
		}

	}
}
