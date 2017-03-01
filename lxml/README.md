# lxml

## Pre-requisiti

*docx/lxml* è un'applicazione Python che prevede i seguenti pre-requisiti:

* Python 3.4 (o superiore)
* lxml 3.7.3
* bottle 0.12.13
* UNIX like commands o ambiente Linux

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

**docx** è stato testato su Linux (debian). Può tuttavia funzionare anche sotto Windows
(testato su Win7) purchè siano presenti i più comuni comandi UNIX.

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


## Esecuzione da linea di comando

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

Per la preparazione del database è possibile utilizzare lo script `prepare-db.bat`
(per Windows) oppure `prepare.sh` (per Linux):

    prepare-db.bat -in input-file -out db-file -log L
    prepare-db.sh  -in input-file -out db-file -log L

*   `input-file` è il nome del file XLSX contenente tutte le tabelle che devono 
    essere usate per alimentare il database. Il programma si attende di trovare il 
    file di input nella sotto-cartella `work/database`. Se assente, si assume come 
    file di input `database.xlsx`
*   `db-file` è il nome del file XML che verrà generato dal programma all'interno 
    della sotto-cartella `work/database`. Se assente, si assume come file di output 
    `database.xml`
*   'L' è il livello di log atteso:
    * `0` DEBUG
    * `1` INFO (**default**)
    * `2` WARNING
    * `3` ERROR

### Elaborazione del documento

Per l'elaborazione del documento è possibile utilizzare lo script `process.bat` (per
Windows) oppure `process.sh` (per Linux):

    process.bat -in input-file -out output-file -db db-file -log L -dummy
    process.sh  -in input-file -out output-file -db db-file -log L -dummy

*   `input-file` è il nome del file DOCX contenente il "modello" di documento
    da elaborare per inserirvi i dati presenti nel database (es. "template.docx"). 
    Il programma ai attende di trovare il file di input nella sotto-cartella
    `work/document`. Se assente, si assume come file di input `template.docx`
