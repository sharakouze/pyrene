CREATE TABLE [SA_TMPI].[LmsP_Val_LstTexte] (
    [CleListe]          SMALLINT       NOT NULL,
    [CleLstTexte]       SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodTexte]          VARCHAR (100)  NOT NULL,
    [LibTexte]          VARCHAR (4000) NOT NULL,
    [EstActif]          BIT            CONSTRAINT [DF_LmsP_Val_LstTexte_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]       SMALLDATETIME  CONSTRAINT [DF_LmsP_Val_LstTexte_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]       SMALLINT       NOT NULL,
    [DatModif]          SMALLDATETIME  NULL,
    [CleOperateur]      SMALLINT       NULL,
    [DatValidation]     SMALLDATETIME  NULL,
    [CleValideur]       SMALLINT       NULL,
    [CleInterpretation] SMALLINT       NULL,
    CONSTRAINT [PK_LmsP_Val_LstTexte] PRIMARY KEY CLUSTERED ([CleLstTexte] ASC),
    CONSTRAINT [FK1_LmsP_Val_LstTexte] FOREIGN KEY ([CleListe]) REFERENCES [SA_TMPI].[LmsP_Val_LstListe] ([CleListe]),
    CONSTRAINT [UN_LmsP_Val_LstTexte] UNIQUE NONCLUSTERED ([CodTexte] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_LmsP_Val_LstTexte]
    ON [SA_TMPI].[LmsP_Val_LstTexte]([CleListe] ASC);

