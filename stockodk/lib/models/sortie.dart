import 'dart:io';

import 'package:stockodk/models/produit.dart';
import 'package:stockodk/models/utilisateur.dart';

class BonSortie {
  static int _currentId = 1;
  int bonSortieId;
  String motif;
  DateTime? dateSortie;
  Utilisateur utilisateur;

  BonSortie({
    required this.motif,
    this.dateSortie,
    required this.utilisateur,
  }) : bonSortieId = _currentId++;

  @override
  String toString() {
    return 'BonSortie{id: $bonSortieId, motif: $motif, dateSortie: $dateSortie, utilisateur: $utilisateur}';
  }
}

class DetailsSortie {
  static int _currentId = 1;
  int detailsSortieId;
  int quantite;
  double prixTotal;
  DateTime? dateExpiration;
  BonSortie bonSortie;
  Produit produit;

  DetailsSortie({
    required this.quantite,
    required this.prixTotal,
    this.dateExpiration,
    required this.bonSortie,
    required this.produit,
  }) : detailsSortieId = _currentId++;

  @override
  String toString() {
    return 'DetailsSortie{id: $detailsSortieId, quantite: $quantite, prixTotal: $prixTotal, dateExpiration: $dateExpiration, bonSortie: $bonSortie, produit: $produit}';
  }
}

class GestionnaireSortie {
  List<BonSortie> bonSortieList = [];
  List<DetailsSortie> detailsSorties = [];
  List<Utilisateur> utilisateurs;
  List<Produit> listeProduits;

  GestionnaireSortie(this.listeProduits, this.utilisateurs);

  void creerBonEtDetailsSortie() {
    // Création du BonSortie
    print('Veuillez saisir les informations pour le nouveau BonSortie :');
    print('Motif :');
    var motif = stdin.readLineSync()!;
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

    var utilisateur = utilisateurs
        .firstWhere((user) => user.nomUtilisateur == nomUtilisateur);

    var nouveauBonSortie = BonSortie(
        motif: motif, utilisateur: utilisateur, dateSortie: DateTime.now());
    bonSortieList.add(nouveauBonSortie);

    // Création du DetailsSortie
    print("Entrez la quantité :");
    var quantite = int.parse(stdin.readLineSync()!);
    print("Entrez le prix total :");
    var prixTotal = double.parse(stdin.readLineSync()!);
    print("Entrez la date d'expiration (format: yyyy-MM-dd) :");
    var dateExpirationStr = stdin.readLineSync()!;
    DateTime? dateExpiration;
    if (dateExpirationStr.isNotEmpty) {
      dateExpiration = DateTime.parse(dateExpirationStr);
    }

    print("Entrez le nom du produit :");
    afficherProduit(listeProduits);
    var nomProduit = stdin.readLineSync()!;
    var produitExist =
        listeProduits.any((produit) => produit.nomProduit == nomProduit);
    if (!produitExist) {
      print("Erreur : le nom du produit saisi n'existe pas dans la liste.");
      return;
    }

    var produit =
        listeProduits.firstWhere((produit) => produit.nomProduit == nomProduit);
    if (produit.quantite_en_stock < quantite) {
      print("Erreur : La quantité disponible du produit est insuffisante.");
      return;
    }
    produit.quantite_en_stock -= quantite;

    var nouveauDetailsSortie = DetailsSortie(
      quantite: quantite,
      prixTotal: prixTotal,
      dateExpiration: dateExpiration,
      bonSortie: nouveauBonSortie,
      produit: produit,
    );
    detailsSorties.add(nouveauDetailsSortie);

    print("Bon de sortie et détail de sortie créés avec succès.");
    print(
        "Quantité mise à jour du produit '${produit.nomProduit}' : ${produit.quantite_en_stock}");
  }

  void afficherListeUtilisateurs() {
    for (var utilisateur in utilisateurs) {
      print('Utilisateur: ${utilisateur.nomUtilisateur}');
    }
  }

  void afficherListeProduits() {
    for (var produit in listeProduits) {
      print(produit);
    }
  }

