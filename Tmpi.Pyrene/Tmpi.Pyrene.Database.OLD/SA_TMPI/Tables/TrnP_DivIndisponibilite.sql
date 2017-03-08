CREATE TABLE [SA_TMPI].[TrnP_DivIndisponibilite] (
    [CleIndisponibilite]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CleIndisponibilite_C] SMALLINT       NULL,
    [CleIndisponibilite_H] SMALLINT       NOT NULL,
    [CodIndisponibilite]   VARCHAR (100)  NOT NULL,
    [LibIndisponibilite]   VARCHAR (200)  NOT NULL,
    [TxtIndisponibilite]   VARCHAR (2000) NULL,
    [EstActif]             BIT            CONSTRAINT [DF_TrnP_DivIndisponibilite_EstActif] DEFAULT ((0)) NOT NULL,
    [DatCreation]          SMALLDATETIME  CONSTRAINT [DF_TrnP_DivIndisponibilite_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]          SMALLINT       CONSTRAINT [DF_TrnP_DivIndisponibilite_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]             SMALLDATETIME  NULL,
    [CleOperateur]         SMALLINT       NULL,
    [DatValidation]        SMALLDATETIME  NULL,
    [CleValideur]          SMALLINT       NULL,
    [EstSynchroOptiTime]   BIT            NULL,
    CONSTRAINT [PK_TrnP_DivIndisponibilite] PRIMARY KEY CLUSTERED ([CleIndisponibilite] ASC),
    CONSTRAINT [UN_TrnP_DivIndisponibilite] UNIQUE NONCLUSTERED ([CodIndisponibilite] ASC)
);

