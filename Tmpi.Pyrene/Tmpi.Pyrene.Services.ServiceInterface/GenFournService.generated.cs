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
using ServiceStack;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.Services.ServiceModel;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
	/// <summary>
	/// Service qui traite les requêtes sur les ressources <see cref="GenFourn" />.
	/// </summary>
	public partial class GenFournService : Service
	{
		/// <summary>
		/// 
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns></returns>
		public List<BasicEntity> Get(AutocompleteGenFourn request)
		{
			if (string.IsNullOrWhiteSpace(request.Text))
			{
				return null;
			}

            var q = Db.From<GenFourn>().Where(x => x.LibObjet.Contains(request.Text));
            if (request.Max > 0)
            {
                q = q.Limit(request.Max);
            }

            var items = Db.Select<BasicEntity>(q);
            return items;
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenFourn" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenFourn request)
		{
			int count = Db.DeleteById<GenFourn>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.Id));
			}
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenFournBanque" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenFournBanque request)
		{
			int count = Db.DeleteById<GenFournBanque>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.Id));
			}
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenFournContact" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenFournContact request)
		{
			int count = Db.DeleteById<GenFournContact>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.Id));
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFourn" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public List<GenFourn> Get(FindGenFourn request)
		{
            return null;
		}

		/// <summary>
		/// Ajoute la ressource <see cref="GenFourn" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFourn" /> ajoutée.</returns>
		public GenFourn Post(GenFourn request)
		{
			var id = Db.Insert(request, selectIdentity: true);
			request.Id = (int)id;

			return request;
		}

		/// <summary>
		/// Remplace la ressource <see cref="GenFourn" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Put(GenFourn request)
		{
			int count = Db.Update(request);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.Id));
			}
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenFourn" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFourn" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenFourn Get(GetGenFourn request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var undefFields = ModelDefinitionHelper.GetUndefinedFields<GenFourn>(request.Fields);
                if (undefFields.Any())
                {
                    string str = string.Join(", ", undefFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenFourn), str));
                }
            }

            var q = Db.From<GenFourn>().Where(x => x.Id == request.Id).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.Id));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenFournBanque" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFournBanque" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenFournBanque Get(GetGenFournBanque request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var undefFields = ModelDefinitionHelper.GetUndefinedFields<GenFournBanque>(request.Fields);
                if (undefFields.Any())
                {
                    string str = string.Join(", ", undefFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenFournBanque), str));
                }
            }

            var q = Db.From<GenFournBanque>().Where(x => x.Id == request.Id).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.Id));
			}

			return entity;
		}

		/// <summary>
		/// Retourne la ressource <see cref="GenFournContact" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <returns>Ressource <see cref="GenFournContact" /> trouvée.</returns>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public GenFournContact Get(GetGenFournContact request)
		{
            if (!request.Fields.IsNullOrEmpty())
            {
                var undefFields = ModelDefinitionHelper.GetUndefinedFields<GenFournContact>(request.Fields);
                if (undefFields.Any())
                {
                    string str = string.Join(", ", undefFields.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenFournContact), str));
                }
            }

            var q = Db.From<GenFournContact>().Where(x => x.Id == request.Id).Select(request.Fields);

			var entity = Db.Single(q);
			if (entity == null)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.Id));
			}

			return entity;
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFourn" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Patch(PatchGenFourn request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            var undefFields = ModelDefinitionHelper.GetUndefinedFields<GenFourn>(patchDic.Keys);
            if (undefFields.Any())
            {
                string str = string.Join(", ", undefFields.Select(f => "'" + f + "'"));
                throw new ArgumentException(
                    string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenFourn), str));
            }

			var entity = new GenFourn();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenFourn>().Where(x => x.Id == request.Id).Update(patchDic.Keys);

			int count = Db.UpdateOnly(entity, q);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFourn), request.Id));
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFournBanque" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Patch(PatchGenFournBanque request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            var undefFields = ModelDefinitionHelper.GetUndefinedFields<GenFournBanque>(patchDic.Keys);
            if (undefFields.Any())
            {
                string str = string.Join(", ", undefFields.Select(f => "'" + f + "'"));
                throw new ArgumentException(
                    string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenFournBanque), str));
            }

			var entity = new GenFournBanque();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenFournBanque>().Where(x => x.Id == request.Id).Update(patchDic.Keys);

			int count = Db.UpdateOnly(entity, q);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFournBanque), request.Id));
			}
		}

		/// <summary>
		/// Met à jour la ressource <see cref="GenFournContact" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="ArgumentNullException"></exception>
		/// <exception cref="ArgumentException">La ressource ne contient pas tous les champs spécifiés.</exception>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Patch(PatchGenFournContact request)
		{
			if (request.Fields.IsNullOrEmpty())
			{
				throw new ArgumentNullException(nameof(request.Fields));
			}

            var patchDic = request.Fields.ToDictionary(f => f.Field, f => f.Value);

            var undefFields = ModelDefinitionHelper.GetUndefinedFields<GenFournContact>(patchDic.Keys);
            if (undefFields.Any())
            {
                string str = string.Join(", ", undefFields.Select(f => "'" + f + "'"));
                throw new ArgumentException(
                    string.Format(ServicesErrorMessages.ResourceFieldsNotFound, nameof(GenFournContact), str));
            }

			var entity = new GenFournContact();
			PatchHelper.PopulateFromPatch(entity, patchDic);

			var q = Db.From<GenFournContact>().Where(x => x.Id == request.Id).Update(patchDic.Keys);

			int count = Db.UpdateOnly(entity, q);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenFournContact), request.Id));
			}
		}

	}
}
