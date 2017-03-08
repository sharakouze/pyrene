CREATE TABLE [SA_TMPI].[t_ArtNomenc] (
    [CleNomenc]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodNomenc]     VARCHAR (50)  NOT NULL,
    [LibNomenc]     VARCHAR (100) NOT NULL,
    [TxtNomenc]     VARCHAR (255) NULL,
    [MntSeuil]      INT           CONSTRAINT [DF_t_ArtNomenc_MntSeuil] DEFAULT ((0)) NOT NULL,
    [DatSaisie]     DATETIME      CONSTRAINT [DF_t_ArtNomenc_DatSaisie] DEFAULT (getdate()) NOT NULL,
    [CleOperateur]  INT           CONSTRAINT [DF_t_ArtNomenc_CleOperateur] DEFAULT ((0)) NOT NULL,
    [NumVersion]    TINYINT       NULL,
    [DatValidation] DATETIME      NULL,
    [CleValideur]   INT           NULL,
    CONSTRAINT [PK_t_ArtNomenc] PRIMARY KEY CLUSTERED ([CleNomenc] ASC),
    CONSTRAINT [UN_t_ArtNomenc] UNIQUE NONCLUSTERED ([CodNomenc] ASC)
);

