CREATE TABLE [SA_TMPI].[Fcp_TarVersion] (
    [CleTarif]        SMALLINT       NOT NULL,
    [CleTarifVersion] SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodVersion]      VARCHAR (100)  NOT NULL,
    [LibVersion]      VARCHAR (200)  NULL,
    [TxtVersion]      VARCHAR (500)  NULL,
    [DatDebut]        SMALLDATETIME  NOT NULL,
    [DatFin]          SMALLDATETIME  NOT NULL,
    [ValPoint]        DECIMAL (6, 4) NULL,
    [EstActif]        BIT            CONSTRAINT [DF_Fcp_TarVersion_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]     SMALLDATETIME  CONSTRAINT [DF_Fcp_TarVersion_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]     SMALLINT       CONSTRAINT [DF_Fcp_TarVersion_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]        SMALLDATETIME  NULL,
    [CleOperateur]    SMALLINT       NULL,
    [DatValidation]   SMALLDATETIME  NULL,
    [CleValideur]     SMALLINT       NULL,
    CONSTRAINT [PK_Fcp_TarVersion] PRIMARY KEY CLUSTERED ([CleTarifVersion] ASC),
    CONSTRAINT [FK1_Fcp_TarVersion] FOREIGN KEY ([CleTarif]) REFERENCES [SA_TMPI].[Fcp_TarTarif] ([CleTarif]),
    CONSTRAINT [UN_Fcp_TarVersion] UNIQUE NONCLUSTERED ([CleTarif] ASC, [CodVersion] ASC)
);

