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
	/// Service qui traite les requêtes sur l'entité <see cref="GenCompteur" />.
	/// </summary>
	public partial class GenCompteurService : Service
	{
		/// <summary>
		/// 
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<string> Get(AutocompleteGenCompteur request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

			//var q1 = Db.From<T>().Select(c => c.CodObjet).Where(c => c.CodObjet.Contains(request.Text));
			//var q2 = Db.From<T>().Select(c => c.LibObjet).Where(c => c.LibObjet.Contains(request.Text));

			return null;
		}

		/// <summary>
		/// Supprime l'entité <see cref="GenCompteur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public void Delete(DeleteGenCompteur request)
		{
			int count = Db.DeleteById<GenCompteur>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenCompteur), request.Id));
			}
		}

		/// <summary>
		/// Ajoute l'entité <see cref="GenCompteur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenCompteur" /> ajoutée.</returns>
		public GenCompteur Post(GenCompteur request)
		{
			var id = Db.Insert(request, selectIdentity: true);
			request.Id = (int)id;

			return request;
		}

		/// <summary>
		/// Remplace l'entité <see cref="GenCompteur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public void Put(GenCompteur request)
		{
			int count = Db.Update(request);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenCompteur), request.Id));
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="GenCompteur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenCompteur" /> trouvée.</returns>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public GenCompteur Get(GetGenCompteur request)
		{
			var entity = Db.SingleById<GenCompteur>(request.Id);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenCompteur), request.Id));
			}
			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="GenCompteur" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public void Patch(PatchGenCompteur request)
		{
			Debug.Assert(request.Fields != null);
			if (request.Fields == null)
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

			var entity = new GenCompteur();
			var updateFields = PatchHelper.PopulateFromPatch(entity, request.Fields);

			var updateExpr = Db.From<GenCompteur>().Update(updateFields).Where(x => x.Id == request.Id);
			int count = Db.UpdateOnly(entity, updateExpr);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenCompteur), request.Id));
			}
		}

	}
}