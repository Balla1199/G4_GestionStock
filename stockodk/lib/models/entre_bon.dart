import 'dart:io';

import 'package:stockodk/models/fournisseur.dart';

import 'utilisateur.dart';
import 'bon_entree.dart';

class EntreBon {
// Méthode d'ajout des utilisateurs
  void ajouterUtilisateur() {
    print("Donnez l'ID de l'utilisateur");
    String? utilisateurIdEnChaine = stdin.readLineSync() ?? "";
    int? utilisateurId = int.tryParse(utilisateurIdEnChaine);

    print("Donnez le nom d'utilisateur de l'utilisateur");
    String? nomUtilisateur = stdin.readLineSync() ?? "";

    print("Donnez le contact de l'utilisateur");
    String? contact = stdin.readLineSync() ?? "";

    print("Donnez le pseudo de l'utilisateur");
    String? pseudo = stdin.readLineSync() ?? "";

    print("Donnez le mot de passe de l'utilisateur");
    String? motDePasse = stdin.readLineSync() ?? "";
    String? roleProvisoir;
    int? roleProvisoirEntier;

    do {
      print(
          "Quel est le rôle de l'utilisateur en chiffre (1: administrateur, 2: manager, 3: vendeur) : ");
      String? roleProvisoir = stdin.readLineSync();
      roleProvisoirEntier = int.tryParse(roleProvisoir ?? "");
    } while (roleProvisoirEntier == null ||
        !(roleProvisoirEntier >= 1 && roleProvisoirEntier <= 3));
    switch (roleProvisoirEntier) {
      case 1:
        Utilisateur utilisateur = Utilisateur(utilisateurId, nomUtilisateur,
            contact, pseudo, motDePasse, Role.administrateur);
        utilisateurs.add(utilisateur);
        break;
      case 2:
        Utilisateur utilisateur = Utilisateur(utilisateurId, nomUtilisateur,
            contact, pseudo, motDePasse, Role.manager);
        utilisateurs.add(utilisateur);
        break;
      default:
        Utilisateur utilisateur = Utilisateur(utilisateurId, nomUtilisateur,
            contact, pseudo, motDePasse, Role.vendeur);
        utilisateurs.add(utilisateur);
    }
  }

// Méthode de suppression des utilisateurs
  void supprimerUtilisateur(int userId) {
    utilisateurs.removeWhere((element) => element.utilisateurId == userId);
    print("Utilisateur supprimer avec succès");
  }

// Méthode d'affichage des utilisateurs
  void afficherUtilisateurs() {
    for (var utilisateur in utilisateurs) {
      print(
          '---------------------------------------------------------------------------');
      print(
          'ID: ${utilisateur.utilisateurId} Nom: ${utilisateur.nomUtilisateur} Contact: ${utilisateur.contact} Pseudo: ${utilisateur.pseudo} Mot de passe: ${utilisateur.motDePasse}');
      print(
          '---------------------------------------------------------------------------');
    }
  }

  // Méthode de modification des utilisateurs
  void modifierUtilisateur(int? utilisateurId) {
    for (var utilisateur in utilisateurs) {
      if (utilisateur.utilisateurId == utilisateurId) {
        print("Que souhaitez vous modifier : ");
        print(
            "1:Nom de l'utilisateur | 2: Contact | 3: Pseudo 4: Mot de passe");
        String? modifier = stdin.readLineSync();
        int? modifierEntier = int.tryParse(modifier ?? "");
        if (modifierEntier == 1) {
          print("Donner le nouveau Nom ");
          String NomNouveau = stdin.readLineSync() ?? "";
          utilisateur.nomUtilisateur = NomNouveau;
        } else if (modifierEntier == 2) {
          print("Donner le nouveau Contact ");
          String? nouveauContact = stdin.readLineSync();
          utilisateur.contact = nouveauContact;
        } else if (modifierEntier == 3) {
          print("Donner le nouveau Pseudo ");
          String nouveauPseudo = stdin.readLineSync() ?? "";
          utilisateur.pseudo = nouveauPseudo;
        } else if (modifierEntier == 4) {
          print("Donner le nouveau mot de passe ");
          String? nouveauMotDePasse = stdin.readLineSync();
          utilisateur.motDePasse = nouveauMotDePasse;
        }
      } else {
        print("Entrer un ID valide !");
      }
    }
  }

// Méthode de recherche par nom des utilisateurs
  void rechercherParNom(String nom) {
    bool utilisateurTrouve = false;

    for (var utilisateur in utilisateurs) {
      if (utilisateur.nomUtilisateur.toLowerCase() == nom.toLowerCase()) {
        print("Nom trouvé :");
        print(
            '-------------------------------------------------------------------------------------------------');
        print(
            'ID: ${utilisateur.utilisateurId} Nom: ${utilisateur.nomUtilisateur} Contact: ${utilisateur.contact} Pseudo: ${utilisateur.pseudo} Mot de passe: ${utilisateur.motDePasse}');
        print(
            '-------------------------------------------------------------------------------------------------');
        utilisateurTrouve = true;
        break;
      }
    }

    if (!utilisateurTrouve) {
      print("Cet nom n'existe pas");
    }
  }

// Méthode de recherche par pseudo des utilisateurs
  void rechercherParPseudo(String pseudoR) {
    bool utilisateurTrouve = false;

    for (var utilisateur in utilisateurs) {
      if (utilisateur.pseudo.toLowerCase() == pseudoR.toLowerCase()) {
        print("Pseudo trouvé :");
        print(
            '-------------------------------------------------------------------------------------------------');
        print(
            'ID: ${utilisateur.utilisateurId} Nom: ${utilisateur.nomUtilisateur} Contact: ${utilisateur.contact} Pseudo: ${utilisateur.pseudo} Mot de passe: ${utilisateur.motDePasse}');
        print(
            '-------------------------------------------------------------------------------------------------');
        utilisateurTrouve = true;
        break;
      }
    }

    if (!utilisateurTrouve) {
      print("Cet pseudo n'existe pas");
    }
  }

