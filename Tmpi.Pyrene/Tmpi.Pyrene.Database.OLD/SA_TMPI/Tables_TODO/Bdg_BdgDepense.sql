CREATE TABLE [SA_TMPI].[Bdg_BdgDepense] (
    [CleBudget]     SMALLINT        NOT NULL,
    [CleFacture]    INT             NOT NULL,
    [CleBdgDepense] INT             IDENTITY (1, 1) NOT NULL,
    [CleSection]    SMALLINT        NOT NULL,
    [LibDepense]    VARCHAR (100)   NOT NULL,
    [TxtDepense]    VARCHAR (255)   NULL,
    [MntHT]         DECIMAL (10, 2) NOT NULL,
    [CleAction]     SMALLINT        NOT NULL,
    [CleRubrique]   SMALLINT        NOT NULL,
    [ClePoste]      SMALLINT        NOT NULL,
    [AnnExercice]   SMALLINT        NOT NULL,
    [CleEngagement] INT             NOT NULL,
    [MntEngagement] INT             NOT NULL,
    CONSTRAINT [PK_Bdg_BdgDepense] PRIMARY KEY CLUSTERED ([CleBdgDepense] ASC),
    CONSTRAINT [FK1_Bdg_BdgDepense] FOREIGN KEY ([CleBudget]) REFERENCES [SA_TMPI].[Bdg_BdgBudget] ([CleBudget]),
    CONSTRAINT [FK3_Bdg_BdgDepense] FOREIGN KEY ([CleSection]) REFERENCES [SA_TMPI].[Bdg_Bdg_Section] ([CleSection]),
    CONSTRAINT [FK4_Bdg_BdgDepense] FOREIGN KEY ([CleAction]) REFERENCES [SA_TMPI].[Bdg_ActAction] ([CleAction]),
    CONSTRAINT [FK5_Bdg_BdgDepense] FOREIGN KEY ([CleRubrique]) REFERENCES [SA_TMPI].[Bdg_ActRubrique] ([CleRubrique]),
    CONSTRAINT [FK6_Bdg_BdgDepense] FOREIGN KEY ([ClePoste]) REFERENCES [SA_TMPI].[Bdg_ActPoste] ([ClePoste])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Bdg_BdgDepense]
    ON [SA_TMPI].[Bdg_BdgDepense]([CleBudget] ASC);

