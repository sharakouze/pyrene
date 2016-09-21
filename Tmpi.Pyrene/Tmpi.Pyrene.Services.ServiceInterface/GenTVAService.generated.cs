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
using Tmpi.Pyrene.Infrastructure;
using Tmpi.Pyrene.Services.ServiceModel;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur l'entité <see cref="GenTVA" />.
	/// </summary>
	public partial class GenTVAService : Service
	{
		/// <summary>
		/// 
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<RessourceItem> Get(AutocompleteGenTVA request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<GenTVA>().Where(x => x.LibObjet.Contains(request.Text));
            if (request.Max > 0)
            {
                q = q.Limit(request.Max);
            }

            var items = Db.Select<RessourceItem>(q);
            return items;
		}

		/// <summary>
		/// Supprime l'entité <see cref="GenTVA" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Delete(DeleteGenTVA request)
		{
			int count = Db.DeleteById<GenTVA>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenTVA), request.Id));
			}
		}

		/// <summary>
		/// Ajoute l'entité <see cref="GenTVA" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenTVA" /> ajoutée.</returns>
		public GenTVA Post(GenTVA request)
		{
			var id = Db.Insert(request, selectIdentity: true);
			request.Id = (int)id;

			return request;
		}

		/// <summary>
		/// Remplace l'entité <see cref="GenTVA" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Put(GenTVA request)
		{
			int count = Db.Update(request);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenTVA), request.Id));
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="GenTVA" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenTVA" /> trouvée.</returns>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public GenTVA Get(GetGenTVA request)
		{
			var entity = Db.SingleById<GenTVA>(request.Id);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenTVA), request.Id));
			}
			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="GenTVA" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="HttpError">L'entité spécifiée est introuvable.</exception>
		public void Patch(PatchGenTVA request)
		{
			Debug.Assert(request.Fields != null);
			if (request.Fields == null)
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

			var entity = new GenTVA();
			var updateFields = PatchHelper.PopulateFromPatch(entity, request.Fields);

			var updateExpr = Db.From<GenTVA>().Update(updateFields).Where(x => x.Id == request.Id);
			int count = Db.UpdateOnly(entity, updateExpr);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenTVA), request.Id));
			}
		}

	}
}
