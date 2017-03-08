CREATE TABLE [SA_TMPI].[Gen_Prf_Menu] (
    [CleFonction] SMALLINT NOT NULL,
    [CleMenu]     SMALLINT NOT NULL,
    [IndAjout]    BIT      CONSTRAINT [DF_Gen_Prf_Menu_IndAjout] DEFAULT ((0)) NOT NULL,
    [IndLecture]  BIT      CONSTRAINT [DF_Gen_Prf_Menu_IndLecture] DEFAULT ((0)) NOT NULL,
    [IndModif]    BIT      CONSTRAINT [DF_Gen_Prf_Menu_IndModif] DEFAULT ((0)) NOT NULL,
    [IndSuppr]    BIT      CONSTRAINT [DF_Gen_Prf_Menu_IndSuppr] DEFAULT ((0)) NOT NULL,
    [IndValide]   BIT      CONSTRAINT [DF_Gen_Prf_Menu_IndValide] DEFAULT ((0)) NOT NULL,
    [IndImprim]   BIT      CONSTRAINT [DF_Gen_Prf_Menu_IndImprim] DEFAULT ((0)) NOT NULL,
    [CleLogiciel] SMALLINT CONSTRAINT [DF_Gen_Prf_Menu_CleLogiciel] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Gen_Prf_Menu] PRIMARY KEY CLUSTERED ([CleFonction] ASC, [CleMenu] ASC),
    CONSTRAINT [FK1_Gen_Prf_Menu] FOREIGN KEY ([CleFonction]) REFERENCES [SA_TMPI].[Gen_Prf_Fonction] ([CleFonction])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Gen_Prf_Menu]
    ON [SA_TMPI].[Gen_Prf_Menu]([CleFonction] ASC);

