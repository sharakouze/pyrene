CREATE TABLE [SA_TMPI].[Aut_McpCupule] (
    [NumMicroplaque]     INT           NULL,
    [CleMcpCupule]       INT           IDENTITY (1, 1) NOT NULL,
    [NumLigne]           TINYINT       NULL,
    [NumColonne]         TINYINT       NULL,
    [CleDosEchantillon]  INT           NULL,
    [NumEchantillon_Int] VARCHAR (50)  NULL,
    [NumEchantillon_Ext] VARCHAR (50)  NULL,
    [QteRestante]        SMALLINT      NULL,
    [DatCreation]        SMALLDATETIME NULL,
    [DatModification]    SMALLDATETIME NULL
);

