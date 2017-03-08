CREATE TABLE [SA_TMPI].[Lsn_LsnDemande] (
    [CleLiaison]  SMALLINT NOT NULL,
    [CleObjet]    INT      NOT NULL,
    [DatCreation] DATETIME CONSTRAINT [DF_Lsn_LsnDemande_DatCreation] DEFAULT (getdate()) NOT NULL,
    [DatLiaison]  DATETIME CONSTRAINT [DF_Lsn_LsnDemande_DatLiaison] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [FK1_Lsn_LsnDemande] FOREIGN KEY ([CleLiaison]) REFERENCES [SA_TMPI].[Lsn_LsnLiaison] ([CleLiaison])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lsn_LsnDemande]
    ON [SA_TMPI].[Lsn_LsnDemande]([CleLiaison] ASC);

