CREATE TABLE [SA_TMPI].[EdiP_AnlAnalyte] (
    [CleAnalyte]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodAnalyte]     VARCHAR (50)   NOT NULL,
    [LibAnalyte]     VARCHAR (255)  NOT NULL,
    [TxtAnalyte]     VARCHAR (2000) NULL,
    [CleFamille]     INT            NULL,
    [CleMaladie]     INT            NULL,
    [EstGenerique]   BIT            NOT NULL,
    [CleAnalyte_G]   INT            NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_AnlAnalyte_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_AnlAnalyte_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_AnlAnalyte] PRIMARY KEY CLUSTERED ([CleAnalyte] ASC),
    CONSTRAINT [UN_EdiP_AnlAnalyte] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodAnalyte] ASC)
);

