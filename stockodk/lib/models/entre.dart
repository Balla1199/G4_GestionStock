import 'dart:io';

import 'package:stockodk/models/fournisseur.dart';
import 'package:stockodk/models/produit.dart';
import 'package:stockodk/models/utilisateur.dart';

class BonEntree {
  static int _currentId = 1;
  int bonEntreeId;
  String dateDeCommande;
  String statut;
  Utilisateur utilisateur;
  Fournisseur fournisseur;

  BonEntree(
    this.dateDeCommande,
    this.statut,
    this.utilisateur,
    this.fournisseur,
  ) : bonEntreeId = _currentId++;

  @override
  String toString() {
    return 'BonEntree{id: $bonEntreeId, dateDeCommande: $dateDeCommande, statut: $statut, utilisateur: ${utilisateur.nomUtilisateur}, fournisseur: ${fournisseur.nom}}';
  }
}

class DetailsEntree {
  static int _currentId = 1;
  int id;
  int quantite;
  double prixTotal;
  Produit produit;
  BonEntree bonEntree;

  DetailsEntree(this.quantite, this.prixTotal, this.produit, this.bonEntree)
      : id = _currentId++;

  @override
  String toString() {
    return 'DetailsEntree{id: $id, quantite: $quantite, prixTotal: $prixTotal, produit: ${produit.nomProduit}, bonEntree: ${bonEntree.bonEntreeId}}';
  }
}

List<BonEntree> bonEntreeList = [];
List<DetailsEntree> detailsEntrees = [];

class GestionnaireEntre {
  List<BonEntree> bonEntreeList;
  List<DetailsEntree> detailsEntrees;
  List<Produit> listeProduits;
  List<Fournisseur> fournisseurs;
  List<Utilisateur> utilisateurs;

  GestionnaireEntre(this.bonEntreeList, this.detailsEntrees, this.listeProduits,
      this.utilisateurs, this.fournisseurs);
  void creerBonEtDetailsEntree() {
    // Création du BonEntree
    print('Veuillez saisir les informations pour le nouveau BonEntree :');
    print('Date de commande :');
    var dateDeCommande = stdin.readLineSync()!;
    print('Statut :');
    var statut = stdin.readLineSync()!;

    print('Nom de l\'utilisateur :');
    afficherListeUtilisateurs();
    var nomUtilisateur = stdin.readLineSync()!;
    var utilisateurExist =
        utilisateurs.any((user) => user.nomUtilisateur == nomUtilisateur);
    if (!utilisateurExist) {
      print(
          'Erreur : Le nom d\'utilisateur saisi n\'existe pas dans la liste des utilisateurs.');
      return;
    }

    print('Nom du fournisseur :');
    afficherListeFournisseurs();
    var nomFournisseur = stdin.readLineSync()!;
    var fournisseurExist =
        fournisseurs.any((fourni) => fourni.nom == nomFournisseur);
    if (!fournisseurExist) {
      print("Erreur : le nom du fournisseur saisi n'existe pas dans la liste.");
      return;
    }

    var utilisateur = utilisateurs
        .firstWhere((user) => user.nomUtilisateur == nomUtilisateur);
    var fournisseur =
        fournisseurs.firstWhere((fourni) => fourni.nom == nomFournisseur);

    var nouvelleBonEntree =
        BonEntree(dateDeCommande, statut, utilisateur, fournisseur);
    bonEntreeList.add(nouvelleBonEntree);

    // Création du DetailsEntree
    print("Entrez la quantité :");
    var quantite = int.parse(stdin.readLineSync()!);
    print("Entrez le prix total :");
    var prixTotal = double.parse(stdin.readLineSync()!);

    print("Entrez le nom du produit :");
    afficherListeProduits();
    var nomProduit = stdin.readLineSync()!;
    var produitExist =
        listeProduits.any((produit) => produit.nomProduit == nomProduit);
    if (!produitExist) {
      print("Erreur : le nom du produit saisi n'existe pas dans la liste.");
      return;
    }

    var produit =
        listeProduits.firstWhere((produit) => produit.nomProduit == nomProduit);
    produit.quantite_en_stock += quantite;

    var nouveauDetailsEntree =
        DetailsEntree(quantite, prixTotal, produit, nouvelleBonEntree);
    detailsEntrees.add(nouveauDetailsEntree);

    print("Bon d'entrée et détail d'entrée créés avec succès.");
    print(
        "Quantité mise à jour du produit '${produit.nomProduit}' : ${produit.quantite_en_stock}");
  }

//Modifier
  void modifierBonEtDetailsEntree() {
    print('Entrez l\'ID du BonEntree à modifier :');
    var idBonEntree = int.parse(stdin.readLineSync()!);
    var bonEntree = bonEntreeList.firstWhere(
        (bon) => bon.bonEntreeId == idBonEntree,
        orElse: () => throw Exception('ID non trouvé'));

    print('Que souhaitez-vous modifier ?');
    print('1. Date de commande');
    print('2. Statut');
    print('3. Utilisateur');
    print('4. Fournisseur');
    var choix = int.parse(stdin.readLineSync()!);

    switch (choix) {
      case 1:
        print('Nouvelle date de commande :');
        bonEntree.dateDeCommande = stdin.readLineSync()!;
        break;
      case 2:
        print('Nouveau statut :');
        bonEntree.statut = stdin.readLineSync()!;
        break;
      case 3:
        print('Nom de l\'utilisateur :');
        afficherListeUtilisateurs();
        var nomUtilisateur = stdin.readLineSync()!;
        var utilisateurExist =
            utilisateurs.any((user) => user.nomUtilisateur == nomUtilisateur);
        if (!utilisateurExist) {
          print(
              'Erreur : Le nom d\'utilisateur saisi n\'existe pas dans la liste des utilisateurs.');
          return;
        }
        bonEntree.utilisateur = utilisateurs
            .firstWhere((user) => user.nomUtilisateur == nomUtilisateur);
        break;
      case 4:
        print('Nom du fournisseur :');
        afficherListeFournisseurs();
        var nomFournisseur = stdin.readLineSync()!;
        var fournisseurExist =
            fournisseurs.any((fourni) => fourni.nom == nomFournisseur);
        if (!fournisseurExist) {
          print(
              "Erreur : le nom du fournisseur saisi n'existe pas dans la liste.");
          return;
        }
        bonEntree.fournisseur =
            fournisseurs.firstWhere((fourni) => fourni.nom == nomFournisseur);
        break;
      default:
        print("Choix invalide.");
        return;
    }

    print('BonEntree modifié avec succès.');
    print(bonEntree);

    print('Souhaitez-vous modifier les détails d\'entrée associés ? (oui/non)');
    var reponse = stdin.readLineSync()!;
    if (reponse.toLowerCase() == 'oui') {
      var detailsAssocies = detailsEntrees
          .where((details) => details.bonEntree.bonEntreeId == idBonEntree)
          .toList();
      for (var details in detailsAssocies) {
        print('Modification pour DetailsEntree ID ${details.id} :');
        print('1. Quantité');
        print('2. Prix Total');
        print('3. Produit');
        var choixDetail = int.parse(stdin.readLineSync()!);

        switch (choixDetail) {
          case 1:
            print('Nouvelle quantité :');
            var ancienneQuantite = details.quantite;
            details.quantite = int.parse(stdin.readLineSync()!);
            details.produit.quantite_en_stock +=
                (details.quantite - ancienneQuantite);
            break;
          case 2:
            print('Nouveau prix total :');
            details.prixTotal = double.parse(stdin.readLineSync()!);
            break;
          case 3:
            print('Nom du nouveau produit :');
            afficherListeProduits();
            var nomProduit = stdin.readLineSync()!;
            var produitExist = listeProduits
                .any((produit) => produit.nomProduit == nomProduit);
            if (!produitExist) {
              print(
                  "Erreur : le nom du produit saisi n'existe pas dans la liste.");
              return;
            }
            var produit = listeProduits
                .firstWhere((produit) => produit.nomProduit == nomProduit);
            details.produit.quantite_en_stock -= details.quantite;
            details.produit = produit;
            details.produit.quantite_en_stock += details.quantite;
            break;
          default:
            print("Choix invalide.");
            return;
        }
        print('DetailsEntree modifié avec succès.');
        print(details);
      }
    }
  }

