CREATE TABLE [SA_TMPI].[Usys_Role_Utilisateur] (
    [CleUtilisateur] INT NOT NULL,
    [CleRole]        INT NOT NULL,
    CONSTRAINT [PK_Usys_Role_Utilisateur] PRIMARY KEY CLUSTERED ([CleRole] ASC, [CleUtilisateur] ASC)
);

