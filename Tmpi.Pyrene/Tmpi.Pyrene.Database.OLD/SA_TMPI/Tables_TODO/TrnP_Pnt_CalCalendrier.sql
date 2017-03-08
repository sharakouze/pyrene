CREATE TABLE [SA_TMPI].[TrnP_Pnt_CalCalendrier] (
    [CleCalendrier]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleCalendrier_C] SMALLINT       NULL,
    [CleCalendrier_H] SMALLINT       NOT NULL,
    [CodCalendrier]   VARCHAR (100)  NOT NULL,
    [LibCalendrier]   VARCHAR (200)  NOT NULL,
    [TxtCalendrier]   VARCHAR (2000) NULL,
    [EstActif]        BIT            CONSTRAINT [DF_TrnP_Pnt_CalCalendrier_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]     SMALLDATETIME  CONSTRAINT [DF_TrnP_Pnt_CalCalendrier_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT       NOT NULL,
    [DatModif]        SMALLDATETIME  NULL,
    [CleOperateur]    SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     SMALLINT       NULL,
    [EstDefaut]       BIT            CONSTRAINT [DF_TrnP_Pnt_CalCalendrier_EstDefaut] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_TrnP_Pnt_CalCalendrier] PRIMARY KEY CLUSTERED ([CleCalendrier] ASC),
    CONSTRAINT [UN_TrnP_Pnt_CalCalendrier] UNIQUE NONCLUSTERED ([CodCalendrier] ASC)
);

