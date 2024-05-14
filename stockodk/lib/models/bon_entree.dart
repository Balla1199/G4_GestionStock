class BonEntree 
{
  int bonEntreeId;
  String dateDeCommande;
  String statut;
  int idUtilisateur;
  int idFournisseur;

  // Liste pour stocker les bons d'entrée
    static List<BonEntree> bonsEntree = [];

  // Constructeur de la classe
    BonEntree(this.bonEntreeId, this.dateDeCommande, this.statut, this.idUtilisateur, this.idFournisseur);

  // Méthode pour ajouter un bon d'entrée à la liste
    void ajouterBonEntree() 
    {
      bonsEntree.add(this);
    }

  // Méthode pour afficher tous les bons d'entrée
    static void afficherBonsEntree()
    {
      for (var bon in bonsEntree)
      {
        print("Bon d'entrée ID : ${bon.bonEntreeId}");
        print("Date de commande : ${bon.dateDeCommande}");
        print("Statut : ${bon.statut}");
        print("ID utilisateur : ${bon.idUtilisateur}");
        print("ID fournisseur : ${bon.idFournisseur}");
        print('---');
      }
    }
  // Méthode de recherche de bon d'entrée par son Id
   static void rechercherBonEntreeParId(int id) 
    {
      for (var bon in bonsEntree) 
      {
        if (bon.bonEntreeId == id)
        {
          print("Bon d'entrée trouvé :");
          print("Bon d'entrée ID : ${bon.bonEntreeId}");
          print("Date de commande : ${bon.dateDeCommande}");
          print("Statut : ${bon.statut}");
          print("ID utilisateur : ${bon.idUtilisateur}");
          print("ID fournisseur : ${bon.idFournisseur}");
        }
      }
    
    }
 
}

