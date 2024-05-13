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

  void ajouterFournisseur(Fournisseur nouveauFournisseur) {
    fournisseurs.add(nouveauFournisseur);
    print(
        'Nouveau fournisseur : ${nouveauFournisseur.nom}, ${nouveauFournisseur.adresse}, ${nouveauFournisseur.telephone}');
  }

  //aficher
  void afficherFournisseur() {
    for (var fournisseur in fournisseurs) {
      print(
          " ID: ${fournisseur.fournisseurId}, Nom: ${fournisseur.nom}, Adresse: ${fournisseur.adresse}, telephone: ${fournisseur.telephone}");
    }
  }
  // Autres méthodes pour gérer les fournisseurs...

  modifierFournisseur(int fournisseurId, String nouveauNom,
      String nouvelleAdresse, String nouveauTelephone) {
    var fournisseur = fournisseurs.firstWhere(
        (f) => f.fournisseurId == fournisseurId,
        orElse: () => Fournisseur(
            fournisseurId: fournisseurId,
            nom: "",
            adresse: "",
            telephone:
                "")); // Utilisez un fournisseur par défaut ou lancez une exception si nécessaire
    fournisseur.nom = nouveauNom;
    fournisseur.adresse = nouvelleAdresse;
    fournisseur.telephone = nouveauTelephone;
    print(
        'Mis à jour Fournisseur: ${fournisseur.nom}, ${fournisseur.adresse}, ${fournisseur.telephone}');
  }

  void ListeDesFournisseurAfterModify(Fournisseur nouveauFournisseur) {
    fournisseurs.add(nouveauFournisseur);
    print(
        'Liste des fournisseurs après modification : ${nouveauFournisseur.nom}, ${nouveauFournisseur.adresse},  ${nouveauFournisseur.telephone}');
  }

  void supprimerFournisseur(int fournisseurId) {
    fournisseurs.removeWhere((f) => f.fournisseurId == fournisseurId);
    print("Suppression effectue avec succes ");
   
  }

  List<Fournisseur> rechercherFournisseursParNom(String nom) {
    return fournisseurs.where((fournisseur) => fournisseur.nom == nom).toList();
  }

  
}
