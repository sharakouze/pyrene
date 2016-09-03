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
using Tmpi.Pyrene.ServiceModel.Types;
using Tmpi.Pyrene.ServiceModel.Messages;

namespace Tmpi.Pyrene.ServiceInterface
{
    [Authenticate]
	public partial class GenMandatService : Service
	{
        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
		public List<string> Get(AutocompleteGenMandat request)
		{
            if (string.IsNullOrWhiteSpace(request.Text))
            {
                return null;
            }
			return null;
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
		public void Delete(DeleteGenMandat request)
		{
			int count = Db.DeleteById<GenMandat>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound("");
			}
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
		public void Delete(DeleteGenMandatMandataire request)
		{
			int count = Db.DeleteById<GenMandatMandataire>(request.Id);
			if (count == 0)
			{
				throw HttpError.NotFound("");
			}
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
		public GenMandat Get(GetGenMandat request)
		{
            var entity = Db.SingleById<GenMandat>(request.Id);
			if (entity == null)
			{
				throw HttpError.NotFound("");
			}
			return entity;
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
		public GenMandatMandataire Get(GetGenMandatMandataire request)
		{
            var entity = Db.SingleById<GenMandatMandataire>(request.Id);
			if (entity == null)
			{
				throw HttpError.NotFound("");
			}
			return entity;
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
		public void Any(SaveGenMandat request)
		{
			if (request.Id == 0)
            {
                Db.Insert(request.Entity);
            }
            else
            {
                Db.Update(request.Entity);
            }
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="request"></param>
		public void Any(SaveGenMandatMandataire request)
		{
			if (request.Id == 0)
            {
                Db.Insert(request.Entity);
            }
            else
            {
                Db.Update(request.Entity);
            }
		}

	}
}
