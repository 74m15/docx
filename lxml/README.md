# lxml

## Pre-requisiti

*docx/lxml* è un'applicazione Python che prevede i seguenti pre-requisiti:

* Python 3.4 (o superiore)
* lxml 3.7.2
* UNIX like commands

### Installare *Python*

Python è disponibile dal [sito ufficiale](https://www.python.org/). 

Si consiglia l'installazione dell'ultima versione disponibile: alla data del 
21 febbraio 2017, si può scaricare la versione
[3.6.0](https://www.python.org/downloads/release/python-360/)

### Installare *lxml*

Si possono seguire le istruzioni presenti nel sito, tuttavia per ambiente Windows viene 
suggerito di scaricare una [distribuzione pre-compilata](http://www.lfd.uci.edu/~gohlke/pythonlibs/#lxml).
E' necessario fare attenzione alla selezione del file corrispondente alla versione di
Python che è stata installata.

Sia, `lxml.whl` il file scaricato, per installarlo è sufficiente eseguire il seguente
comando:

    pip install lxml.whl

### Installare *UNIX like commands*

Nel repository è stata inserita una implementazione compatibile con ambienti Windows 
dei principali comandi UNIX. Per usare questi comandi è sufficiente modificare la
variabile di ambiente `PATH`.

Sia `c:\docx` il percorso nel quale è stato scaricato il repository GIT. Per attivare
i comandi UNIX è sufficiente eseguire la seguente istruzione a riga di comando:

    PATH c:\docx\UNIX\bin;c:\docx\UNIX\usr\local\wbin;%PATH%

Saranno quindi disponibili i comandi UNIX utilizzati all'interno degli script:

* `zip`: per la creazione/aggiornamento di un archivio ZIP
* `unzip`: per l'estrazione dei contenuti di un archivio ZIP
* `cp`: per la copia di file
* `mv`: per lo spostamento (ri-denominazione) di file e/o directory
* `rm`: per la cancellazione di file e/o directory


## Esecuzione

L'elaborazione del documento prevede tre passaggi:

1.  la *definizione della configurazione* alla base di tutte le elaborazioni, tramite 
    editing del file `config.xml` (operazione da eseguire *UNA TANTUM* in fase di
    preparazione del processo di elaborazione del documento);
2.  la *preparazione del database* tramite l'elaborazione di un file **xslx** per 
    produrre il file `database.xml` (operazione da eseguire solo a fronte di variazioni
    del contenuto del file xlsx);
3.  la *elaborazione del documento* **docx** per aggiornarne il contenuto a partire dai 
    dati contenuti nel database.

### Definizione della configurazione

**TO DO** Descrivere struttura e contenuto del file `config.xml`

### Preparazione del database

Per la preparazione del database è possibile utilizzare lo script `prepare-db.bat`:

    prepare-db.bat -in input-file -log L

*   `input-file` è il nome del file **xlsx** contenente tutte le tabelle che devono 
    essere usate per alimentare il database (es. "database.2016.0.1.xlsx")
*   'L' è il livello di log atteso:
    * `0` DEBUG
    * `1` INFO
    * `2` WARNING
    * `3` ERROR

Lo script crea nella cartella corrente il file `database.xml`.

### Elaborazione del documento

Per l'elaborazione del documento è possibile utilizzare lo script `process.bat`:

    process.bat -in input-file -log L [-dummy]

*   `input-file` è il nome del file **docx** contenente il "modello" di documento
    da elaborare per inserirvi i dati presenti nel file `database.xml` che deve
    essere già presente nella cartella corrente
*   'L' è il livello di log atteso:
    * `0` DEBUG
    * `1` INFO
    * `2` WARNING
    * `3` ERROR
*   `-dummy` è un flag opzionale che, se presente, forza la sostituzione di tutti i
    valori dinamici (nel testo e nelle tabelle) con l'etichetta "DUMMY" (utile per
    il controllo di corretta elaborazione del documento)

Lo script crea nella cartella corrente un nuovo documento il cui nome è pari a quello
di ingresso con un prefisso `new.` (es. "template.docx" => "new.template.docx").