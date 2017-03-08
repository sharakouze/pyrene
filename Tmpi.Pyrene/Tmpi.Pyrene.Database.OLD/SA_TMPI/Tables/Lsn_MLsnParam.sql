CREATE TABLE [SA_TMPI].[Lsn_MLsnParam] (
    [CleMLiaison] SMALLINT      NOT NULL,
    [CodParam]    VARCHAR (50)  NOT NULL,
    [LibParam]    VARCHAR (100) NOT NULL,
    [TypParam]    TINYINT       CONSTRAINT [DF_Lsn_MLsnParam_TypParam] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Lsn_MLsnParam] PRIMARY KEY CLUSTERED ([CleMLiaison] ASC, [CodParam] ASC),
    CONSTRAINT [FK1_Lsn_MLsnParam] FOREIGN KEY ([CleMLiaison]) REFERENCES [SA_TMPI].[Lsn_MLsnMLiaison] ([CleMLiaison])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lsn_MLsnParam]
    ON [SA_TMPI].[Lsn_MLsnParam]([CleMLiaison] ASC);

