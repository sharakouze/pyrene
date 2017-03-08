CREATE TABLE [SA_TMPI].[Lsn_MLsnRequete] (
    [CleMLiaison]        SMALLINT       NOT NULL,
    [CleMLsnRequete]     INT            IDENTITY (1, 1) NOT NULL,
    [NumOrdre]           TINYINT        CONSTRAINT [DF_Lsn_MLsnRequete_NumOrdre] DEFAULT ((0)) NOT NULL,
    [LibRequete]         VARCHAR (255)  NOT NULL,
    [TypRequete]         TINYINT        CONSTRAINT [DF_Lsn_MLsnRequete_TypRequete] DEFAULT ((0)) NOT NULL,
    [TxtRequete]         VARCHAR (4000) NULL,
    [NbrParam]           TINYINT        CONSTRAINT [DF_Lsn_MLsnRequete_NbrParam] DEFAULT ((0)) NOT NULL,
    [TypSource1]         TINYINT        CONSTRAINT [DF_Lsn_MLsnRequete_TypSource1] DEFAULT ((0)) NOT NULL,
    [TxtConnect1]        VARCHAR (255)  NULL,
    [CodUtilisateur1]    VARCHAR (50)   NULL,
    [PwdUtilisateur1]    VARCHAR (25)   NULL,
    [NomBase1]           VARCHAR (100)  NULL,
    [TxtComplement1]     VARCHAR (100)  NULL,
    [TypSource2]         TINYINT        NULL,
    [TxtConnect2]        VARCHAR (255)  NULL,
    [CodUtilisateur2]    VARCHAR (50)   NULL,
    [PwdUtilisateur2]    VARCHAR (25)   NULL,
    [NomBase2]           VARCHAR (100)  NULL,
    [TxtComplement2]     VARCHAR (100)  NULL,
    [CodTable]           VARCHAR (50)   NULL,
    [IndEcrase]          BIT            CONSTRAINT [DF_Lsn_MLsnRequete_IndEcrase] DEFAULT ((0)) NOT NULL,
    [NumErreur]          SMALLINT       NULL,
    [CARSEPDONNEES]      VARCHAR (1)    NULL,
    [CARIDENTTEXTE]      VARCHAR (1)    NULL,
    [CODENCODAGE]        VARCHAR (50)   NULL,
    [FRMDATE]            VARCHAR (50)   NULL,
    [CARSEPDECIMAL]      VARCHAR (1)    NULL,
    [CleEtat]            SMALLINT       NULL,
    [IndLigne1EstNomCol] BIT            CONSTRAINT [DF_Lsn_MLsnRequete_IndLigne1EstNomCol] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Lsn_MLsnRequete] PRIMARY KEY CLUSTERED ([CleMLsnRequete] ASC),
    CONSTRAINT [FK1_Lsn_MLsnRequete] FOREIGN KEY ([CleMLiaison]) REFERENCES [SA_TMPI].[Lsn_MLsnMLiaison] ([CleMLiaison])
);


GO
CREATE NONCLUSTERED INDEX [ID1_Lsn_MLsnRequete]
    ON [SA_TMPI].[Lsn_MLsnRequete]([CleMLiaison] ASC);

