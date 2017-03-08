CREATE TABLE [SA_TMPI].[Usr_Acc_Liste] (
    [CleListe]        SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodListe]        VARCHAR (50)   NOT NULL,
    [LibListe]        VARCHAR (500)  NULL,
    [TxtListe]        VARCHAR (2000) NULL,
    [TypObjet]        SMALLINT       NOT NULL,
    [EstActif]        BIT            CONSTRAINT [DF_Usr_Acc_Liste_EstActif] DEFAULT ((0)) NOT NULL,
    [CleProprietaire] SMALLINT       NOT NULL,
    [DatCreation]     SMALLDATETIME  NOT NULL,
    [CleCreateur]     SMALLINT       NOT NULL,
    [DatModification] SMALLDATETIME  NULL,
    [CleModificateur] SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     SMALLINT       NULL,
    CONSTRAINT [PK_Usr_Acc_Liste] PRIMARY KEY CLUSTERED ([CleListe] ASC)
);

