CREATE TABLE [SA_TMPI].[Edi_Pes_BlocBordereau] (
    [ClePesBlocBordereau] INT           IDENTITY (1, 1) NOT NULL,
    [AnnFacture]          SMALLINT      NOT NULL,
    [TypBordereau]        TINYINT       NOT NULL,
    [IdBordereau]         INT           NOT NULL,
    [DatCreation]         SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_Edi_Pes_BlocBordereau] PRIMARY KEY CLUSTERED ([ClePesBlocBordereau] ASC),
    CONSTRAINT [UN_Edi_Pes_BlocBordereau] UNIQUE NONCLUSTERED ([AnnFacture] ASC, [TypBordereau] ASC, [IdBordereau] ASC)
);