  void afficherTousLesSorties() {
    if (detailsSorties.isEmpty) {
      print("Aucun Sortie d'entrée disponible.");
    } else {
      for (var sortie in detailsSorties) {
        print(sortie);
      }
    }
  }

  void modifierBonEtDetailsSortie() {
    print('Entrez l\'ID du BonSortie à modifier :');
    var idBonSortie = int.parse(stdin.readLineSync()!);
    var bonSortie = bonSortieList.firstWhere(
        (bon) => bon.bonSortieId == idBonSortie,
        orElse: () => throw Exception('ID non trouvé'));

    print('Que souhaitez-vous modifier ?');
    print('1. Motif');
    print('2. Utilisateur');
    var choix = int.parse(stdin.readLineSync()!);

    switch (choix) {
      case 1:
        print('Nouveau motif :');
        bonSortie.motif = stdin.readLineSync()!;
        break;
      case 2:
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
        bonSortie.utilisateur = utilisateurs
            .firstWhere((user) => user.nomUtilisateur == nomUtilisateur);
        break;
      default:
        print("Choix invalide.");
        return;
    }

    print('BonSortie modifié avec succès.');
    print(bonSortie);

    print('Souhaitez-vous modifier les détails de sortie associés ? (oui/non)');
    var reponse = stdin.readLineSync()!;
    if (reponse.toLowerCase() == 'oui') {
      var detailsAssocies = detailsSorties
          .where((details) => details.bonSortie.bonSortieId == idBonSortie)
          .toList();
      for (var details in detailsAssocies) {
        print(
            'Modification pour DetailsSortie ID ${details.detailsSortieId} :');
        print('1. Quantité');
        print('2. Prix Total');
        print('3. Date d\'expiration');
        print('4. Produit');
        var choixDetail = int.parse(stdin.readLineSync()!);

        switch (choixDetail) {
          case 1:
            print('Nouvelle quantité :');
            details.quantite = int.parse(stdin.readLineSync()!);
            break;
          case 2:
            print('Nouveau prix total :');
            details.prixTotal = double.parse(stdin.readLineSync()!);
            break;
          case 3:
            print('Nouvelle date d\'expiration (format: yyyy-MM-dd) :');
            var dateExpirationStr = stdin.readLineSync()!;
            if (dateExpirationStr.isNotEmpty) {
              details.dateExpiration = DateTime.parse(dateExpirationStr);
            }
            break;
          case 4:
            print('Nom du produit :');
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
            if (produit.quantite_en_stock < details.quantite) {
              print(
                  "Erreur : La quantité disponible du produit est insuffisante.");
              return;
            }
            // Restaurer la quantité précédente avant la modification
            produit.quantite_en_stock += details.quantite;
            details.produit = produit;
            // Mettre à jour la quantité du produit après la modification
            produit.quantite_en_stock -= details.quantite;
            break;
          default:
            print("Choix invalide.");
            break;
        }
        print('DetailsSortie modifié avec succès.');
        print(details);
      }
    }
  }

  void supprimerBonEtDetailsSortie(int idBon) {
    var bonASupprimer = bonSortieList.firstWhere(
        (bon) => bon.bonSortieId == idBon,
        orElse: () => throw Exception("Id non trouve"));
    // ignore: unnecessary_null_comparison
    if (bonASupprimer != null) {
      bonSortieList.removeWhere((bon) => bon.bonSortieId == idBon);
      detailsSorties.removeWhere((details) => details.detailsSortieId == idBon);
      print("Bon de sortie et détails associés supprimés avec succès.");
    } else {
      print("Aucun bon de sortie trouvé avec l'ID $idBon.");
    }
  }
}

// void main() {
//   // Initialiser des exemples d'utilisateurs et de produits
//   var utilisateurs = [
//     Utilisateur('Alice'),
//     Utilisateur('Bob'),
//   ];

//   var produits = [
//     Produit('Produit1', 100),
//     Produit('Produit2', 200),
//   ];
// }
