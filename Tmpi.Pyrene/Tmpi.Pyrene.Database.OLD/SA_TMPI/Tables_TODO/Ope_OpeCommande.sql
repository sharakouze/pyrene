CREATE TABLE [SA_TMPI].[Ope_OpeCommande] (
    [CleSecteur]       SMALLINT       NULL,
    [CleService]       SMALLINT       NULL,
    [CleOpeEngagement] INT            NOT NULL,
    [CleOpeCommande]   INT            IDENTITY (1, 1) NOT NULL,
    [NumCommande]      VARCHAR (50)   NOT NULL,
    [LibCommande]      VARCHAR (400)  NOT NULL,
    [TxtCommande]      VARCHAR (4000) NULL,
    [DatDebut]         SMALLDATETIME  NULL,
    [DatFin]           SMALLDATETIME  NULL,
    [SttCommande]      TINYINT        CONSTRAINT [DF_Ope_OpeCommande_SttCommande] DEFAULT ((0)) NOT NULL,
    [MntPrevu]         REAL           CONSTRAINT [DF_Ope_OpeCommande_MntPrevu] DEFAULT ((0)) NOT NULL,
    [EstSuspendu]      BIT            CONSTRAINT [DF_Ope_OpeCommande_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpeCommande] PRIMARY KEY CLUSTERED ([CleOpeCommande] ASC)
);

