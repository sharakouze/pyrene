CREATE TABLE [SA_TMPI].[Bdg_FacLigne] (
    [CleFacture]    INT             NOT NULL,
    [CleFacLigne]   INT             IDENTITY (1, 1) NOT NULL,
    [LibLigne]      VARCHAR (100)   NOT NULL,
    [TxtLigne]      VARCHAR (255)   NULL,
    [MntHT]         DECIMAL (10, 2) NOT NULL,
    [CleImputation] SMALLINT        NOT NULL,
    CONSTRAINT [PK_Bdg_FacLigne] PRIMARY KEY CLUSTERED ([CleFacLigne] ASC),
    CONSTRAINT [FK1_Bdg_FacLigne] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[Bdg_FacFacture] ([CleFacture]),
    CONSTRAINT [FK2_Bdg_FacLigne] FOREIGN KEY ([CleImputation]) REFERENCES [SA_TMPI].[t_Imput] ([CleImput])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Bdg_FacLigne]
    ON [SA_TMPI].[Bdg_FacLigne]([CleFacture] ASC);

