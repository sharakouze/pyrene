CREATE TABLE [SA_TMPI].[Edi9_DemPrelevement] (
    [CleEdiPrelevement] INT           NOT NULL,
    [CleEdiDemande]     INT           NOT NULL,
    [NumPrelevement]    VARCHAR (100) NOT NULL,
    [NumPointP]         VARCHAR (50)  NULL,
    [NomPointP]         VARCHAR (100) NULL,
    [NumPointS]         VARCHAR (50)  NULL,
    [NomPointS]         VARCHAR (100) NULL,
    CONSTRAINT [PK_Edi9_DemPrelevement] PRIMARY KEY CLUSTERED ([CleEdiPrelevement] ASC),
    CONSTRAINT [FK1_Edi9_DemPrelevement] FOREIGN KEY ([CleEdiDemande]) REFERENCES [SA_TMPI].[Edi9_DemDemande] ([CleEdiDemande]),
    CONSTRAINT [UN_Edi9_DemPrelevement] UNIQUE NONCLUSTERED ([CleEdiDemande] ASC, [NumPrelevement] ASC)
);

