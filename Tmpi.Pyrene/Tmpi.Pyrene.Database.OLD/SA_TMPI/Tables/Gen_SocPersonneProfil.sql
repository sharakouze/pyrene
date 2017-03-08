CREATE TABLE [SA_TMPI].[Gen_SocPersonneProfil] (
    [ClePersonneProfil] INT          IDENTITY (1, 1) NOT NULL,
    [ClePersonne]       SMALLINT     NOT NULL,
    [CleSociete]        SMALLINT     NULL,
    [CleSecteur]        SMALLINT     NULL,
    [CleService]        SMALLINT     NULL,
    [CodProfil]         VARCHAR (50) NOT NULL,
    [CleSite]           SMALLINT     NULL,
    CONSTRAINT [PK_Gen_SocPersonneProfil] PRIMARY KEY CLUSTERED ([ClePersonneProfil] ASC),
    CONSTRAINT [FK1_Gen_SocPersonneProfil] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne]),
    CONSTRAINT [FK2_Gen_SocPersonneProfil] FOREIGN KEY ([CleSociete]) REFERENCES [SA_TMPI].[Gen_SocSociete] ([CleSociete]),
    CONSTRAINT [FK3_Gen_SocPersonneProfil] FOREIGN KEY ([CleSecteur]) REFERENCES [SA_TMPI].[Gen_SocSecteur] ([CleSecteur]),
    CONSTRAINT [FK4_Gen_SocPersonneProfil] FOREIGN KEY ([CleService]) REFERENCES [SA_TMPI].[Gen_SocService] ([CleService]),
    CONSTRAINT [UN1_Gen_SocPersonneProfil] UNIQUE NONCLUSTERED ([ClePersonne] ASC, [CodProfil] ASC),
    CONSTRAINT [UN2_Gen_SocPersonneProfil] UNIQUE NONCLUSTERED ([ClePersonne] ASC, [CleSecteur] ASC, [CleService] ASC, [CleSociete] ASC)
);

