CREATE TABLE [SA_TMPI].[Gen_Trs_Propriete] (
    [ClePropriete] SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CodPropriete] VARCHAR (50)   NOT NULL,
    [LibPropriete] VARCHAR (500)  NOT NULL,
    [TxtPropriete] VARCHAR (2000) NULL,
    [CleOrigine]   TINYINT        NULL,
    [CleExterne]   SMALLINT       NULL,
    CONSTRAINT [PK_Gen_Trs_Propriete] PRIMARY KEY CLUSTERED ([ClePropriete] ASC),
    CONSTRAINT [UN_Gen_Trs_Propriete] UNIQUE NONCLUSTERED ([CodPropriete] ASC)
);

