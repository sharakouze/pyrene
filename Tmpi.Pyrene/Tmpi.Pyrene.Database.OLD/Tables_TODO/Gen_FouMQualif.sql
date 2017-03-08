CREATE TABLE [SA_TMPI].[Gen_FouMQualif] (
    [CleFourn]    SMALLINT       NOT NULL,
    [CleCritereQ] SMALLINT       NOT NULL,
    [IndExclus]   BIT            NOT NULL,
    [ValNote]     DECIMAL (3, 1) CONSTRAINT [DF_Gen_FouMQualif_ValNote] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Gen_FouMQualif] PRIMARY KEY CLUSTERED ([CleCritereQ] ASC, [CleFourn] ASC),
    CONSTRAINT [FK1_Gen_FouMQualif] FOREIGN KEY ([CleFourn]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn]),
    CONSTRAINT [FK2_Gen_FouMQualif] FOREIGN KEY ([CleCritereQ]) REFERENCES [SA_TMPI].[Gen_FouCritereQ] ([CleCritereQ])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_FouMQualif]
    ON [SA_TMPI].[Gen_FouMQualif]([CleFourn] ASC) WITH (FILLFACTOR = 90);

