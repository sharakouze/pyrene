CREATE TABLE [SA_TMPI].[Bdg_BdgMandat] (
    [CleBudget]     SMALLINT       NOT NULL,
    [CleBdgMandat]  INT            IDENTITY (1, 1) NOT NULL,
    [CleMandat]     SMALLINT       NOT NULL,
    [NivMandat]     SMALLINT       NOT NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [TxtMandat]     NVARCHAR (255) NULL,
    CONSTRAINT [PK_Bdg_BdgMandat] PRIMARY KEY CLUSTERED ([CleBdgMandat] ASC),
    CONSTRAINT [FK1_Bdg_BdgMandat] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[Bdg_BdgBudget] ([CleBudget])
);

