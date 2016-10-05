CREATE INDEX [IX_GenCompteur_LibObjet] ON [GenCompteur] ([LibObjet]);

GO

CREATE INDEX [IX_GenExercice_LibObjet] ON [GenExercice] ([LibObjet]);

GO

CREATE INDEX [IX_GenFourn_LibObjet] ON [GenFourn] ([LibObjet]);

GO

CREATE INDEX [IX_GenMandat_LibObjet] ON [GenMandat] ([LibObjet]);

GO

CREATE INDEX [IX_GenPersonne_LibObjet] ON [GenPersonne] ([NomPersonne]);

GO

CREATE INDEX [IX_GenSecteur_LibObjet] ON [GenSecteur] ([LibObjet]);

GO

CREATE INDEX [IX_GenService_LibObjet] ON [GenService] ([LibObjet]);

GO

CREATE INDEX [IX_GenSociete_LibObjet] ON [GenSociete] ([LibObjet]);

GO

CREATE INDEX [IX_GenTVA_LibObjet] ON [GenTVA] ([LibObjet]);

GO

--CREATE FULLTEXT INDEX ON [GenCompteur] ([LibObjet]) KEY INDEX [PK_GenCompteur];