*   `output-file è il nome del file DOCX che sarà generato come output della
    elaborazione del documento di input. Il file di output sarà creato nella 
    sotto-cartella `work/document`. Se assente, si assume come file di output 
    `new.template.docx`
*   `db-file` è il nome del file contenente il database con i dati da inserire
    nel documento durante l'elaborazione. Il programma ai attende di trovare il 
    database nella sotto-cartella `work/database`. Se assente, si assume come 
    database `database.xml`
*   'L' è il livello di log atteso:
    * `0` DEBUG
    * `1` INFO (**default**)
    * `2` WARNING
    * `3` ERROR
*   `-dummy` è un flag opzionale che, se presente, forza la sostituzione di tutti i
    valori dinamici (nel testo e nelle tabelle) con l'etichetta "DUMMY" (utile per
    il controllo di corretta elaborazione del documento).

## Interfaccia Web

Per semplificare l'interazione con gli utenti, è disponibile anche una
rudimentale interfaccia web che consente di caricare i file di ingresso e di
scaricare i relativi elaborati usando un semplice browser web.

Si può lanciare l'interfaccia web da riga di comando:

    python web.py
    
Per accedere all'interfaccia si deve andare all'indirizzo (in caso di esecuzione locale,
al posto di `<host>` si può inserire `localhost`):

    http://<host>:8080/

La schermata che compare consente di caricare fino a 3 file:

* il database in formato XLSX
* il database in formato XML
* il modello di documento DOCX

Si suggerisce di utilizzare l'interfaccia per eseguire esclusivamente le seguenti azioni:

1. elaborare solamente il database in formato XLSX
2. elaborare congiuntamente il database XML e il modello DOCX

Selezionato/i il/i file da caricare, si può premere il tasto "Go!"

A questo punto vengono effettuate le elaborazioni necessarie e i risultati
sono mostrati (a meno di errori) nella pagina seguente, che propone i link
per scaricare i file da salvare localmente per successive elaborazioni.

**NOTA** Si suggerisce di elaborare il database XLSX solo quando necessario!

## Redazione DOCX

Per consentire la massima flessibilità per l'utente finale nella creazione 
della nota integrativa, è stato scelto come strumento di lavoro qualunque
software di office automation che supporti il formato Office Open XML, ad esempio
la suite *Microsoft Office* oppure la suite *OpenOffice*.

Per l'alimentazione di contenuti a partire da un database realizzato tramite
spreadsheet, è necessario per l'utente apprendere l'utilizzo dei **commenti** e delle 
**espressioni**.

###	Commenti

In un documento, un *commento* è un elemento testuale che si riferisce ad una porzione 
del documento ben delimitata. Un commento non viene mostrato nella visualizzazione 
"Finale" di un documento, quindi può essere liberamente inserito e/o modificato da un 
utente senza che ci siano impatti nella stampa finale del documento.

Per delimitare nel modello di documento le porzioni del testo che dovranno essere 
aggiornate con i dati provenienti dal database, quindi, si dovranno utilizzare appositi 
commenti, che potranno essere fatti sia a livello di testo (per singoli valori) sia a 
livello di paragrafo (per le tabelle):

*   il **commento di testo** serve per delimitare una porzione di testo all'interno di un 
    paragrafo e rappresenta un segnaposto per l'inserimento del valore effettivo in base 
    all'espressione presente nel commento;
*   il **commento di paragrafo**, invece, serve per delimitare un paragrafo (o più paragrafi 
    che saranno considerati uno solo) all'interno del quale inserire una tabella proveniente 
    dal database in base all'espressione presente nel commento.
 
###	Espressioni

Le espressioni sono costrutti che combinano valori e operatori per definire regole utili agli
strumenti per l'elaborazione del documento.

Sono state definite due tipologie di espressioni:

* selezione di tabella
* selezione di valore

#### Espressioni per selezione di tabella

Le espressioni per selezione di tabella possono essere utilizzate all'interno di un commento 
di paragrafo e hanno lo scopo di definire la tabella del database che deve essere inserita nel 
documento in sostituzione della porzione di documento evidenziata dal commento stesso.

L'espressione ha la forma `table:<id>`, dove `<id>` è il codice della tabella come definito 
nel database (es. "T0400").

Esempi:

*	`table:T0010` per selezionare la tabella con codice "T0010" nel database
*	`table:T0230` per selezionare la tabella con codice "T0230" nel database

####	Espressioni per selezione di valore

Le espressioni per selezione di valore possono essere utilizzare all'interno di un commento 
di testo e hanno lo scopo di definire il valore che deve essere inserito nel documento in 
sostituzione della porzione di testo evidenziata dal commento. La valutazione dell'espressione 
può prendere in considerazione anche i dati presenti nel database.

L'espressione ha la forma `xml:<expression>`, dove `<expression>` è un'espressione definita 
con il linguaggio XPath.

Sono definite le seguenti funzioni per la formattazione finale del risultato:

*	`ni:integer` - numero intero senza decimali e con raggruppamento delle migliaia (#.##0)
*	`ni:percent` - percentuale con due decimali e simbolo “%” (#.##0,00%)
*	`ni:percent3` - percentuale con tre decimali e simbolo “%”(#.##0,000%)
*	`ni:double` - numero con due decimali e raggruppamento delle migliaia (#.##0,00)
*	`ni:money` - valore senza decimali e con raggruppamento delle migliaia (#.##0)
*	`ni:string` - testo semplice senza formattazione (default)

Per `<expression>` sono valide le seguenti considerazioni:

*	  per fare riferimento ad una cella di una tabella, si può usare la sintassi `[<table>!<cell>]`,
    dove `<table>` indica il nome della tabella (es. "T0010") e `<cell>` indica l'indirizzo della
    cella, espressa in una delle due forme tipiche del mondo spreadsheet (es. "R2C4" ovvero "D2")
*	  possono essere utilizzate tutte le funzioni standard XPath (es. `position()`)
*	  possono essere utilizzate tutte le funzioni del package “math” dell'estensione EXSLT 
    (es. `math:abs()`)

Esempi:

*	  `xml:$config//year.current` per selezionare il valore della proprietà `year.current` contenuto 
    nel nodo di configurazione `$config` (*da rivedere per future versioni*)
*	  `xml:[T0010!R10C12]` ovvero `xml:[T0010!L10]` per selezionare nella tabella "T0010" il valore della 
    cella posta alla riga 10 e alla colonna 12 ovvero la cella "L10"
*   `xml:ni:money([T0010!L10])` per formattare come valuta l'importo del punto precedente
*   `xml:ni:money([T0010!R10C12] + [T0030!R21C12])` per fare la somma dei valori presenti, rispettivamente, 
    a) nella tabella “T0010” alla riga 10 e alla colonna 12 e b) nella tabella “T0030” alla riga 21 e 
    alla colonna 12, poi formattare tutto con il formato “ni:money”
*   `xml:ni:money(math:abs([T0010!R10C12] - [T0010!R10C5]))` per calcolare il valore assoluto (formattato 
    come “ni:money”) della differenza di due celle, rispettivamente, a) quella nella tabella “T0010” alla 
    riga 10 e alla colonna 12 e b) quella nella tabella “T0010” alla riga 10 e alla colonna 5
