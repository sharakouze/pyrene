CREATE TABLE [SA_TMPI].[Usys_Option] (
    [CleOption] SMALLINT      NOT NULL,
    [CodOption] VARCHAR (50)  NULL,
    [LibOption] VARCHAR (100) NULL,
    CONSTRAINT [PK_Usys_Option] PRIMARY KEY CLUSTERED ([CleOption] ASC),
    CONSTRAINT [UN_Usys_Option] UNIQUE NONCLUSTERED ([CodOption] ASC)
);

