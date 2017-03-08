CREATE TABLE [SA_TMPI].[Doc_DocFamille] (
    [CleFamille]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodFamille]    VARCHAR (50)  NOT NULL,
    [LibFamille]    VARCHAR (100) NOT NULL,
    [TxtFamille]    VARCHAR (255) NULL,
    [IndActif]      BIT           CONSTRAINT [DF_Doc_DocFamille_IndActif] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Doc_DocFamille] PRIMARY KEY CLUSTERED ([CleFamille] ASC),
    CONSTRAINT [UN1_Doc_DocFamille] UNIQUE NONCLUSTERED ([CodFamille] ASC)
);

