namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public class BasicEntity
    {
        /// <summary>
        /// Obtient ou définit l'identifiant unique.
        /// </summary>
        public int CleObjet { get; set; }

        /// <summary>
        /// Obtient ou définit le code.
        /// </summary>
        public string CodObjet { get; set; }

        /// <summary>
        /// Obtient ou définit la désignation.
        /// </summary>
        public string LibObjet { get; set; }

        /// <summary>
        /// Obtient ou définit l'état actif ou inactif.
        /// </summary>
        public bool EstActif { get; set; }
    }
}
