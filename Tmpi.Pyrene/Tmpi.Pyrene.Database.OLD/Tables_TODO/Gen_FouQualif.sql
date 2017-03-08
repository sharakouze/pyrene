CREATE TABLE [SA_TMPI].[Gen_FouQualif] (
    [CleExArchive] TINYINT       NOT NULL,
    [CleFourn]     SMALLINT      NOT NULL,
    [CleCritereQ]  SMALLINT      NOT NULL,
    [CleTable]     SMALLINT      NOT NULL,
    [CleObjet0]    INT           NOT NULL,
    [CleObjet1]    INT           NULL,
    [ValNote]      TINYINT       NOT NULL,
    [NivImpact]    TINYINT       NOT NULL,
    [TxtQualif]    VARCHAR (255) NULL,
    CONSTRAINT [FK1_Gen_FouQualif] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK2_Gen_FouQualif] FOREIGN KEY ([CleCritereQ]) REFERENCES [SA_TMPI].[Gen_FouCritereQ] ([CleCritereQ])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_FouQualif]
    ON [SA_TMPI].[Gen_FouQualif]([CleFourn] ASC) WITH (FILLFACTOR = 90);

