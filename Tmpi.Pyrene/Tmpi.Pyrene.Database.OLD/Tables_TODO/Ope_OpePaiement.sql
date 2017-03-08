CREATE TABLE [SA_TMPI].[Ope_OpePaiement] (
    [CleSecteur]     SMALLINT       NULL,
    [CleService]     SMALLINT       NULL,
    [CleOpeCommande] INT            NOT NULL,
    [CleOpePaiement] INT            IDENTITY (1, 1) NOT NULL,
    [NumPaiement]    VARCHAR (50)   NOT NULL,
    [LibPaiement]    VARCHAR (400)  NOT NULL,
    [TxtPaiement]    VARCHAR (4000) NULL,
    [DatDebut]       SMALLDATETIME  NULL,
    [DatFin]         SMALLDATETIME  NULL,
    [SttPaiement]    TINYINT        CONSTRAINT [DF_Ope_OpePaiement_SttPaiement] DEFAULT ((0)) NOT NULL,
    [MntPrevu]       REAL           CONSTRAINT [DF_Ope_OpePaiement_MntPrevu] DEFAULT ((0)) NOT NULL,
    [MntEngage]      REAL           CONSTRAINT [DF_Ope_OpePaiement_MntEngage] DEFAULT ((0)) NOT NULL,
    [MntFacture]     REAL           CONSTRAINT [DF_Ope_OpePaiement_MntFacture] DEFAULT ((0)) NOT NULL,
    [EstSuspendu]    BIT            CONSTRAINT [DF_Ope_OpePaiement_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpePaiement] PRIMARY KEY CLUSTERED ([CleOpePaiement] ASC)
);

