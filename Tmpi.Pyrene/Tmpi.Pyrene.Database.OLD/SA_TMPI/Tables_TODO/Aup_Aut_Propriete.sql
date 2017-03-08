CREATE TABLE [SA_TMPI].[Aup_Aut_Propriete] (
    [CleAutPropriete]  INT           IDENTITY (1, 1) NOT NULL,
    [TypTransfert]     TINYINT       NOT NULL,
    [TypCommunication] TINYINT       NOT NULL,
    [TypDonnee]        TINYINT       NOT NULL,
    [NomPropriete]     VARCHAR (50)  NOT NULL,
    [TxtPropriete]     VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Aup_Aut_Propriete] PRIMARY KEY CLUSTERED ([CleAutPropriete] ASC)
);

