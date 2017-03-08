CREATE TABLE [SA_TMPI].[Usr_Option] (
    [CleOption]   INT           NOT NULL,
    [CleLogiciel] TINYINT       NOT NULL,
    [ClePersonne] SMALLINT      NOT NULL,
    [ValOption]   VARCHAR (255) NULL,
    CONSTRAINT [PK_Usr_Option] PRIMARY KEY CLUSTERED ([CleOption] ASC, [CleLogiciel] ASC, [ClePersonne] ASC)
);

