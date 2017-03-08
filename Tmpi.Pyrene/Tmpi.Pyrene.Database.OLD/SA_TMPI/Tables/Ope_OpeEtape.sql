CREATE TABLE [SA_TMPI].[Ope_OpeEtape] (
    [CleSecteur]  SMALLINT       NULL,
    [CleService]  SMALLINT       NULL,
    [CleOpeTache] INT            NOT NULL,
    [CleOpeEtape] INT            IDENTITY (1, 1) NOT NULL,
    [NumEtape]    VARCHAR (50)   NOT NULL,
    [LibEtape]    VARCHAR (400)  NOT NULL,
    [TxtEtape]    VARCHAR (4000) NULL,
    [DatDebut]    SMALLDATETIME  NULL,
    [DatFin]      SMALLDATETIME  NULL,
    [SttEtape]    TINYINT        CONSTRAINT [DF_Ope_OpeEtape_SttEtape] DEFAULT ((0)) NOT NULL,
    [MntPrevu]    REAL           CONSTRAINT [DF_Ope_OpeEtape_MntPrevu] DEFAULT ((0)) NOT NULL,
    [EstSuspendu] BIT            CONSTRAINT [DF_Ope_OpeEtape_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpeEtape] PRIMARY KEY CLUSTERED ([CleOpeEtape] ASC)
);

