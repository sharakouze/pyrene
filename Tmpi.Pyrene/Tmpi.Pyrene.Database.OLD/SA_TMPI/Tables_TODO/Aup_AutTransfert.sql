CREATE TABLE [SA_TMPI].[Aup_AutTransfert] (
    [CleAutomate]      SMALLINT      NOT NULL,
    [CleAutTransfert]  INT           IDENTITY (1, 1) NOT NULL,
    [TypTransfert]     TINYINT       NOT NULL,
    [EstActif]         BIT           CONSTRAINT [DF_Aup_AutTransfert_EstActif] DEFAULT ((1)) NOT NULL,
    [TypCommunication] TINYINT       NOT NULL,
    [AdrCommunication] VARCHAR (100) NULL,
    [CodUtilisateur]   VARCHAR (50)  NULL,
    [PwdUtilisateur]   VARCHAR (50)  NULL,
    [TypDonnee]        TINYINT       NOT NULL,
    [NomProcedure]     VARCHAR (50)  NULL,
    [ValFormatFichier] VARCHAR (50)  NULL,
    [ValFormatDate]    VARCHAR (20)  NULL,
    [CodEncodage]      VARCHAR (50)  NULL,
    CONSTRAINT [PK_Aup_AutTransfert] PRIMARY KEY CLUSTERED ([CleAutTransfert] ASC)
);

