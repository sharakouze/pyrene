﻿using System.Collections.Generic;

namespace Tmpi.Pyrene.Infrastructure
{
    /// <summary>
    /// Modifie une entité spécifiée par son Id.
    /// </summary>
    /// <typeparam name="TKey">Type de Id.</typeparam>
    public abstract class PatchByIdRequestBase<TKey>
    {
        /// <summary>
        /// Clé primaire de l'entité à modifier.
        /// </summary>
        public TKey Id { get; set; }

        /// <summary>
        /// Collection de champs/valeurs à modifier.
        /// </summary>
        public List<PatchElement> Fields { get; set; }
    }
}