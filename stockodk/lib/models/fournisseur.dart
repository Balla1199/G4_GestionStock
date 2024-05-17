class Fournisseur {
  int fournisseurId;
  String nom;
  String adresse;
  String telephone;

  // Constructeur
  Fournisseur(
      {required this.fournisseurId,
      required this.nom,
      required this.adresse,
      required this.telephone});
}

List<Fournisseur> fournisseurs = [];

class GestionFournisseurs {
  List<Fournisseur> fournisseurs = []; // Liste de fournisseurs

     void ajouterFournisseur(Fournisseur fournisseur) {
    fournisseurs.add(fournisseur);
  }
  
  //aficher
  void afficherFournisseur() {
    fournisseurs.forEach((f) {
      print('ID: ${f.fournisseurId}, Nom: ${f.nom}, Adresse: ${f.adresse}, Téléphone: ${f.telephone}');
    });
  }
  // Autres méthodes pour gérer les fournisseurs...

  modifierFournisseur(int Id, String nouveauNom, String nouvelleAdresse, String nouveauTelephone) {
    var fournisseur = fournisseurs.firstWhere(
        (f) => f.fournisseurId == Id, orElse: () => Fournisseur(
            fournisseurId: Id,
            nom: "",
            adresse: "",
            telephone: "")); // Utilisez un fournisseur par défaut ou lancez une exception si nécessaire
    fournisseur.nom = nouveauNom;
    fournisseur.adresse = nouvelleAdresse;
    fournisseur.telephone = nouveauTelephone;
    print('Fournisseur modifié: ID=$Id, Nom=$nouveauNom, Adresse=$nouvelleAdresse, Téléphone=$nouveauTelephone');
  }
  
  void supprimerFournisseur(int id) {
    fournisseurs.removeWhere((f) => f.fournisseurId == id);
    print('Fournisseur supprimé: ID=$id');
  }

  Fournisseur? rechercherFournisseurParNom(String nom) {
    try {
      return fournisseurs.firstWhere((f) => f.nom.toLowerCase() == nom.toLowerCase());
    } catch (e) {
      return null; // Fournisseur non trouvé
    }
  }
}