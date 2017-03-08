CREATE TABLE [SA_TMPI].[Lmp_CtxContexte] (
    [CleSecteur]    SMALLINT       NULL,
    [CleContexte]   INT            IDENTITY (1, 1) NOT NULL,
    [CleContexte_C] SMALLINT       NULL,
    [CleContexte_H] SMALLINT       NULL,
    [CodContexte]   NVARCHAR (50)  NOT NULL,
    [LibContexte]   NVARCHAR (100) NOT NULL,
    [TxtContexte]   NVARCHAR (255) NULL,
    [EstActif]      BIT            CONSTRAINT [DF_Lmp_CtxContexte_EstActif] DEFAULT ((1)) NOT NULL,
    [DatCreation]   SMALLDATETIME  CONSTRAINT [DF_Lmp_CtxContexte_DatCreation] DEFAULT (getdate()) NOT NULL,
    [CleCreateur]   SMALLINT       NOT NULL,
    [DatModif]      SMALLDATETIME  NULL,
    [CleOperateur]  SMALLINT       NULL,
    [DatValidation] DATETIME       NULL,
    [CleValideur]   SMALLINT       NULL,
    [CleExterne]    INT            NULL,
    [CleOrigine]    INT            NULL,
    CONSTRAINT [PK_Lmp_CtxContexte] PRIMARY KEY CLUSTERED ([CleContexte] ASC),
    CONSTRAINT [UN_Lmp_CtxContexte] UNIQUE NONCLUSTERED ([CleContexte_H] ASC, [CodContexte] ASC)
);

