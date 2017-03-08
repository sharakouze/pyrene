CREATE TABLE [SA_TMPI].[Ope_OpePaiementPrev] (
    [CleSecteur]      SMALLINT       NULL,
    [CleService]      SMALLINT       NULL,
    [ClePaiementPrev] INT            IDENTITY (1, 1) NOT NULL,
    [NumPaiementPrev] VARCHAR (50)   NOT NULL,
    [LibPaiementPrev] VARCHAR (400)  NOT NULL,
    [TxtPaiementPrev] VARCHAR (4000) NULL,
    [CleBeneficiaire] INT            NOT NULL,
    [DatDebut]        SMALLDATETIME  NULL,
    [DatFin]          SMALLDATETIME  NULL,
    [SttPaiementPrev] TINYINT        CONSTRAINT [DF_Ope_OpePaiementPrev_SttPaiementPrev] DEFAULT ((0)) NOT NULL,
    [MntPrevu]        REAL           CONSTRAINT [DF_Ope_OpePaiementPrev_MntPrevu] DEFAULT ((0)) NOT NULL,
    [MntEngage]       REAL           CONSTRAINT [DF_Ope_OpePaiementPrev_MntEngage] DEFAULT ((0)) NOT NULL,
    [MntFacture]      REAL           CONSTRAINT [DF_Ope_OpePaiementPrev_MntFacture] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpePaiementPrev] PRIMARY KEY CLUSTERED ([ClePaiementPrev] ASC)
);

