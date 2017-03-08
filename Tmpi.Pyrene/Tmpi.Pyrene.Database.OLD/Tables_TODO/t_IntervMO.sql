CREATE TABLE [SA_TMPI].[t_IntervMO] (
    [CleInterv]   INT             NOT NULL,
    [CleMO]       SMALLINT        NOT NULL,
    [QteLivree]   DECIMAL (15, 3) CONSTRAINT [DF_t_IntervMO_QteLivree] DEFAULT ((0)) NOT NULL,
    [CodMO]       VARCHAR (50)    NOT NULL,
    [LibMO]       VARCHAR (100)   NOT NULL,
    [PrxUnitaire] DECIMAL (15, 4) CONSTRAINT [DF_t_IntervMO_PrxUnitaire] DEFAULT ((0)) NOT NULL,
    [CleIntervMo] INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [FK1_t_IntervMO] FOREIGN KEY ([CleInterv]) REFERENCES [SA_TMPI].[t_Interv] ([CleInterv]),
    CONSTRAINT [FK2_t_IntervMO] FOREIGN KEY ([CleMO]) REFERENCES [SA_TMPI].[t_MO] ([CleMO])
);


GO
CREATE NONCLUSTERED INDEX [ID1_t_IntervMO]
    ON [SA_TMPI].[t_IntervMO]([CleInterv] ASC) WITH (FILLFACTOR = 90);

