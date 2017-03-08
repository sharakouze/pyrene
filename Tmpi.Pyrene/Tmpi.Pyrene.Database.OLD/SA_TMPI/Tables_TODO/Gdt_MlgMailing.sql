CREATE TABLE [SA_TMPI].[Gdt_MlgMailing] (
    [CleMailing]    SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleMailing_C]  SMALLINT      NULL,
    [CleMailing_H]  SMALLINT      NOT NULL,
    [CodMailing]    VARCHAR (25)  NOT NULL,
    [LibMailing]    VARCHAR (100) NOT NULL,
    [TxtMailing]    VARCHAR (255) NULL,
    [EstActif]      BIT           CONSTRAINT [DF_Gdt_MlgMailing_EstActif] DEFAULT (1) NOT NULL,
    [DatCreation]   SMALLDATETIME CONSTRAINT [DF_Gdt_MlgMailing_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT      NOT NULL,
    [DatModif]      SMALLDATETIME NULL,
    [CleOperateur]  SMALLINT      NULL,
    [DatValidation] SMALLDATETIME NULL,
    [CleValideur]   SMALLINT      NULL,
    CONSTRAINT [PK_Gdt_MlgMailing] PRIMARY KEY CLUSTERED ([CleMailing] ASC),
    CONSTRAINT [UN_Gdt_MlgMailing] UNIQUE NONCLUSTERED ([CodMailing] ASC)
);

