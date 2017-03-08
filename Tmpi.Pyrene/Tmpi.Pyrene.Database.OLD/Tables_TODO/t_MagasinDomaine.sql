CREATE TABLE [SA_TMPI].[t_MagasinDomaine] (
    [CleMagasin] SMALLINT NOT NULL,
    [CleDomaine] SMALLINT NOT NULL,
    [IndDefaut]  BIT      CONSTRAINT [DF_t_MagasinDomaine_IndDefaut] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_t_MagasinDomaine] PRIMARY KEY CLUSTERED ([CleDomaine] ASC, [CleMagasin] ASC),
    CONSTRAINT [FK1_t_MagasinDomaine] FOREIGN KEY ([CleMagasin]) REFERENCES [SA_TMPI].[t_Magasin] ([CleMagasin]),
    CONSTRAINT [FK2_t_MagasinDomaine] FOREIGN KEY ([CleDomaine]) REFERENCES [SA_TMPI].[t_Domaine] ([CleDomaine])
);

