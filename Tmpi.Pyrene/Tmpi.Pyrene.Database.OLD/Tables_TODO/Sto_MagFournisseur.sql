CREATE TABLE [SA_TMPI].[Sto_MagFournisseur] (
    [CleMagasin]     SMALLINT NOT NULL,
    [CleFournisseur] SMALLINT NOT NULL,
    [EstExclusif]    BIT      CONSTRAINT [DF_Sto_MagFournisseur_EstExclusif] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_StoMagFournisseur] PRIMARY KEY CLUSTERED ([CleMagasin] ASC, [CleFournisseur] ASC),
    CONSTRAINT [FK1_StoMagFournisseur] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_StoMagFournisseur] FOREIGN KEY ([CleFournisseur]) REFERENCES [SA_TMPI].[t_Fourn] ([CleFourn])
);

