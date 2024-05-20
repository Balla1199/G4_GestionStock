import 'dart:io';

class AutoIncrement {
  static int _currentId = 1;

  static int get nextId => _currentId++;
}

class Fournisseur {
  int fournisseurId;
  String nom;
  String adresse;
  String telephone;

  // Constructeur
  Fournisseur(this.nom, this.adresse, this.telephone)
      : fournisseurId = AutoIncrement.nextId;
}

List<Fournisseur> fournisseursList = [];
void afficherFournisseur(List<Fournisseur> fournisseursList) {
  print('Liste des fournisseurs :');
  for (var fourni in fournisseursList) {
    print('${fourni.fournisseurId}: ${fourni.nom}');
  }
}

void ajouterFournisseur() {
  print("Entrez le nom du fournisseur :");
  String nom = stdin.readLineSync()!;
  print("Entrez l'adresse du fournisseur :");
  String adresseFournisseur = stdin.readLineSync()!;
  print("Entrez le contact du fournisseur :");
  String contactFournisseur = stdin.readLineSync()!;

  var fournisseurExist = fournisseursList.any((fourni) => fourni.nom == nom);
  if (fournisseurExist) {
    print("Erreur : Le fournisseur avec ce nom existe déjà.");
    return;
  }

  Fournisseur nouveauFournisseur =
      Fournisseur(nom, adresseFournisseur, contactFournisseur);
  fournisseursList.add(nouveauFournisseur);
  print("Fournisseur ajouté avec succès : ");
}

void modifierFournisseur(int id) {
  var fournisseur = fournisseursList.firstWhere((f) => f.fournisseurId == id,
      orElse: () => throw Exception('Pas de fournisseur pour ce ID'));
  print("Que souhaitez-vous modifier ?");
  print("1. Nom");
  print("2. Adresse");
  print("3. Contact");
  print("4. Tout");

  int choix = int.parse(stdin.readLineSync()!);

  switch (choix) {
    case 1:
      print("Entrez le nouveau nom du fournisseur :");
      fournisseur.nom = stdin.readLineSync()!;
      break;
    case 2:
      print("Entrez la nouvelle adresse du fournisseur :");
      fournisseur.adresse = stdin.readLineSync()!;
      break;
    case 3:
      print("Entrez le nouveau contact du fournisseur :");
      fournisseur.adresse = stdin.readLineSync()!;
      break;
    case 4:
      print("Entrez le nouveau nom du fournisseur :");
      fournisseur.nom = stdin.readLineSync()!;
      print("Entrez la nouvelle adresse du fournisseur :");
      fournisseur.adresse = stdin.readLineSync()!;
      print("Entrez le nouveau contact du fournisseur :");
      fournisseur.adresse = stdin.readLineSync()!;
      break;
    default:
      print("Choix invalide.");
      return;
  }
  print("le Fournisseur ${fournisseur.nom} a ete modifié avec succès");
}

Fournisseur rechercherFournisseurParNom(String nom) {
  var fournisseur = fournisseursList.firstWhere((f) => f.nom == nom,
      orElse: () => throw Exception('id non trouve'));
  print("Fournisseur trouvé : ${fournisseur.nom}");
  return fournisseur;
}

void supprimerFournisseurParNom(String nom) {
  var fournisseur = fournisseursList.firstWhere((f) => f.nom == nom,
      orElse: () => throw Exception('ID non trouvé'));

  // ignore: unnecessary_null_comparison
  if (fournisseur != null) {
    fournisseursList.removeWhere((f) => f.nom == nom);
    print("Fournisseur supprimé avec succès : ${fournisseur.nom}");
    print("Voici la liste de vos fournisseurs actuels");
    afficherFournisseur(fournisseursList);
  } else {
    print("Fournisseur non trouvé avec le nom $nom.");
  }
}

void afficherFournisseurs() {
  if (fournisseursList.isEmpty) {
    print("Aucun fournisseur disponible.");
  } else {
    for (var fournisseur in fournisseursList) {
      print(fournisseur);
    }
  }
}

// void ajouterFournisseur(Fournisseur fournisseur) {
//   fournisseursList.add(fournisseur);
// }

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
