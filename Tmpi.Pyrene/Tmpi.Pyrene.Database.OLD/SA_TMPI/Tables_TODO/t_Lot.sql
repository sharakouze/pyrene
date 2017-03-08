CREATE TABLE [SA_TMPI].[t_Lot] (
    [CleMagasin]           TINYINT         NOT NULL,
    [CleLot]               INT             IDENTITY (1, 1) NOT NULL,
    [NumLot]               VARCHAR (25)    NULL,
    [TxtLot]               VARCHAR (255)   NULL,
    [CleArticle]           INT             NOT NULL,
    [RefLotFa]             VARCHAR (25)    NULL,
    [QteInit]              DECIMAL (15, 3) CONSTRAINT [DF_t_Lot_QteInit] DEFAULT ((0)) NOT NULL,
    [QteReste]             DECIMAL (15, 3) CONSTRAINT [DF_t_Lot_QteReste] DEFAULT ((0)) NOT NULL,
    [DatReception]         DATETIME        NULL,
    [DatMService]          DATETIME        NULL,
    [DatPeremption]        DATETIME        NULL,
    [CleECommande]         INT             NULL,
    [CleEReception]        INT             NULL,
    [CleFourn]             SMALLINT        NULL,
    [RefArticle]           VARCHAR (50)    NULL,
    [PrxUnitaire]          DECIMAL (15, 4) CONSTRAINT [DF_t_Lot_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [TauTVA]               DECIMAL (5, 2)  CONSTRAINT [DF_t_Lot_TauTVA] DEFAULT ((0)) NOT NULL,
    [IndLot]               BIT             CONSTRAINT [DF_t_Lot_IndLot] DEFAULT ((0)) NOT NULL,
    [IndValidLot]          BIT             CONSTRAINT [DF_t_Lot_IndValidLot] DEFAULT ((0)) NOT NULL,
    [DatCloture]           DATETIME        NULL,
    [CleValideur]          SMALLINT        NULL,
    [DatValidation]        DATETIME        NULL,
    [NivSaisie]            TINYINT         CONSTRAINT [DF_t_Lot_NivSaisie] DEFAULT ((0)) NOT NULL,
    [CleDevise]            SMALLINT        NULL,
    [CleVerrou]            SMALLINT        NULL,
    [ValConditionB]        DECIMAL (10, 3) CONSTRAINT [DF_t_Lot_ValConditionB] DEFAULT ((1)) NOT NULL,
    [IndSuiviInd]          TINYINT         CONSTRAINT [DF_t_Lot_IndSuiviInd] DEFAULT ((0)) NULL,
    [ValConditionL]        DECIMAL (10, 3) CONSTRAINT [DF_t_Lot_ValConditionL] DEFAULT ((1)) NOT NULL,
    [CleUnite]             SMALLINT        NULL,
    [CleEtiquette]         TINYINT         CONSTRAINT [DF_t_Lot_CleEtiquette] DEFAULT ((0)) NULL,
    [QteEnPlus]            DECIMAL (15, 3) CONSTRAINT [DF_t_Lot_QteEnPlus] DEFAULT ((0)) NULL,
    [QteReservee]          DECIMAL (15, 3) CONSTRAINT [DF_t_Lot_QteReservee] DEFAULT ((0)) NOT NULL,
    [TauRemise]            DECIMAL (5, 2)  CONSTRAINT [DF_t_Lot_TauRemise] DEFAULT ((0)) NOT NULL,
    [CleECommandeLig]      INT             NULL,
    [DatCreation]          SMALLDATETIME   CONSTRAINT [DF_t_Lot_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]          SMALLINT        CONSTRAINT [DF_t_Lot_CleCreateur] DEFAULT ((0)) NOT NULL,
    [EstComposantDestocke] BIT             CONSTRAINT [DF_t_LotEstComposantDestocke] DEFAULT ((0)) NOT NULL,
    [DatRefus]             SMALLDATETIME   NULL,
    CONSTRAINT [PK_t_Lot] PRIMARY KEY CLUSTERED ([CleLot] ASC),
    CONSTRAINT [FK1_t_Lot] FOREIGN KEY ([CleArticle]) REFERENCES [SA_TMPI].[t_Article] ([CleArticle])
);


GO
CREATE NONCLUSTERED INDEX [ID_t_Lot]
    ON [SA_TMPI].[t_Lot]([CleArticle] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ID1_t_Lot]
    ON [SA_TMPI].[t_Lot]([CleMagasin] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ID2_t_Lot]
    ON [SA_TMPI].[t_Lot]([CleEReception] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_t_Lot_RefLotFa]
    ON [SA_TMPI].[t_Lot]([RefLotFa] ASC);

