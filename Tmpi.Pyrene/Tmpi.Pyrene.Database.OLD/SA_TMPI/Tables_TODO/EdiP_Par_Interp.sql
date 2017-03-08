CREATE TABLE [SA_TMPI].[EdiP_Par_Interp] (
    [CleInterp]      INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodInterp]      VARCHAR (50)   NOT NULL,
    [LibInterp]      VARCHAR (255)  NOT NULL,
    [TxtInterp]      VARCHAR (2000) NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_Par_Interp_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_Par_Interp_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_Par_Interp] PRIMARY KEY CLUSTERED ([CleInterp] ASC),
    CONSTRAINT [UN_EdiP_Par_Interp] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodInterp] ASC)
);

