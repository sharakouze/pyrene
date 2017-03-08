CREATE TABLE [SA_TMPI].[Edi_DemPrelevement] (
    [CleEdiPrelevement] INT           IDENTITY (1, 1) NOT NULL,
    [CleEdiDemande]     INT           NOT NULL,
    [NumPrelevement]    VARCHAR (100) NOT NULL,
    [NumPointP]         VARCHAR (50)  NULL,
    [NomPointP]         VARCHAR (100) NULL,
    [NumPointS]         VARCHAR (50)  NULL,
    [NomPointS]         VARCHAR (100) NULL,
    CONSTRAINT [PK_Edi_DemPrelevement] PRIMARY KEY CLUSTERED ([CleEdiPrelevement] ASC),
    CONSTRAINT [FK1_Edi_DemPrelevement] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [UN_Edi_DemPrelevement] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [NumPrelevement] ASC)
);

