CREATE TABLE [SA_TMPI].[TrnP_Itv_CalCalendrier] (
    [CleSecteur]         SMALLINT       NOT NULL,
    [CleCalendrier]      SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleCalendrier_C]    SMALLINT       NULL,
    [CleCalendrier_H]    SMALLINT       NOT NULL,
    [CodCalendrier]      VARCHAR (100)  NOT NULL,
    [LibCalendrier]      VARCHAR (200)  NOT NULL,
    [TxtCalendrier]      VARCHAR (2000) NULL,
    [EstActif]           BIT            CONSTRAINT [DF1_TrnP_Itv_CalCalendrier] DEFAULT ((1)) NOT NULL,
    [DatCreation]        SMALLDATETIME  CONSTRAINT [DF2_TrnP_Itv_CalCalendrier] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]        SMALLINT       NOT NULL,
    [DatModif]           SMALLDATETIME  NULL,
    [CleOperateur]       SMALLINT       NULL,
    [DatValidation]      SMALLDATETIME  NULL,
    [CleValideur]        SMALLINT       NULL,
    [EstDefaut]          BIT            CONSTRAINT [DF_TrnP_Itv_CalCalendrier_EstDefaut] DEFAULT ((0)) NOT NULL,
    [EstSynchroOptiTime] BIT            NULL,
    CONSTRAINT [PK_TrnP_Itv_CalCalendrier] PRIMARY KEY CLUSTERED ([CleCalendrier] ASC),
    CONSTRAINT [PK1_TrnP_Itv_CalCalendrier] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Trp_SecSecteur] ([CleSecteur]),
    CONSTRAINT [UN_TrnP_Itv_CalCalendrier] UNIQUE NONCLUSTERED ([CodCalendrier] ASC)
);

