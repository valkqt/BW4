# Pagah - L'ecommerce dove paghi e non compri nulla

# Per Iniziare

Questa applicazione web dev'essere inizializzata da Visual Studio con i servizi Microsoft IIS, che avvieranno l'applicazione in localhost, e richiedono una connessione a SQL Server Management Studio (SSMS) in locale per i dati.
Prima di avviare l'applicazione è necessario:

1) Aprire SSMS e creare un nuovo database chiamato "Ecommerce"
2) Nel file Web.Config, modificare la Connection String che rappresenta la connessione locale al database. Dentro il tag <configuration>:
  ![conn](https://github.com/valkqt/BW4/assets/103358560/446e0154-09c7-46d3-9d82-73d441738472)
  "YOURCOMPUTER" rappresenta il nome del tuo computer, che dovrà essere cambiato opportunamente.

L'applicazione non richiede alcun tipo di login per usare le features al di fuori dell'area ristretta; per accedere al back office è necessario login con queste credenziali
username: admin
password: admin

# Tecnologie

Questo progetto è stato realizzato utilizzando le tecnologie di Microsoft [ASP.NET](https://dotnet.microsoft.com/en-us/apps/aspnet) Web Forms, [C#](https://learn.microsoft.com/en-us/dotnet/csharp/), e lo stile con la libreria di [Bootstrap](https://getbootstrap.com/).

# Funzionalità

L'applicazione permette di visualizzare prodotti e articoli relativi in base alla categoria, aggiungere e rimuovere oggetti dal carrello, proseguire al pagamento, accedere a un'area riservata che permette di aggiungere, rimuovere, o modificare prodotti dentro il database.

# Credits

Questo progetto è stato realizzato nell'arco di una settimana da Riccardo Antonini, Marco D'Imprima, Andrea Buzzanca, Matteo Falco e Marco Vitale, si ringrazia [EPICODE](https://epicode.com/) per averci dato l'opportunità di diventare sviluppatori web.
