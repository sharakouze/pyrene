CREATE TABLE [SA_TMPI].[Doc_DocSFamille] (
    [CleFamille]    SMALLINT      NOT NULL,
    [CleSFamille]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodSFamille]   VARCHAR (50)  NOT NULL,
    [LibSFamille]   VARCHAR (100) NOT NULL,
    [TxtSFamille]   VARCHAR (255) NULL,
    [IndActif]      BIT           CONSTRAINT [DF_Doc_DocSFamille_IndActif] DEFAULT ((0)) NOT NULL,
    [DatModif]      SMALLDATETIME NOT NULL,
    [CleOperateur]  SMALLINT      NOT NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Doc_DocSFamille] PRIMARY KEY CLUSTERED ([CleSFamille] ASC),
    CONSTRAINT [FK1_Doc_DocSFamille] FOREIGN KEY ([CleFamille]) REFERENCES [SA_TMPI].[Doc_DocFamille] ([CleFamille]),
    CONSTRAINT [UN1_Doc_DocSFamille] UNIQUE NONCLUSTERED ([CleFamille] ASC, [CodSFamille] ASC)
);