  void afficherListeUtilisateurs() {
    for (var utilisateur in utilisateurs) {
      print('Utilisateur: ${utilisateur.nomUtilisateur}');
    }
  }

//afficherfournisseur
  void afficherListeFournisseurs() {
    for (var fournisseur in fournisseurs) {
      print('Fournisseur: ${fournisseur.nom}');
    }
  }

//ListePrduits
  void afficherListeProduits() {
    for (var produit in listeProduits) {
      print(
          'Produit: ${produit.nomProduit}, Quantité: ${produit.quantite_en_stock}');
    }
  }

//afficher
  void afficherBonsEtDetailsEntree() {
    if (bonEntreeList.isEmpty) {
      print("Aucun bon d'entrée disponible.");
    } else {
      for (var bonEntree in bonEntreeList) {
        print(bonEntree);
        var details = detailsEntrees
            .where((detail) =>
                detail.bonEntree.bonEntreeId == bonEntree.bonEntreeId)
            .toList();
        for (var detail in details) {
          print('  - $detail');
        }
      }
    }
  }

  void afficherTousLesDetailsEntree() {
    if (detailsEntrees.isEmpty) {
      print("Aucun détail d'entrée disponible.");
    } else {
      for (var detailsEntree in detailsEntrees) {
        print(detailsEntree);
      }
    }
  }

  void supprimerBonEtDetailsEntree(int idBon) {
    var bonASupprimer = bonEntreeList.firstWhere(
        (bon) => bon.bonEntreeId == idBon,
        orElse: () => throw Exception('ID non Trouve'));
    // ignore: unnecessary_null_comparison
    if (bonASupprimer != null) {
      bonEntreeList.removeWhere((bon) => bon.bonEntreeId == idBon);
      detailsEntrees.removeWhere((details) => details.id == idBon);
      print("Bon d'entrée et détails associés supprimés avec succès.");
    } else {
      print("Aucun bon d'entrée trouvé avec l'ID $idBon.");
    }
  }
}
