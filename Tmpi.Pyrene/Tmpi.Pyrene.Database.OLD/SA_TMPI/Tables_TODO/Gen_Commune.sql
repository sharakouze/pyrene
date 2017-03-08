CREATE TABLE [SA_TMPI].[Gen_Commune] (
    [CleCommune] INT              IDENTITY (1, 1) NOT NULL,
    [NumInsee]   VARCHAR (25)     NULL,
    [CodCommune] VARCHAR (50)     NOT NULL,
    [CodArt]     VARCHAR (10)     NULL,
    [LibCommune] VARCHAR (100)    NOT NULL,
    [NumCP]      VARCHAR (10)     NULL,
    [NumDep]     VARCHAR (5)      NULL,
    [NumReg]     VARCHAR (10)     NULL,
    [ValLat]     FLOAT (53)       NULL,
    [ValLon]     FLOAT (53)       NULL,
    [ValPhonex]  DECIMAL (20, 19) NULL,
    CONSTRAINT [PK_Gen_Commune] PRIMARY KEY CLUSTERED ([CleCommune] ASC),
    CONSTRAINT [UN_Gen_Commune] UNIQUE NONCLUSTERED ([NumInsee] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_Commune]
    ON [SA_TMPI].[Gen_Commune]([CodCommune] ASC);


GO
CREATE NONCLUSTERED INDEX [ID5_Gen_Commune]
    ON [SA_TMPI].[Gen_Commune]([ValPhonex] ASC);

