CREATE TABLE [SA_TMPI].[TrnP_PntIndisponibilite] (
    [ClePntIndisponibilite] INT           IDENTITY (1, 1) NOT NULL,
    [ClePoint]              INT           NOT NULL,
    [CleIndisponibilite]    SMALLINT      NOT NULL,
    [DatDebutPeriode]       SMALLDATETIME NULL,
    [DatFinPeriode]         SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_PntIndisponibilite] PRIMARY KEY CLUSTERED ([ClePntIndisponibilite] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_TrnP_PntIndisponibilite]
    ON [SA_TMPI].[TrnP_PntIndisponibilite]([ClePoint] ASC);

