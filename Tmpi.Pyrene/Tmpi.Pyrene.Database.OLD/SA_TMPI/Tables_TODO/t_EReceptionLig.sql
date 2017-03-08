CREATE TABLE [SA_TMPI].[t_EReceptionLig] (
    [CleECommandeLig]  INT             NOT NULL,
    [CleEReception]    INT             NOT NULL,
    [CleEReceptionLig] INT             IDENTITY (1, 1) NOT NULL,
    [CleArticle]       INT             NOT NULL,
    [QteRecue]         DECIMAL (15, 3) CONSTRAINT [DF_t_EReceptionLig_QteRecue] DEFAULT ((0)) NOT NULL,
    [CleCondition_L]   SMALLINT        CONSTRAINT [DF_t_EReceptionLig_CleCondition_L] DEFAULT ((0)) NOT NULL,
    [CleEFacture]      INT             NULL,
    [NivSaisie]        TINYINT         NULL,
    [DelLivraison]     SMALLINT        NULL,
    [ValConditionB]    DECIMAL (10, 3) CONSTRAINT [DF_t_EReceptionLig_ValConditionB] DEFAULT ((1)) NOT NULL,
    [ValConditionL]    DECIMAL (10, 3) NOT NULL,
    [QteEnPlus]        DECIMAL (15, 3) NULL,
    CONSTRAINT [PK_t_EReceptionLig] PRIMARY KEY CLUSTERED ([CleEReceptionLig] ASC),
    CONSTRAINT [CK_QteRecue] CHECK ([QteRecue] >= 0),
    CONSTRAINT [FK1_t_EReceptionLig] FOREIGN KEY ([CleEReception]) REFERENCES [SA_TMPI].[t_EReception] ([CleEReception]),
    CONSTRAINT [FK2_t_EReceptionLig] FOREIGN KEY ([CleECommandeLig]) REFERENCES [SA_TMPI].[t_ECommandeLig] ([CleECommandeLig])
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_EReceptionLig]
    ON [SA_TMPI].[t_EReceptionLig]([CleEReception] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_t_EReceptionLig]
    ON [SA_TMPI].[t_EReceptionLig]([CleEFacture] ASC);

