CREATE TABLE [SA_TMPI].[u_Compteur] (
    [CleCompteur] SMALLINT      NOT NULL,
    [CodCompteur] VARCHAR (50)  NOT NULL,
    [LibCompteur] VARCHAR (100) NOT NULL,
    [TypCompteur] SMALLINT      CONSTRAINT [DF_u_Compteur_TypCompteur] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_u_Compteur] PRIMARY KEY CLUSTERED ([CleCompteur] ASC),
    CONSTRAINT [UN_u_Compteur] UNIQUE NONCLUSTERED ([CodCompteur] ASC)
);

