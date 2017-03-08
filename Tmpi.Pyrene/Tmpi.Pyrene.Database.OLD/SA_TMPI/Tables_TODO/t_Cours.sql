CREATE TABLE [SA_TMPI].[t_Cours] (
    [CleCours]    SMALLINT        IDENTITY (1, 1) NOT NULL,
    [DatCours]    DATETIME        NOT NULL,
    [CleDevise_1] TINYINT         NOT NULL,
    [CleDevise_2] TINYINT         NOT NULL,
    [ValCours]    DECIMAL (15, 3) CONSTRAINT [DF_t_Cours_ValCours] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_t_Cours] PRIMARY KEY CLUSTERED ([CleDevise_1] ASC, [CleDevise_2] ASC),
    CONSTRAINT [UN1_t_Cours] UNIQUE NONCLUSTERED ([CleDevise_1] ASC, [CleDevise_2] ASC, [DatCours] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_Cours]
    ON [SA_TMPI].[t_Cours]([CleDevise_1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ID2_t_Cours]
    ON [SA_TMPI].[t_Cours]([CleDevise_2] ASC) WITH (FILLFACTOR = 90);

