CREATE TABLE [SA_TMPI].[Bdg_FacMandat] (
    [CleFacture]    INT            NOT NULL,
    [CleFacMandat]  INT            IDENTITY (1, 1) NOT NULL,
    [CleMandat]     SMALLINT       NOT NULL,
    [NivMandat]     SMALLINT       NOT NULL,
    [DatValidation] SMALLDATETIME  NULL,
    [CleValideur]   SMALLINT       NULL,
    [TxtMandat]     NVARCHAR (255) NULL,
    CONSTRAINT [PK_BdgFacMandat] PRIMARY KEY CLUSTERED ([CleFacMandat] ASC),
    CONSTRAINT [FK1_BdgFacMandat] FOREIGN KEY ([CleFacture]) REFERENCES [SA_TMPI].[Bdg_FacFacture] ([CleFacture])
);

