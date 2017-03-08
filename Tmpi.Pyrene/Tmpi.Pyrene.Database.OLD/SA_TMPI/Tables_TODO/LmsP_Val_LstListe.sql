CREATE TABLE [SA_TMPI].[LmsP_Val_LstListe] (
    [CleSociete]    SMALLINT       NULL,
    [CleSecteur]    SMALLINT       NULL,
    [CleService]    SMALLINT       NULL,
    [CleListe]      SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleListe_C]    SMALLINT       NULL,
    [CleListe_H]    SMALLINT       NOT NULL,
    [CodListe]      VARCHAR (100)  NOT NULL,
    [LibListe]      VARCHAR (400)  NOT NULL,
    [TxtListe]      VARCHAR (4000) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_LmsP_Val_LstListe_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_LmsP_Val_LstListe_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_LmsP_Val_LstListe] PRIMARY KEY CLUSTERED ([CleListe] ASC),
    CONSTRAINT [FK1_LmsP_Val_LstListe] FOREIGN KEY ([CleSociete]) REFERENCES [SA_TMPI].[Gen_SocSociete] ([CleSociete]),
    CONSTRAINT [FK2_LmsP_Val_LstListe] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK3_LmsP_Val_LstListe] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN_LmsP_Val_LstListe] UNIQUE NONCLUSTERED ([CodListe] ASC)
);

