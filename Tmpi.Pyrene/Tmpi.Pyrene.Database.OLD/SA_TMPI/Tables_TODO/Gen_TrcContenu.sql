CREATE TABLE [SA_TMPI].[Gen_TrcContenu] (
    [CleTrace]     INT           IDENTITY (1, 1) NOT NULL,
    [CleOperateur] INT           NOT NULL,
    [DatEvenement] SMALLDATETIME NOT NULL,
    [CleObjet]     INT           NOT NULL,
    [TypObjet]     TINYINT       NOT NULL,
    [ValAvant]     VARCHAR (255) NULL,
    [ValApres]     VARCHAR (255) NULL,
    [TxtEvenement] VARCHAR (255) NULL
);

