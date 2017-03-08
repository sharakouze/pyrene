CREATE TABLE [SA_TMPI].[t_DestockLig] (
    [CleDestock]    INT             NOT NULL,
    [CleDestockLig] INT             IDENTITY (1, 1) NOT NULL,
    [CleLot]        INT             NOT NULL,
    [QteDestockee]  DECIMAL (15, 3) CONSTRAINT [DF_t_DestockLig_QteDestockee] DEFAULT ((0)) NOT NULL,
    [CleAffect]     SMALLINT        NULL,
    CONSTRAINT [PK_DestockLig] PRIMARY KEY CLUSTERED ([CleDestockLig] ASC),
    CONSTRAINT [FK1_t_DestockLig] FOREIGN KEY ([CleDestock]) REFERENCES [SA_TMPI].[t_Destock] ([CleDestock]),
    CONSTRAINT [FK9_t_DestockLig] FOREIGN KEY ([CleAffect]) REFERENCES [SA_TMPI].[t_BudAffect] ([CleAffect])
);

