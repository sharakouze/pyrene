CREATE TABLE [SA_TMPI].[EdiP_DivCauseNA] (
    [CleCauseNA]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodCauseNA]     VARCHAR (50)   NOT NULL,
    [LibCauseNA]     VARCHAR (255)  NOT NULL,
    [TxtCauseNA]     VARCHAR (2000) NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_DivCauseNA_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_DivCauseNA_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_DivCauseNA] PRIMARY KEY CLUSTERED ([CleCauseNA] ASC),
    CONSTRAINT [UN_EdiP_DivCauseNA] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodCauseNA] ASC)
);

