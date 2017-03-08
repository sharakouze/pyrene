CREATE TABLE [SA_TMPI].[TrnP_ItvCttContrainte] (
    [CleItvContrainte] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleIntervenant]   SMALLINT      NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [CleContrainte]    SMALLINT      NOT NULL,
    [DatExpiration]    SMALLDATETIME NULL,
    [LstValeur]        VARCHAR (500) NULL,
    CONSTRAINT [PK_TrnP_ItvCttContrainte] PRIMARY KEY CLUSTERED ([CleItvContrainte] ASC),
    CONSTRAINT [FK1_TrnP_ItvCttContrainte] FOREIGN KEY ([CleIntervenant]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK2_TrnP_ItvCttContrainte] FOREIGN KEY ([CleContrainte]) REFERENCES [SA_TMPI].[TrnP_Itv_CttContrainte] ([CleContrainte]),
    CONSTRAINT [UN_TrnP_ItvCttContrainte] UNIQUE NONCLUSTERED ([CleIntervenant] ASC, [TypContrainte] ASC, [CleContrainte] ASC)
);

