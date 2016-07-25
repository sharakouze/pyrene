using System;
using System.Reflection;
using System.Resources;
using System.Runtime.InteropServices;

// Les informations générales relatives à un assembly dépendent de 
// l'ensemble d'attributs suivant. Changez les valeurs de ces attributs pour modifier les informations
// associées à un assembly.
#if DEBUG
[assembly: AssemblyConfiguration("Debug")]
#elif TRACE
[assembly: AssemblyConfiguration("Release+Trace")]
#else
[assembly: AssemblyConfiguration("Release")]
#endif
[assembly: AssemblyCompany("TMPI")]
[assembly: AssemblyProduct("Pyrene.NET")]
[assembly: AssemblyCopyright("Copyright © TMPI 2016")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]

// L'affectation de la valeur false à ComVisible rend les types invisibles dans cet assembly 
// aux composants COM.  Si vous devez accéder à un type dans cet assembly à partir de 
// COM, affectez la valeur true à l'attribut ComVisible sur ce type.
[assembly: ComVisible(false)]

// Attributs supplémentaires

[assembly: AssemblyInformationalVersion("4.0")]

[assembly: CLSCompliant(true)]

[assembly: NeutralResourcesLanguage("fr")]
