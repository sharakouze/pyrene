CREATE TABLE [SA_TMPI].[EdiP_ExpParametre] (
    [CleExport]     SMALLINT      NOT NULL,
    [CleParametre]  INT           NOT NULL,
    [CodTraduction] VARCHAR (50)  NULL,
    [TxtConversion] VARCHAR (100) NULL,
    CONSTRAINT [PK_EdiP_ExpParametre] PRIMARY KEY CLUSTERED ([CleExport] ASC, [CleParametre] ASC),
    CONSTRAINT [FK1_EdiP_ExpParametre] FOREIGN KEY ([CleExport]) REFERENCES [SA_TMPI].[EdiP_ExpExport] ([CleExport]),
    CONSTRAINT [FK2_EdiP_ExpParametre] FOREIGN KEY ([CleParametre]) REFERENCES [SA_TMPI].[Lmp_ParParametre] ([CleParametre])
);

