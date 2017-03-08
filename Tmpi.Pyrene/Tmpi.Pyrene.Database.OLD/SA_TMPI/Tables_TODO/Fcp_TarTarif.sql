CREATE TABLE [SA_TMPI].[Fcp_TarTarif] (
    [CleTarif]         SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CleTarif_C]       SMALLINT      NULL,
    [CleTarif_H]       SMALLINT      NOT NULL,
    [CodTarif]         VARCHAR (50)  NOT NULL,
    [LibTarif]         VARCHAR (100) NOT NULL,
    [TxtTarif]         VARCHAR (255) NULL,
    [EstActif]         BIT           CONSTRAINT [DF_Fcp_TarTarif_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]      SMALLDATETIME CONSTRAINT [DF_Fcp_TarTarif_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]      SMALLINT      CONSTRAINT [DF_Fcp_TarTarif_CleCreateur] DEFAULT ((0)) NOT NULL,
    [DatModif]         SMALLDATETIME NULL,
    [CleOperateur]     SMALLINT      NULL,
    [DatValidation]    SMALLDATETIME NULL,
    [CleValideur]      SMALLINT      NULL,
    [NbrParticipant]   TINYINT       CONSTRAINT [DF_Fcp_TarTarif_NbrParticipant] DEFAULT ((0)) NOT NULL,
    [CleParticipant_1] INT           NULL,
    [CleParticipant_2] INT           NULL,
    [CleParticipant_3] INT           NULL,
    [TypTarif]         TINYINT       NOT NULL,
    CONSTRAINT [PK_Fcp_TarTarif] PRIMARY KEY CLUSTERED ([CleTarif] ASC),
    CONSTRAINT [UN_Fcp_TarTarif] UNIQUE NONCLUSTERED ([CleTarif_H] ASC, [CodTarif] ASC)
);

