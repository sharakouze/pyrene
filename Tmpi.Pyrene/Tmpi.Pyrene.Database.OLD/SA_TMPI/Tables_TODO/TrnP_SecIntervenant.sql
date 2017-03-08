CREATE TABLE [SA_TMPI].[TrnP_SecIntervenant] (
    [CleSecteur]     SMALLINT NOT NULL,
    [CleIntervenant] SMALLINT NOT NULL,
    CONSTRAINT [PK_TrnP_SecIntervenant] PRIMARY KEY CLUSTERED ([CleSecteur] ASC, [CleIntervenant] ASC)
);

