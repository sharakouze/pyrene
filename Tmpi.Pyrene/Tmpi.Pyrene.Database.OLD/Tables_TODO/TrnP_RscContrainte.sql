CREATE TABLE [SA_TMPI].[TrnP_RscContrainte] (
    [TypRessource]     TINYINT       NOT NULL,
    [CleRessource]     INT           NOT NULL,
    [CleRscContrainte] INT           IDENTITY (1, 1) NOT NULL,
    [TypContrainte]    TINYINT       NOT NULL,
    [CodContrainte]    VARCHAR (50)  NOT NULL,
    [ValContrainte]    VARCHAR (200) NOT NULL,
    [TxtContrainte]    VARCHAR (200) NULL,
    [ValContrainte_D1] SMALLDATETIME NULL,
    [ValContrainte_D2] SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_RscContrainte] PRIMARY KEY CLUSTERED ([CleRscContrainte] ASC),
    CONSTRAINT [UN_TrnP_RscContrainte] UNIQUE NONCLUSTERED ([TypRessource] ASC, [CleRessource] ASC, [CodContrainte] ASC)
);

