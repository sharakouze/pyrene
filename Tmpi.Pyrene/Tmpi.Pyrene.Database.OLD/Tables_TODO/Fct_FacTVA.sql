CREATE TABLE [SA_TMPI].[Fct_FacTVA] (
    [CleFacture] INT             NOT NULL,
    [TauTVA]     DECIMAL (5, 2)  NOT NULL,
    [MntHT]      DECIMAL (10, 2) NOT NULL,
    CONSTRAINT [PK_Fct_FacTVA] PRIMARY KEY CLUSTERED ([CleFacture] ASC, [TauTVA] ASC),
    CONSTRAINT [FK1_Fct_FacTva] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[Fct_FacFacture] ([CleFacture])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Fct_FacTVA]
    ON [SA_TMPI].[Fct_FacTVA]([CleFacture] ASC);

