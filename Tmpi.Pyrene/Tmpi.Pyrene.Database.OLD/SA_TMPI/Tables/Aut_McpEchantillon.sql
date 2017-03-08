CREATE TABLE [SA_TMPI].[Aut_McpEchantillon] (
    [NumMicroplaque]     INT           NULL,
    [CleMcpEchantillon]  INT           IDENTITY (1, 1) NOT NULL,
    [NumLigne]           TINYINT       NULL,
    [NumColonne]         TINYINT       NULL,
    [CleDosEchantillon]  INT           NULL,
    [NumEchantillon_Int] VARCHAR (50)  NULL,
    [NumEchantillon_Ext] VARCHAR (50)  NULL,
    [QteRestante]        SMALLINT      NULL,
    [DatCreation]        SMALLDATETIME CONSTRAINT [DF_Aut_McpEchantillon_DatCreation] DEFAULT (getdate()) NULL,
    [DatModification]    SMALLDATETIME NULL
);

