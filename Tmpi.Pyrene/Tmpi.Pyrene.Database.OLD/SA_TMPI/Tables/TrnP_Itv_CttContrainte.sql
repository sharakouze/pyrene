CREATE TABLE [SA_TMPI].[TrnP_Itv_CttContrainte] (
    [TypContrainte]   TINYINT        NOT NULL,
    [CleContrainte]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleContrainte_C] SMALLINT       NULL,
    [CleContrainte_H] SMALLINT       NOT NULL,
    [CodContrainte]   VARCHAR (100)  NOT NULL,
    [LibContrainte]   VARCHAR (200)  NOT NULL,
    [TxtContrainte]   VARCHAR (2000) NULL,
    [EstActif]        BIT            CONSTRAINT [DF_TrnP_Itv_CttContrainte_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]     SMALLDATETIME  CONSTRAINT [DF_TrnP_Itv_CttContrainte_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     INT            NOT NULL,
    [DatModif]        SMALLDATETIME  NULL,
    [CleOperateur]    INT            NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     INT            NULL,
    [NivUtilisation]  TINYINT        CONSTRAINT [DF_TrnP_Itv_CttContrainte_NivUtilisation] DEFAULT ((1)) NOT NULL,
    [DurValidite]     TINYINT        NULL,
    CONSTRAINT [PK_TrnP_Itv_CttContrainte] PRIMARY KEY CLUSTERED ([CleContrainte] ASC),
    CONSTRAINT [UN_TrnP_Itv_CttContrainte] UNIQUE NONCLUSTERED ([TypContrainte] ASC, [CodContrainte] ASC)
);

