CREATE INDEX [IX_Compteur_LibCompteur] ON [Gen].[Compteur] ([LibCompteur]);

GO

CREATE INDEX [IX_Exercice_LibExercice] ON [Gen].[Exercice] ([LibExercice]);

GO

CREATE INDEX [IX_Fourn_LibFourn] ON [Gen].[Fourn] ([LibFourn]);

GO

CREATE INDEX [IX_Mandat_LibMandat] ON [Gen].[Mandat] ([LibMandat]);

GO

CREATE INDEX [IX_Personne_NomPersonne] ON [Gen].[Personne] ([NomPersonne]);

GO

CREATE INDEX [IX_Service_LibService] ON [Gen].[Service] ([LibService]);

GO

CREATE INDEX [IX_TVA_LibTVA] ON [Gen].[TVA] ([LibTVA]);

GO

CREATE INDEX [IX_Tiers_NomTiers] ON [Gen].[Tiers] ([NomTiers]);

GO

CREATE INDEX [IX_TypeIdent_LibTypeIdent] ON [Gen].[TypeIdent] ([LibTypeIdent]);

GO

CREATE INDEX [IX_CiviliteTiers_LibCiviliteTiers] ON [Gen].[CiviliteTiers] ([LibCiviliteTiers]);

GO

CREATE INDEX [IX_ProprieteTiers_LibProprieteTiers] ON [Gen].[ProprieteTiers] ([LibProprieteTiers]);

GO
