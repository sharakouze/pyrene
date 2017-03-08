CREATE TABLE [SA_TMPI].[Lms_DosLot] (
    [CleDosLot]         INT      IDENTITY (1, 1) NOT NULL,
    [CleDossier]        INT      NOT NULL,
    [NumLot]            SMALLINT NOT NULL,
    [CleGroupeP]        SMALLINT NOT NULL,
    [CleInterpretation] SMALLINT NULL,
    CONSTRAINT [PK_Lms_DosLot] PRIMARY KEY CLUSTERED ([CleDosLot] ASC),
    CONSTRAINT [FK1_Lms_DosLot] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms_DosLot] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [UN_Lms_DosLot] UNIQUE NONCLUSTERED ([CleDossier] ASC, [CleGroupeP] ASC, [NumLot] ASC)
);

