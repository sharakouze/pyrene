CREATE TABLE [SA_TMPI].[TrnP_Pnt_PrfProfil] (
    [CleProfil]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleProfil_C]   SMALLINT       NULL,
    [CleProfil_H]   SMALLINT       NOT NULL,
    [CodProfil]     VARCHAR (100)  NOT NULL,
    [LibProfil]     VARCHAR (200)  NOT NULL,
    [TxtProfil]     VARCHAR (2000) NULL,
    [CleCalendrier] SMALLINT       NULL,
    [EstDefaut]     BIT            CONSTRAINT [DF_TrnP_Pnt_PrfProfil_EstDefaut] DEFAULT ((0)) NOT NULL,
    [EstActif]      BIT            CONSTRAINT [DF_TrnP_Pnt_PrfProfil_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_TrnP_Pnt_PrfProfil_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    CONSTRAINT [PK_TrnP_Pnt_PrfProfil] PRIMARY KEY CLUSTERED ([CleProfil] ASC),
    CONSTRAINT [UN_TrnP_Pnt_PrfProfil] UNIQUE NONCLUSTERED ([CodProfil] ASC)
);

