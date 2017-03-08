CREATE TABLE [SA_TMPI].[Ope_OpeTache] (
    [CleSecteur]   SMALLINT       NULL,
    [CleService]   SMALLINT       NULL,
    [CleOperation] INT            NOT NULL,
    [CleOpeTache]  INT            IDENTITY (1, 1) NOT NULL,
    [NumTache]     VARCHAR (50)   NOT NULL,
    [LibTache]     VARCHAR (400)  NOT NULL,
    [TxtTache]     VARCHAR (4000) NULL,
    [DatDebut]     SMALLDATETIME  NULL,
    [DatFin]       SMALLDATETIME  NULL,
    [SttTache]     TINYINT        CONSTRAINT [DF_Ope_OpeTache_SttTache] DEFAULT ((0)) NOT NULL,
    [MntPrevu]     REAL           CONSTRAINT [DF_Ope_OpeTache_MntPrevu] DEFAULT ((0)) NOT NULL,
    [EstSuspendu]  BIT            CONSTRAINT [DF_Ope_OpeTache_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpeTache] PRIMARY KEY CLUSTERED ([CleOpeTache] ASC)
);

