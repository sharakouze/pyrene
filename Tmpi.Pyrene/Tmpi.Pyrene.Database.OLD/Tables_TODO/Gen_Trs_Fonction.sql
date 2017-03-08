CREATE TABLE [SA_TMPI].[Gen_Trs_Fonction] (
    [CleFonction]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleFonction_C] SMALLINT      NULL,
    [CleFonction_H] SMALLINT      NOT NULL,
    [CodFonction]   VARCHAR (25)  NOT NULL,
    [LibFonction]   VARCHAR (100) NOT NULL,
    [TxtFonction]   VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gen_Trs_Fonction_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gen_Trs_Fonction_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Gen_Trs_Fonction] PRIMARY KEY CLUSTERED ([CleFonction] ASC),
    CONSTRAINT [UN_Gen_Trs_Fonction] UNIQUE NONCLUSTERED ([CodFonction] ASC)
);

