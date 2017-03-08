CREATE TABLE [SA_TMPI].[t_IRetourLig] (
    [CleIRetour]       INT             NOT NULL,
    [CleIRetourLig]    INT             IDENTITY (1, 1) NOT NULL,
    [CleILivraisonLig] INT             NOT NULL,
    [CleImput]         SMALLINT        NULL,
    [QteRetournee]     DECIMAL (15, 3) CONSTRAINT [DF_t_IRetourLig_QteRetournee] DEFAULT ((0)) NOT NULL,
    [CleDevise]        SMALLINT        NULL,
    [PrxUnitaire]      DECIMAL (15, 4) CONSTRAINT [DF_t_IRetourLig_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauRemise]        DECIMAL (5, 2)  CONSTRAINT [DF_t_IRetourLig_TauRemise] DEFAULT ((0)) NOT NULL,
    [TauTVA]           DECIMAL (5, 2)  CONSTRAINT [DF_t_IRetourLig_TauTVA] DEFAULT ((0)) NOT NULL,
    [CleCondition_L]   SMALLINT        CONSTRAINT [DF_t_IRetourLig_CleCondition_L] DEFAULT ((0)) NOT NULL,
    [CleCondition_F]   SMALLINT        CONSTRAINT [DF_t_IRetourLig_CleCondition_F] DEFAULT ((0)) NOT NULL,
    [CleLot]           INT             NULL,
    [ValConditionL]    DECIMAL (10, 3) NULL,
    [ValConditionF]    DECIMAL (10, 3) NULL,
    [ValConditionB]    DECIMAL (10, 2) CONSTRAINT [DF_t_IRetourLig_ValConditionB] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_t_IRetourLig] PRIMARY KEY CLUSTERED ([CleIRetourLig] ASC),
    CONSTRAINT [FK1_t_IRetourLig] FOREIGN KEY ([CleIRetour]) REFERENCES [SA_TMPI].[t_IRetour] ([CleIRetour])
);

