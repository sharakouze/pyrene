CREATE TABLE [SA_TMPI].[Gen_Trc_Operateur] (
    [CleOperateur] SMALLINT      NOT NULL,
    [CodOperateur] VARCHAR (25)  NOT NULL,
    [PreOperateur] VARCHAR (50)  NULL,
    [NomOperateur] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Gen_Trc_Operateur] PRIMARY KEY CLUSTERED ([CleOperateur] ASC),
    CONSTRAINT [UN_Gen_Trc_Operateur] UNIQUE NONCLUSTERED ([CodOperateur] ASC)
);

