CREATE TABLE [SA_TMPI].[USys_Etat] (
    [CleLogiciel] TINYINT       NOT NULL,
    [CleEtat]     SMALLINT      NOT NULL,
    [CodEtat]     VARCHAR (100) NOT NULL,
    [LibEtat]     VARCHAR (100) NOT NULL,
    [CodFamille]  VARCHAR (50)  NULL,
    [IndExtrac]   BIT           NOT NULL,
    [CleFamille]  SMALLINT      NULL,
    [LstEtat]     VARCHAR (50)  NULL,
    CONSTRAINT [PK_USys_Etat] PRIMARY KEY CLUSTERED ([CleEtat] ASC),
    CONSTRAINT [UN_USys_Etat] UNIQUE NONCLUSTERED ([CodEtat] ASC)
);

