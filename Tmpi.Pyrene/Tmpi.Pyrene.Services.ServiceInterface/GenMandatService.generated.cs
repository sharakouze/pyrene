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
	/// Service qui traite les requêtes sur les ressources <see cref="GenMandat" />.
	/// </summary>
	public partial class GenMandatService : Service
	{
		/// <summary>
		/// Supprime la ressource <see cref="GenMandat" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenMandat request)
		{
			int count = Db.DeleteById<GenMandat>(request.CleMandat);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenMandat), request.CleMandat));
			}
		}

		/// <summary>
		/// Supprime la ressource <see cref="GenMandatMandataire" /> spécifiée dans la requête.
		/// </summary>
		/// <param name="request">Requête à traiter.</param>
		/// <exception cref="HttpError">La ressource spécifiée est introuvable.</exception>
		public void Delete(DeleteGenMandatMandataire request)
		{
			int count = Db.DeleteById<GenMandatMandataire>(request.CleMandataire);
			if (count == 0)
			{
				throw HttpError.NotFound(
					string.Format(ServicesErrorMessages.ResourceByIdNotFound, nameof(GenMandatMandataire), request.CleMandataire));
			}
		}

	}
}