  void afficherListeUtilisateurs(List<Utilisateur> utilisateurs) {
    print('Liste des utilisateurs :');
    utilisateurs.forEach((user) {
      print('${user.utilisateurId}: ${user.nomUtilisateur}');
    });
  }

//BonEntre
  List<BonEntree> bonEntreeList = [];
  var gestFourni = Fournisseur();
  void ajouterBonEntree(List<Utilisateur> utilisateurs) {
    // Demander à l'utilisateur de saisir les informations pour la nouvelle BonEntre
    print('Veuillez saisir les informations pour la nouvelle BonEntre :');
    print('ID de la BonEntre :');
    var bonEntreeId = int.parse(stdin.readLineSync()!);
    print('Date de commande :');
    var dateDeCommande = stdin.readLineSync()!;
    print('Statut :');
    var statut = stdin.readLineSync()!;
    afficherListeUtilisateurs(utilisateurs);
    print('Nom de l\'utilisateur :');
    var nomUtilisateur = stdin.readLineSync()!;
// Vérifier si le nom d'utilisateur saisi existe dans la liste des utilisateurs
    var utilisateurExist =
        utilisateurs.any((user) => user.nomUtilisateur == nomUtilisateur);
    if (!utilisateurExist) {
      print(
          'Erreur : Le nom d\'utilisateur saisi n\'existe pas dans la liste des utilisateurs.');
      return;
    }
    print('ID du fournisseur :');
    var fournisseurId = int.parse(stdin.readLineSync()!);

    // Récupérer l'utilisateur correspondant au nom saisi
    var utilisateur = utilisateurs
        .firstWhere((user) => user.nomUtilisateur == nomUtilisateur);

    // Créer la BonEntre avec les informations saisies
    var nouvelleBonEntree = BonEntree(
        bonEntreeId, dateDeCommande, statut, utilisateur, fournisseurId);

    // Ajouter la BonEntre à la liste des bons d'entrée
    bonEntreeList.add(nouvelleBonEntree);

    print('La BonEntre a été ajoutée avec succès.');
    // Ajout du bon d'entrée
    // _BonEntree.add(this);
    // var nouveauBonEntree = BonEntree(
    //     _nextId++,
    //     dateDeCommande,
    //     statut,
    //     utilisateur;
    // _bonEntreeList.add(nouveauBonEntree);
  }

  // void afficherBonsEntree() {
  //   for (var bon in _bonEntreeList) {
  //     print(bon);
  //   }
  // }

  // void modifierBonEntree(int id,
  //     {String? dateDeCommande,
  //     String? statut,
  //     int? utilisateurId,
  //     int? fournisseurId}) {
  //   var bon = _bonEntreeList.firstWhere((b) => b.bonEntreeId == id,
  //       orElse: () => throw Exception('Bon d\'entrée non trouvé'));
  //   if (dateDeCommande != null) bon.dateDeCommande = dateDeCommande;
  //   if (statut != null) bon.statut = statut;
  //   if (utilisateurId != null) bon.utilisateurId = utilisateurId;
  //   if (fournisseurId != null) bon.fournisseurId = fournisseurId;
  //   print('Bon d\'entrée modifié avec succès: $bon');
  // }

  // void supprimerBonEntree(int id) {
  //   _bonEntreeList.removeWhere((b) => b.bonEntreeId == id);
  //   print('Bon d\'entrée supprimé avec succès');
  // }

  // BonEntree rechercherBonEntreeParId(int id) {
  //   try {
  //     return _bonEntreeList.firstWhere((bon) => bon.bonEntreeId == id);
  //   } catch (e) {
  //     throw Exception('Bon d\'entrée non trouvé pour l\'ID: $id');
  //   }
  // }
}
