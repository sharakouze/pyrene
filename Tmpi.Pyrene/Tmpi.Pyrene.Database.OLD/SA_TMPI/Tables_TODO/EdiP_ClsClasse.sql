CREATE TABLE [SA_TMPI].[EdiP_ClsClasse] (
    [CleClasse]      INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodClasse]      VARCHAR (50)   NOT NULL,
    [LibClasse]      VARCHAR (255)  NOT NULL,
    [TxtClasse]      VARCHAR (2000) NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_ClsClasse_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_ClsClasse_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_ClsClasse] PRIMARY KEY CLUSTERED ([CleClasse] ASC),
    CONSTRAINT [UN_EdiP_ClsClasse] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodClasse] ASC)
);

