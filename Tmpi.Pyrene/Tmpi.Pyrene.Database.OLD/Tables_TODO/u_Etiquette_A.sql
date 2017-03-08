CREATE TABLE [SA_TMPI].[u_Etiquette_A] (
    [CleEtiquette]  INT            IDENTITY (1, 1) NOT NULL,
    [CleOperateur]  SMALLINT       NOT NULL,
    [CleArticle]    INT            NULL,
    [CleLot]        INT            NULL,
    [CleEReception] INT            NULL,
    [NbrEtiquette]  SMALLINT       NULL,
    [NbrUnite]      DECIMAL (8, 3) NULL,
    CONSTRAINT [PK_u_Etiquette_A] PRIMARY KEY CLUSTERED ([CleEtiquette] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_u_Etiquette_A]
    ON [SA_TMPI].[u_Etiquette_A]([CleOperateur] ASC) WITH (FILLFACTOR = 90);

