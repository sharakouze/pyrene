CREATE TABLE [SA_TMPI].[Trn_PntHabilitation] (
    [ClePoint]        INT      NOT NULL,
    [CleHabilitation] SMALLINT NOT NULL,
    CONSTRAINT [PK_Trn_PntHabilitation] PRIMARY KEY CLUSTERED ([CleHabilitation] ASC, [ClePoint] ASC),
    CONSTRAINT [FK1_Trn_PntHabilitation] FOREIGN KEY ([ClePoint]) REFERENCES [SA_TMPI].[Trn_PntPoint] ([ClePoint])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PntHabilitation]
    ON [SA_TMPI].[Trn_PntHabilitation]([ClePoint] ASC);

