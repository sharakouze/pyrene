CREATE TABLE [SA_TMPI].[Ope_OpeOperation] (
    [CleSecteur]      SMALLINT       NULL,
    [CleService]      SMALLINT       NULL,
    [CleOperation]    INT            IDENTITY (1, 1) NOT NULL,
    [NumOperation]    VARCHAR (50)   NOT NULL,
    [LibOperation]    VARCHAR (400)  NOT NULL,
    [TxtOperation]    VARCHAR (4000) NULL,
    [NomBeneficiaire] VARCHAR (100)  NULL,
    [DatDebut]        SMALLDATETIME  NULL,
    [DatFin]          SMALLDATETIME  NULL,
    [SttOperation]    TINYINT        CONSTRAINT [DF_Ope_OpeOperation_SttOperation] DEFAULT ((0)) NOT NULL,
    [MntPrevu]        REAL           CONSTRAINT [DF_Ope_OpeOperation_MntPrevu] DEFAULT ((0)) NOT NULL,
    [EstSuspendu]     BIT            CONSTRAINT [DF_Ope_OpeOperation_EstSuspendu] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ope_OpeOperation] PRIMARY KEY CLUSTERED ([CleOperation] ASC)
);

