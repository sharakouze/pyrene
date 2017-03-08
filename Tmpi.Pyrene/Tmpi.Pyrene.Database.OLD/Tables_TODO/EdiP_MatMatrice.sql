CREATE TABLE [SA_TMPI].[EdiP_MatMatrice] (
    [CleMatrice]     INT            IDENTITY (1, 1) NOT NULL,
    [TypReferentiel] TINYINT        NOT NULL,
    [CodMatrice]     VARCHAR (50)   NOT NULL,
    [LibMatrice]     VARCHAR (255)  NOT NULL,
    [TxtMatrice]     VARCHAR (2000) NULL,
    [CleFamille]     INT            NULL,
    [CleEspece]      INT            NULL,
    [CleClasse]      INT            NULL,
    [EstGenerique]   BIT            NOT NULL,
    [CleMatrice_G]   INT            NULL,
    [EstActif]       BIT            CONSTRAINT [DF_EdiP_MatMatrice_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]    SMALLDATETIME  CONSTRAINT [DF_EdiP_MatMatrice_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]    SMALLINT       NOT NULL,
    [DatModif]       SMALLDATETIME  NULL,
    [CleOperateur]   SMALLINT       NULL,
    CONSTRAINT [PK_EdiP_MatMatrice] PRIMARY KEY CLUSTERED ([CleMatrice] ASC),
    CONSTRAINT [UN_EdiP_MatMatrice] UNIQUE NONCLUSTERED ([TypReferentiel] ASC, [CodMatrice] ASC)
);

