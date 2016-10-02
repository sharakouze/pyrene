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
using System.Diagnostics;
using ServiceStack;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.Services.ServiceModel;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur l'entité <see cref="GenPersonne" />.
	/// </summary>
	public partial class GenPersonneService : Service
	{
		/// <summary>
		/// Supprime l'entité <see cref="GenPersonne" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteGenPersonne request)
		{
			int count = Db.DeleteById<GenPersonne>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonne), request.Id));
			}
		}

		/// <summary>
		/// Supprime l'entité <see cref="GenPersonneProfil" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteGenPersonneProfil request)
		{
			int count = Db.DeleteById<GenPersonneProfil>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonneProfil), request.Id));
			}
		}

		/// <summary>
		/// Ajoute l'entité <see cref="GenPersonne" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenPersonne" /> ajoutée.</returns>
		public GenPersonne Post(GenPersonne request)
		{
			var id = Db.Insert(request, selectIdentity: true);
			request.Id = (int)id;

			return request;
		}

		/// <summary>
		/// Remplace l'entité <see cref="GenPersonne" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Put(GenPersonne request)
		{
			int count = Db.Update(request);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonne), request.Id));
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="GenPersonne" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenPersonne" /> trouvée.</returns>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public GenPersonne Get(GetGenPersonne request)
		{
            var q = Db.From<GenPersonne>().Where(x => x.Id == request.Id);

            if (request.Fields != null && request.Fields.Any())
            {
                q = q.Select(request.Fields);
            }

			var entity = Db.Single<GenPersonne>(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonne), request.Id));
			}
			return entity;
		}

		/// <summary>
		/// Retourne l'entité <see cref="GenPersonneProfil" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenPersonneProfil" /> trouvée.</returns>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public GenPersonneProfil Get(GetGenPersonneProfil request)
		{
            var q = Db.From<GenPersonneProfil>().Where(x => x.Id == request.Id);

            if (request.Fields != null && request.Fields.Any())
            {
                q = q.Select(request.Fields);
            }

			var entity = Db.Single<GenPersonneProfil>(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonneProfil), request.Id));
			}
			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="GenPersonne" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Patch(PatchGenPersonne request)
		{
			Debug.Assert(request.Fields != null);
			if (request.Fields == null)
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

			var entity = new GenPersonne();
			var updateFields = PatchHelper.PopulateFromPatch(entity, request.Fields);

			var updateExpr = Db.From<GenPersonne>().Update(updateFields).Where(x => x.Id == request.Id);
			int count = Db.UpdateOnly(entity, updateExpr);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonne), request.Id));
			}
		}

		/// <summary>
		/// Met à jour l'entité <see cref="GenPersonneProfil" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Patch(PatchGenPersonneProfil request)
		{
			Debug.Assert(request.Fields != null);
			if (request.Fields == null)
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

			var entity = new GenPersonneProfil();
			var updateFields = PatchHelper.PopulateFromPatch(entity, request.Fields);

			var updateExpr = Db.From<GenPersonneProfil>().Update(updateFields).Where(x => x.Id == request.Id);
			int count = Db.UpdateOnly(entity, updateExpr);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenPersonneProfil), request.Id));
			}
		}

	}
}
