CREATE TABLE [SA_TMPI].[Bdg_BdgAction] (
    [CleBudget]      SMALLINT        NOT NULL,
    [CleSection]     SMALLINT        NOT NULL,
    [CleAction]      SMALLINT        NOT NULL,
    [MntBudgete]     DECIMAL (10, 2) NOT NULL,
    [TxtAction]      VARCHAR (255)   NULL,
    [LibCritere1]    VARCHAR (100)   NULL,
    [LibCritere2]    VARCHAR (100)   NULL,
    [LibCritere3]    VARCHAR (100)   NULL,
    [CleFamille]     SMALLINT        NOT NULL,
    [CleBdgAction]   INT             IDENTITY (1, 1) NOT NULL,
    [CleRubrique]    SMALLINT        NOT NULL,
    [ClePoste]       SMALLINT        NOT NULL,
    [CleCritere1]    SMALLINT        NOT NULL,
    [CleCritere2]    SMALLINT        NOT NULL,
    [CleCritere3]    SMALLINT        NOT NULL,
    [CleResponsable] SMALLINT        NOT NULL,
    CONSTRAINT [PK_Bdg_BdgAction] PRIMARY KEY CLUSTERED ([CleBdgAction] ASC),
    CONSTRAINT [FK1_Bdg_BdgAction] FOREIGN KEY ([CleBudget], [CleSection]) REFERENCES [SA_TMPI].[Bdg_BdgSection] ([CleBudget], [CleSection]),
    CONSTRAINT [FK3_Bdg_BdgAction] FOREIGN KEY ([CleAction]) REFERENCES [SA_TMPI].[Bdg_ActAction] ([CleAction]),
    CONSTRAINT [FK4_Bdg_BdgAction] FOREIGN KEY ([CleRubrique]) REFERENCES [SA_TMPI].[Bdg_ActRubrique] ([CleRubrique]),
    CONSTRAINT [FK5_Bdg_BdgAction] FOREIGN KEY ([ClePoste]) REFERENCES [SA_TMPI].[Bdg_ActPoste] ([ClePoste])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Bdg_BdgAction]
    ON [SA_TMPI].[Bdg_BdgAction]([CleBudget] ASC);

