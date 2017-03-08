CREATE TABLE [SA_TMPI].[Lms_DemPrelevement] (
    [CleDemPrelevement] INT           IDENTITY (1, 1) NOT NULL,
    [CleDemande]        INT           NOT NULL,
    [NumPrelevement]    VARCHAR (100) NOT NULL,
    [NumPointP]         VARCHAR (50)  NULL,
    [NomPointP]         VARCHAR (100) NULL,
    [NumPointS]         VARCHAR (50)  NULL,
    [NomPointS]         VARCHAR (100) NULL,
    CONSTRAINT [PK_Lms_DemPrelevement] PRIMARY KEY CLUSTERED ([CleDemPrelevement] ASC),
    CONSTRAINT [FK1_Lms_DemPrelevement] FOREIGN KEY ([CleDemande]) REFERENCES [SA_TMPI].[Lms_DemDemande] ([CleDemande]),
    CONSTRAINT [UN_Lms_DemPrelevement] UNIQUE NONCLUSTERED ([CleDemande] ASC, [NumPrelevement] ASC)
);

