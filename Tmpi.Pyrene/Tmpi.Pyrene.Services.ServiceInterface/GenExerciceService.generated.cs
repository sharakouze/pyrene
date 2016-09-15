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
	/// Service qui traite les requêtes sur l'entité <see cref="GenExercice" />.
	/// </summary>
	public partial class GenExerciceService : Service
	{
		/// <summary>
		/// 
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<string> Get(AutocompleteGenExercice request)
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
		/// Supprime l'entité <see cref="GenExercice" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public void Delete(DeleteGenExercice request)
		{
			int count = Db.DeleteById<GenExercice>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenExercice), request.Id));
			}
		}

		/// <summary>
		/// Ajoute l'entité <see cref="GenExercice" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenExercice" /> ajoutée.</returns>
		public GenExercice Post(GenExercice request)
		{
			var id = Db.Insert(request, selectIdentity: true);
			request.Id = (int)id;

			return request;
		}

		/// <summary>
		/// Remplace l'entité <see cref="GenExercice" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public void Put(GenExercice request)
		{
			int count = Db.Update(request);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenExercice), request.Id));
			}
		}

		/// <summary>
		/// Retourne l'entité <see cref="GenExercice" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Entité <see cref="GenExercice" /> trouvée.</returns>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public GenExercice Get(GetGenExercice request)
		{
			var entity = Db.SingleById<GenExercice>(request.Id);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenExercice), request.Id));
			}
			return entity;
		}

		/// <summary>
		/// Met à jour l'entité <see cref="GenExercice" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="HttpError">L'entité est introuvable.</exception>
		public void Patch(PatchGenExercice request)
		{
			Debug.Assert(request.Fields != null);
			if (request.Fields == null)
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

			var entity = new GenExercice();
			var updateFields = PatchHelper.PopulateFromPatch(entity, request.Fields);

			var updateExpr = Db.From<GenExercice>().Update(updateFields).Where(x => x.Id == request.Id);
			int count = Db.UpdateOnly(entity, updateExpr);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ErrorMessages.EntityByIdNotFound, nameof(GenExercice), request.Id));
			}
		}

	}
}