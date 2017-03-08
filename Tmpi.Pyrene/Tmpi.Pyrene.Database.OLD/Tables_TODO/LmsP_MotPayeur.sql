CREATE TABLE [SA_TMPI].[LmsP_MotPayeur] (
    [CleMotif]  SMALLINT NOT NULL,
    [ClePayeur] INT      NOT NULL,
    [TypPayeur] TINYINT  NOT NULL,
    CONSTRAINT [UN_LmsP_MotPayeur] PRIMARY KEY CLUSTERED ([CleMotif] ASC, [ClePayeur] ASC),
    CONSTRAINT [FK1_LmsP_MotPayeur] FOREIGN KEY ([CleMotif]) REFERENCES [SA_TMPI].[Lmp_MotMotif] ([CleMotif]),
    CONSTRAINT [FK2_LmsP_MotPayeur] FOREIGN KEY ([ClePayeur]) REFERENCES [SA_TMPI].[Gen_TrsTiers] ([CleTiers])
);


GO
CREATE NONCLUSTERED INDEX [ID1_LmsP_MotPayeur]
    ON [SA_TMPI].[LmsP_MotPayeur]([CleMotif] ASC);


GO
CREATE NONCLUSTERED INDEX [ID2_LmsP_MotPayeur]
    ON [SA_TMPI].[LmsP_MotPayeur]([ClePayeur] ASC);

