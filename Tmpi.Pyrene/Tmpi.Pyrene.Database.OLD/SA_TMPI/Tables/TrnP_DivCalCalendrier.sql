CREATE TABLE [SA_TMPI].[TrnP_DivCalCalendrier] (
    [CleCalendrier]      SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleCalendrier_C]    SMALLINT       NULL,
    [CleCalendrier_H]    SMALLINT       NOT NULL,
    [CodCalendrier]      VARCHAR (100)  NOT NULL,
    [LibCalendrier]      VARCHAR (200)  NOT NULL,
    [TxtCalendrier]      VARCHAR (2000) NULL,
    [EstDefaut]          BIT            CONSTRAINT [DF1_TrnP_DivCalCalendrier] DEFAULT ((0)) NOT NULL,
    [EstActif]           BIT            CONSTRAINT [DF2_TrnP_DivCalCalendrier] DEFAULT ((1)) NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF3_TrnP_DivCalCalendrier] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT       CONSTRAINT [DF4_TrnP_DivCalCalendrier] DEFAULT ((0)) NOT NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [EstSynchroOptiTime] BIT            NULL,
    CONSTRAINT [PK_TrnP_DivCalCalendrier] PRIMARY KEY CLUSTERED ([CleCalendrier] ASC),
    CONSTRAINT [UN_TrnP_DivCalCalendrier] UNIQUE NONCLUSTERED ([CodCalendrier] ASC)
);

