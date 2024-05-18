class Fournisseur {
  int fournisseurId;
  String nom;
  String adresse;
  String telephone;

  // Constructeur
  Fournisseur(this.fournisseurId, this.nom, this.adresse, this.telephone);
}

List<Fournisseur> fournisseursList = [];
void afficherFournisseur(List<Fournisseur> fournisseursList) {
  print('Liste des fournisseurs :');
  for (var fourni in fournisseursList) {
    print('${fourni.fournisseurId}: ${fourni.nom}');
  }
}

void ajouterFournisseur(Fournisseur fournisseur) {
  fournisseursList.add(fournisseur);
}

//aficher
// void afficherFournisseur() {
//   fournisseurs.forEach((f) {
//     print(
//         'ID: ${f.fournisseurId}, Nom: ${f.nom}, Adresse: ${f.adresse}, Téléphone: ${f.telephone}');
//   });
// }
// // Autres méthodes pour gérer les fournisseurs...

// modifierFournisseur(int Id, String nouveauNom, String nouvelleAdresse,
//     String nouveauTelephone) {
//   var fournisseur = fournisseurs.firstWhere((f) => f.fournisseurId == Id,
//       orElse: () => Fournisseur(
//           fournisseurId: Id,
//           nom: "",
//           adresse: "",
//           telephone:
//               "")); // Utilisez un fournisseur par défaut ou lancez une exception si nécessaire
//   fournisseur.nom = nouveauNom;
//   fournisseur.adresse = nouvelleAdresse;
//   fournisseur.telephone = nouveauTelephone;
//   print(
//       'Fournisseur modifié: ID=$Id, Nom=$nouveauNom, Adresse=$nouvelleAdresse, Téléphone=$nouveauTelephone');
// }

// void supprimerFournisseur(int id) {
//   fournisseurs.removeWhere((f) => f.fournisseurId == id);
//   print('Fournisseur supprimé: ID=$id');
// }

// Fournisseur? rechercherFournisseurParNom(String nom) {
//   try {
//     return fournisseurs
//         .firstWhere((f) => f.nom.toLowerCase() == nom.toLowerCase());
//   } catch (e) {
//     return null; // Fournisseur non trouvé
//   }
// }
