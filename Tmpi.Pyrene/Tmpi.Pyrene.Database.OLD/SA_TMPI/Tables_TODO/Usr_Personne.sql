CREATE TABLE [SA_TMPI].[Usr_Personne] (
    [ClePersonne]   SMALLINT      NOT NULL,
    [PwdPersonne]   VARCHAR (25)  NULL,
    [DatPeremption] SMALLDATETIME NULL,
    [EstAdmin]      BIT           CONSTRAINT [DF_Usr_Personne_EstAdmin] DEFAULT ((0)) NOT NULL,
    [CleFonction]   SMALLINT      NULL,
    [DatLogin]      SMALLDATETIME CONSTRAINT [DF_Usr_Personne_DatLogin] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Usr_Personne] PRIMARY KEY CLUSTERED ([ClePersonne] ASC),
    CONSTRAINT [FK1_Usr_Personne] FOREIGN KEY ([ClePersonne]) REFERENCES [SA_TMPI].[Gen_SocPersonne] ([ClePersonne])
);

