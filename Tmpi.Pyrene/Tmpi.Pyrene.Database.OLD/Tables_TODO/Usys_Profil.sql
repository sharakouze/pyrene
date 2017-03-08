CREATE TABLE [SA_TMPI].[Usys_Profil] (
    [CleUtilisateur] INT           NOT NULL,
    [NomPropriete]   VARCHAR (256) NOT NULL,
    [ValProprieteS]  TEXT          NULL,
    [ValProprieteB]  IMAGE         NULL,
    CONSTRAINT [PK_Usys_Profil] PRIMARY KEY CLUSTERED ([CleUtilisateur] ASC, [NomPropriete] ASC)
);

