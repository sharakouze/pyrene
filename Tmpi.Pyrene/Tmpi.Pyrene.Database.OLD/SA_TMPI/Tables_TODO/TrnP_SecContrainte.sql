CREATE TABLE [SA_TMPI].[TrnP_SecContrainte] (
    [CleSecteur]       SMALLINT      NOT NULL,
    [CleSecContrainte] INT           IDENTITY (1, 1) NOT NULL,
    [CodContrainte]    VARCHAR (50)  NOT NULL,
    [ValContrainte]    VARCHAR (200) NOT NULL,
    [TxtContrainte]    VARCHAR (200) NULL,
    [ValContrainte_D1] SMALLDATETIME NULL,
    [ValContrainte_D2] SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_SecContrainte] PRIMARY KEY CLUSTERED ([CleSecContrainte] ASC)
);

