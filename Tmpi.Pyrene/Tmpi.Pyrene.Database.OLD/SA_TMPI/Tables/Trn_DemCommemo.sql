CREATE TABLE [SA_TMPI].[Trn_DemCommemo] (
    [CleDemTache]  INT             NOT NULL,
    [CleCommemo]   SMALLINT        NOT NULL,
    [EstOptionnel] BIT             CONSTRAINT [DF_Trn_DemCommemo_EstOptionnel] DEFAULT ((0)) NOT NULL,
    [TypMouvement] TINYINT         CONSTRAINT [DF_Trn_DemCommemo_TypMouvement] DEFAULT ((0)) NOT NULL,
    [CleDemande]   INT             NOT NULL,
    [ValResultat]  VARCHAR (100)   NULL,
    [ValResultatN] DECIMAL (18, 9) NULL,
    [ValResultatD] SMALLDATETIME   NULL,
    [ValResultatL] SMALLINT        NULL,
    [OpeResultat]  VARCHAR (2)     NULL,
    [NumOrdre]     SMALLINT        NULL,
    CONSTRAINT [PK_Trn_DemCommemo] PRIMARY KEY CLUSTERED ([CleCommemo] ASC, [CleDemande] ASC, [CleDemTache] ASC),
    CONSTRAINT [FK1_Trn_DemCommemo] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Trn_DemDemande] ([CleDemande])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_DemCommemo]
    ON [SA_TMPI].[Trn_DemCommemo]([CleDemTache] ASC);

