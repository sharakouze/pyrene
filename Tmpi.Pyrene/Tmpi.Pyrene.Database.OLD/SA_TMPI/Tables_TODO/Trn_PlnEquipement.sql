CREATE TABLE [SA_TMPI].[Trn_PlnEquipement] (
    [ClePlnEquipement] INT            IDENTITY (1, 1) NOT NULL,
    [CleTournee]       INT            NULL,
    [ClePersonne]      INT            NULL,
    [CleFamille]       SMALLINT       NOT NULL,
    [CleEquipement]    INT            NULL,
    [DatDebut]         SMALLDATETIME  NOT NULL,
    [DatFin]           SMALLDATETIME  NOT NULL,
    [TxtReservation]   VARCHAR (1000) NULL,
    [EstIgnore]        BIT            CONSTRAINT [DF_Trn_PlnEquipement_EstIgnore] DEFAULT ((0)) NOT NULL,
    [CleOperateur]     SMALLINT       NULL,
    CONSTRAINT [PK_Trn_PlnEquipement] PRIMARY KEY CLUSTERED ([ClePlnEquipement] ASC),
    CONSTRAINT [FK1_Trn_PlnEquipement] FOREIGN KEY ([CleTournee]) REFERENCES [SA_TMPI].[Trn_TrnTournee] ([CleTournee]),
    CONSTRAINT [FK2_Trn_PlnEquipement] FOREIGN KEY ([CleEquipement]) REFERENCES [SA_TMPI].[TrnP_RscEquipement] ([CleEquipement]),
    CONSTRAINT [UN_Trn_PlnEquipement] UNIQUE NONCLUSTERED ([CleTournee] ASC, [CleFamille] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_Trn_PlnEquipement]
    ON [SA_TMPI].[Trn_PlnEquipement]([CleTournee] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_Trn_PlnEquipement]
    ON [SA_TMPI].[Trn_PlnEquipement]([CleEquipement] ASC);

