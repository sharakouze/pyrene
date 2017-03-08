CREATE TABLE [SA_TMPI].[EdiP_ComCommemo] (
    [CleCommemo]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodCommemo]     VARCHAR (50)   NOT NULL,
    [LibCommemo]     VARCHAR (255)  NOT NULL,
    [TxtCommemo]     VARCHAR (2000) NULL,
    [CleUnite]       INT            NULL,
    [TypCommemo]     TINYINT        NOT NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_ComCommemo_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_ComCommemo_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_ComCommemo] PRIMARY KEY CLUSTERED ([CleCommemo] ASC),
    CONSTRAINT [UN_EdiP_ComCommemo] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodCommemo] ASC)
);

