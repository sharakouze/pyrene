CREATE TABLE [SA_TMPI].[USys_Table] (
    [CleTable]       SMALLINT      NOT NULL,
    [CodTable]       VARCHAR (50)  NOT NULL,
    [LibTable]       VARCHAR (100) NOT NULL,
    [CodCleSequence] VARCHAR (50)  NULL,
    [IndVersion]     BIT           CONSTRAINT [DF_USys_Table_IndVersion] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_USys_Table] PRIMARY KEY CLUSTERED ([CleTable] ASC),
    CONSTRAINT [UN1_USys_Table] UNIQUE NONCLUSTERED ([CodTable] ASC)
);

