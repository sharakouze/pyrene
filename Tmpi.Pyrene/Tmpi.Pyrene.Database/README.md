# Tmpi.Pyrene.Database

Base de données PYRENE.

## Schémas

L'application PYRENE est décomposée en plusieurs modules.
Les objets de la base de données associés à chacun de ces modules sont regroupés dans un schéma spécifique :

Module | Schéma
-------|-------
Commun* | Gen
Stock | Sto
Concerto | Lsn
Budget | Bud
GMAO | Equ
Document | Doc
Tournées | Trn
Facturation | Fct
Symphonie (LIMS) | Lms
Prélude (automates) | Aut
Marketing | Bdg
EDI | Edi

> Le module "Commun" regroupe ...

## Tables

### Structure

- Toutes les tables doivent avoir une clé primaire.
  - Les tables sans clé primaire ne sont pas autorisées pour l'instant.
- Les clés primaires composites sont interdites.

#### Audit

Pour pouvoir utiliser le mécanisme qui renseigne automatiquement le contexte de création et de modification d'une entité.

*SQL Server :*
> [...]
> [DatCreation] DATETIME NOT NULL,
> [CleCreateur] INT NOT NULL,
> [DatEdition] DATETIME NULL,
> [CleEditeur] INT NULL,
> [...]

### Nommage


## Index
