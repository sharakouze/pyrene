CREATE TABLE [SA_TMPI].[Gen_TrsContact] (
    [CleTiers]      INT            NOT NULL,
    [CleContact]    INT            IDENTITY (1, 1) NOT NULL,
    [NomContact]    VARCHAR (100)  NOT NULL,
    [TxtContact]    VARCHAR (1000) NULL,
    [CleGenre]      SMALLINT       NOT NULL,
    [CleFonction]   SMALLINT       NULL,
    [NumEMail]      VARCHAR (100)  NULL,
    [NumTelep]      VARCHAR (25)   NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Gen_TrsContact_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Gen_TrsContact_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       CONSTRAINT [DF_Gen_TrsContact_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_Gen_TrsContact] PRIMARY KEY CLUSTERED ([CleContact] ASC),
    CONSTRAINT [FK1_Gen_TrsContact] FOREIGN KEY ([CleTiers]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [FK2_Gen_TrsContact] FOREIGN KEY ([CleFonction]) REFERENCES [SA_TMPI].[Gen_Trs_Fonction] ([CleFonction])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_TrsContact]
    ON [SA_TMPI].[Gen_TrsContact]([CleTiers] ASC);

