CREATE INDEX [IX_Compteur_LibObjet] ON [Gen].[Compteur] ([LibObjet]);

GO

CREATE INDEX [IX_Exercice_LibObjet] ON [Gen].[Exercice] ([LibObjet]);

GO

CREATE INDEX [IX_Fourn_LibObjet] ON [Gen].[Fourn] ([LibObjet]);

GO

CREATE INDEX [IX_Mandat_LibObjet] ON [Gen].[Mandat] ([LibObjet]);

GO

CREATE INDEX [IX_Personne_NomPersonne] ON [Gen].[Personne] ([NomPersonne]);

GO

CREATE INDEX [IX_Service_LibObjet] ON [Gen].[Service] ([LibObjet]);

GO

CREATE INDEX [IX_TVA_LibObjet] ON [Gen].[TVA] ([LibObjet]);

GO

CREATE INDEX [IX_Tiers_NomTiers] ON [Gen].[Tiers] ([NomTiers]);

GO

CREATE INDEX [IX_TypeIdent_LibObjet] ON [Gen].[TypeIdent] ([LibObjet]);

GO

CREATE INDEX [IX_CiviliteTiers_LibObjet] ON [Gen].[CiviliteTiers] ([LibObjet]);

GO

CREATE INDEX [IX_ProprieteTiers_LibObjet] ON [Gen].[ProprieteTiers] ([LibObjet]);

GO
