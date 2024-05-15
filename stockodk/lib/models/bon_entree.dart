class BonEntree 
{
  int bonEntreeId;
  String dateDeCommande;
  String statut;
  int idUtilisateur;
  int idFournisseur; 

  // Constructeur de la classe
    BonEntree(this.bonEntreeId, this.dateDeCommande, this.statut, this.idUtilisateur, this.idFournisseur);
    static List<BonEntree> bon_entree = [];

  // Méthode pour ajouter un bon d'entrée à la liste
    static void ajouterBonEntree(bonEntreeId, dateDeCommande, statut, idUtilisateur, idFournisseur) 
    {
      bon_entree.add(BonEntree(bonEntreeId, dateDeCommande, statut, idUtilisateur, idFournisseur));
      // print("ajout effectuer avec succes");
    }

  // Méthode pour afficher tous les bons d'entrée
    static void afficherBonsEntree()
    {
      for (var bon in bon_entree)
      {
        print("Bon d'entrée ID : ${bon.bonEntreeId}, Date de commande : ${bon.dateDeCommande}, Statut : ${bon.statut}, ID utilisateur : ${bon.idUtilisateur},ID fournisseur : ${bon.idFournisseur}");
      }
    }
  // Méthode de recherche de bon d'entrée par son Id
   static void rechercherBonEntreeParId(int id) 
    {
      for (var bon in bon_entree) 
      {
        if (bon.bonEntreeId == id)
        {
          print("Bon d'entrée trouvé :");
          print("Bon d'entrée ID : ${bon.bonEntreeId} - Date de commande : ${bon.dateDeCommande} - Statut : ${bon.statut} - ID utilisateur : ${bon.idUtilisateur} - ID fournisseur : ${bon.idFournisseur}");
        }else{
          print("Ce bon d'entrée n'existe pas");
        }
      }
    
    }
 
}

