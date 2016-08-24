using ServiceStack;
using System.Collections.Generic;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public enum BaseResultType
    {
        Undefined = 0,

        Entity,
        Simple,
        PrimaryKey,
        Name,
        Code
    }

    /// <summary>
    /// Représente une requête qui retourne l'entité <see cref="Entities.Gen_Societe"/> mise en forme.
    /// </summary>
    public class SelectGenSociete //: SelectRequest
    {
        public IEnumerable<int> CleSocieteList { get; set; }
    }
}
