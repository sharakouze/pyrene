CREATE TABLE [SA_TMPI].[Trn_PntTypPoint] (
    [CleClasse]     INT            NULL,
    [CleTypPoint]   INT            IDENTITY (1, 1) NOT NULL,
    [CodTypPoint]   NVARCHAR (50)  NOT NULL,
    [CodMnTypPoint] NVARCHAR (50)  NULL,
    [LibTypPoint]   NVARCHAR (100) NOT NULL,
    [TxtTypPoint]   NVARCHAR (255) NULL,
    [IndActif]      BIT            NULL,
    [DatModif]      DATETIME       NOT NULL,
    [CleOperateur]  INT            NULL,
    [DatValidation] DATETIME       NULL,
    [CleValideur]   INT            NULL
);

