CREATE TABLE [SA_TMPI].[Fct_FacFacture] (
    [CleFacture]  INT             IDENTITY (1, 1) NOT NULL,
    [ClePayeur]   INT             NOT NULL,
    [NumFacture]  VARCHAR (25)    NOT NULL,
    [DatFacture]  SMALLDATETIME   NOT NULL,
    [DatEcheance] SMALLDATETIME   NOT NULL,
    [TxtFacture]  VARCHAR (4000)  NULL,
    [MntHT]       DECIMAL (10, 2) CONSTRAINT [DF_Fct_FacFacture_MntHT] DEFAULT ((0)) NOT NULL,
    [MntTVA]      DECIMAL (10, 2) CONSTRAINT [DF_Fct_FacFacture_MntTVA] DEFAULT ((0)) NOT NULL,
    [MntTTC]      DECIMAL (10, 2) CONSTRAINT [DF_Fct_FacFacture_MntTTC] DEFAULT ((0)) NOT NULL,
    [MntAPayer]   DECIMAL (10, 2) CONSTRAINT [DF_Fct_FacFacture_MntAPayer] DEFAULT ((0)) NOT NULL,
    [EstPaye]     BIT             CONSTRAINT [DF_Fct_FacFacture_EstPaye] DEFAULT ((0)) NOT NULL,
    [DatRelance]  SMALLDATETIME   NULL,
    [NbrRelance]  TINYINT         CONSTRAINT [DF_Fct_FacFacture_NbrRelance] DEFAULT ((0)) NOT NULL,
    [TypFacture]  TINYINT         CONSTRAINT [DF_Fct_FacFacture_TypFacture] DEFAULT ((1)) NOT NULL,
    [CleOrigine]  TINYINT         NULL,
    [CleExterne]  INT             NULL,
    CONSTRAINT [PK_Fct_FacFacture] PRIMARY KEY CLUSTERED ([CleFacture] ASC),
    CONSTRAINT [FK1_Fct_FacFacture] FOREIGN KEY ([ClePayeur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers]),
    CONSTRAINT [UN_Fct_FacFacture] UNIQUE NONCLUSTERED ([NumFacture] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Fct_FacFacture]
    ON [SA_TMPI].[Fct_FacFacture]([ClePayeur] ASC);

