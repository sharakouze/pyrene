CREATE TABLE [SA_TMPI].[Lsn_Demande] (
    [CleMLiaison] SMALLINT NOT NULL,
    [CleObjet]    INT      NOT NULL,
    [DatCreation] DATETIME CONSTRAINT [DF_Lsn_Demande_DatCreation] DEFAULT (getdate()) NOT NULL,
    [EstExclu]    BIT      CONSTRAINT [DF_Lsn_Demande_EstExclu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [FK1_Lsn_Demande] FOREIGN KEY ([CleMLiaison]) REFERENCES [SA_TMPI].[Lsn_MLsnMLiaison] ([CleMLiaison])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lsn_Demande]
    ON [SA_TMPI].[Lsn_Demande]([CleMLiaison] ASC);

