CREATE TABLE [SA_TMPI].[Trn_PntTypSite] (
    [CleClasse]     INT            NULL,
    [CleTypSite]    INT            IDENTITY (1, 1) NOT NULL,
    [CodTypSite]    NVARCHAR (50)  NOT NULL,
    [LibTypSite]    NVARCHAR (100) NOT NULL,
    [TxtTypSite]    NVARCHAR (255) NULL,
    [IndActif]      BIT            NULL,
    [DatModif]      DATETIME       NOT NULL,
    [CleOperateur]  INT            NULL,
    [DatValidation] DATETIME       NULL,
    [CleValideur]   INT            NULL
);

