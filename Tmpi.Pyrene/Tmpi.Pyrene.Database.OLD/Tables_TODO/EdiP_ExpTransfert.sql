CREATE TABLE [SA_TMPI].[EdiP_ExpTransfert] (
    [CleExpTransfert]  INT           IDENTITY (1, 1) NOT NULL,
    [CleExport]        SMALLINT      NOT NULL,
    [NumOrdre]         TINYINT       NOT NULL,
    [LibTransfert]     VARCHAR (100) NULL,
    [TypCommunication] TINYINT       NOT NULL,
    [AdrCommunication] VARCHAR (100) NULL,
    [CodUtilisateur]   VARCHAR (50)  NULL,
    [PwdUtilisateur]   VARCHAR (50)  NULL,
    [TypDonnee]        TINYINT       NOT NULL,
    [ValFormatFichier] VARCHAR (50)  NULL,
    [ValFormatDate]    VARCHAR (20)  NULL,
    [CodEncodage]      VARCHAR (50)  NULL,
    [NomProcedure]     VARCHAR (50)  NULL,
    [EstActif]         BIT           CONSTRAINT [DF_EdiP_ExpTransfert_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]      SMALLDATETIME NOT NULL,
    [CleCreateur]      SMALLINT      NOT NULL,
    [DatModif]         SMALLDATETIME NULL,
    [CleOperateur]     SMALLINT      NULL,
    [TypSource]        TINYINT       NULL,
    CONSTRAINT [PK_EdiP_ExpTransfert] PRIMARY KEY CLUSTERED ([CleExpTransfert] ASC),
    CONSTRAINT [FK1_EdiP_ExpTransfert] FOREIGN KEY ([CleExport]) REFERENCES [SA_TMPI].[EdiP_ExpExport] ([CleExport])
);

