CREATE TABLE [SA_TMPI].[TrnP_Pnt_PrfContrainte] (
    [CleProfil]        SMALLINT      NOT NULL,
    [ClePrfContrainte] SMALLINT      IDENTITY (1, 1) NOT NULL,
    [CodContrainte]    VARCHAR (50)  NOT NULL,
    [ValContrainte]    VARCHAR (200) NOT NULL,
    [TxtContrainte]    VARCHAR (200) NULL,
    [ValContrainte_D1] SMALLDATETIME NULL,
    [ValContrainte_D2] SMALLDATETIME NULL,
    CONSTRAINT [PK_TrnP_Pnt_PrfContrainte] PRIMARY KEY CLUSTERED ([ClePrfContrainte] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ID1_TrnP_Pnt_PrfContrainte]
    ON [SA_TMPI].[TrnP_Pnt_PrfContrainte]([CleProfil] ASC);

