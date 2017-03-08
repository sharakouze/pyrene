CREATE TABLE [SA_TMPI].[EdiP_UniUnite] (
    [CleUnite]       INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodUnite]       VARCHAR (50)   NOT NULL,
    [LibUnite]       VARCHAR (255)  NOT NULL,
    [TxtUnite]       VARCHAR (2000) NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_UniUnite_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_UniUnite_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_UniUnite] PRIMARY KEY CLUSTERED ([CleUnite] ASC),
    CONSTRAINT [UN_EdiP_UniUnite] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodUnite] ASC)
);

