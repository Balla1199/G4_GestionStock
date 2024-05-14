class BonEntree {
  // Déclaration des différentes attributs
  int bonEntreeId = 0;
  String dateDeCommande = "";
  String statut = "";
  int idUtilisateur = 0;
  int idFournisseur = 0;

  // Initialisation du bon d'entrée (Création du bon d'entrée)
  BonEntree(this.bonEntreeId, this.dateDeCommande, this.statut, this.idUtilisateur, this.idFournisseur);

  // Méthode pour modifier les détails du bon d'entrée
  void modifierBonEntree(int bonEntreeId, String dateDeCommande, String statut, int idUtilisateur, int idFournisseur) {
    this.bonEntreeId = bonEntreeId;
    this.dateDeCommande = dateDeCommande;
    this.statut = statut;
    this.idUtilisateur = idUtilisateur;
    this.idFournisseur = idFournisseur;
  }

// Méthode pour obtenir les attributs sous forme de liste
  List<dynamic> liste() {
    return [bonEntreeId, dateDeCommande, statut, idUtilisateur, idFournisseur];
  }
  
   @override
  String toString() {
    return 'BonEntree {Id: $bonEntreeId, Date: $dateDeCommande, Statut: $statut, IdUtilisateur: $idUtilisateur, iDFournisseur: $idFournisseur}';
  
}
}