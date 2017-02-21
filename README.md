*# docx
Tools for *docx* manipulation.

## Introduzione
**docx** è un progetto nato per supportare la redazione del documento *Nota Integrativa*, un allegato al bilancio di esercizio di ogni azienda.

Questo tipo di documento è caratterizzato da una forte integrazione di testo, numeri e tabelle che devono essere *sincronizzati* con i dati reali della contabilità che vanno a descrivere. 

L'utente necessita di strumenti *user-friendly* che non ne limitino la produttività, possibilmente strumenti già *noti* e di uso comune:

* **Microsoft Word** per la redazione del documento
* **Microsoft Excel** per la predisposizione dei dati e delle tabelle

La scelta di questi strumenti ha guidato anche la selezione delle tecnologie e degli strumenti principali:

* **Formato dei file**: *Office Open XML*
  * *docx* per i documenti
  * *xlsx* per i fogli di lavoro
* **Elaborazione XML**
  * *[XPath 1.0](https://www.w3.org/TR/xpath/)
  * *[XSLT 1.0](https://www.w3.org/TR/xslt)*
  * *[EXSLT](http://exslt.org/)*

Nel corso del tempo sono state realizzate due distinte implementazioni:

* **xalan**: basata sulla libreria *[Apache Xalan 2.7.0](https://xml.apache.org/xalan-j/)*
* **lxml**: basata sulla libreria *[lxml](http://lxml.de/index.html)* (binding Python per le librerie [libxml2](http://xmlsoft.org/) e [libxslt](http://xmlsoft.org/XSLT/))
