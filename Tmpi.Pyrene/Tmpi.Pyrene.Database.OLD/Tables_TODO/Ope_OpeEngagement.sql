CREATE TABLE [SA_TMPI].[Ope_OpeEngagement] (
    [CleSecteur]       SMALLINT       NULL,
    [CleService]       SMALLINT       NULL,
    [CleOpeEtape]      INT            NOT NULL,
    [CleOpeEngagement] INT            IDENTITY (1, 1) NOT NULL,
    [NumEngagement]    VARCHAR (50)   NOT NULL,
    [LibEngagement]    VARCHAR (400)  NOT NULL,
    [TxtEngagement]    VARCHAR (4000) NULL,
    [DatDebut]         SMALLDATETIME  NULL,
    [DatFin]           SMALLDATETIME  NULL,
    [SttEngagement]    TINYINT        CONSTRAINT [DF_Ope_OpeEngagement_SttEngagement] DEFAULT ((0)) NOT NULL,
    [MntPrevu]         REAL           CONSTRAINT [DF_Ope_OpeEngagement_MntPrevu] DEFAULT ((0)) NOT NULL,
    [EstSuspendu]      BIT            CONSTRAINT [DF_Ope_OpeEngagement_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpeEngagement] PRIMARY KEY CLUSTERED ([CleOpeEngagement] ASC)
);

