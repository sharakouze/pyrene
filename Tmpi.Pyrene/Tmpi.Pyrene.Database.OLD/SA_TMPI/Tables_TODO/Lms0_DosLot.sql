CREATE TABLE [SA_TMPI].[Lms0_DosLot] (
    [CleDosLot]         INT      IDENTITY (1, 1) NOT NULL,
    [CleDossier]        INT      NOT NULL,
    [NumLot]            SMALLINT NOT NULL,
    [CleGroupeP]        SMALLINT NOT NULL,
    [CleInterpretation] SMALLINT NULL,
    CONSTRAINT [PK_Lms0_DosLot] PRIMARY KEY CLUSTERED ([CleDosLot] ASC),
    CONSTRAINT [FK1_Lms0_DosLot] FOREIGN KEY ([CleDossier]) REFERENCES [SA_TMPI].[Lms0_DosDossier] ([CleDossier]),
    CONSTRAINT [FK2_Lms0_DosLot] FOREIGN KEY ([CleGroupeP]) REFERENCES [SA_TMPI].[Lmp_GrpGroupeP] ([CleGroupeP]),
    CONSTRAINT [FK3_Lms0_DosLot] FOREIGN KEY ([CleInterpretation]) REFERENCES [SA_TMPI].[Lmp_Par_Interp] ([CleInterp]),
    CONSTRAINT [UN_Lms0_DosLot] UNIQUE NONCLUSTERED ([CleDossier] ASC, [CleGroupeP] ASC, [NumLot] ASC)
);

