// import 'dart:convert';
import 'dart:io';

import 'package:stockodk/models/entre.dart';
import 'package:stockodk/models/fournisseur.dart';
import 'package:stockodk/models/produit.dart';
import 'package:stockodk/models/sortie.dart';
import 'package:stockodk/models/utilisateur.dart';

void main() {
  utilisateurs = [
    Utilisateur(1, "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou",
        "password", Role.administrateur),
    Utilisateur(
        2, "Atou Carter", "atou@gmail.com", "atou", "password", Role.manager),
    Utilisateur(3, "Moussa Goita", "moussa@gmail.com", "moussa", "password",
        Role.vendeur)
  ];
  fournisseursList = [
    Fournisseur("nomFounisseur", "adreesseF", "TELFounrni C"),
    Fournisseur("nomFounisseur2", "adreesseF", "TELFounrni C"),
    Fournisseur("nomFounisseur3", "adreesseF", "TELFounrni C")
  ];
  listeProduits = [
    Produit("Sac", "desc", 122, 0),
    Produit("pc", "desc", 12, 3),
  ];
  bonEntreeList = [
    BonEntree(
      "20233",
      "encours",
      Utilisateur(1, "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou",
          "password", Role.administrateur),
      Fournisseur("nomFounisseur", "adreesseF", "TELFounrni C"),
    ),
    BonEntree(
      "2012-23-35",
      "Termine",
      Utilisateur(
          2, "Atou Carter", "atou@gmail.com", "atou", "password", Role.manager),
      Fournisseur("nomFounisseur3", "adreesseF", "TELFounrni C"),
    )
  ];
  detailsEntrees = [
    DetailsEntree(
        10,
        12.3,
        Produit("Sac", "desc", 122, 0),
        BonEntree(
            "2012-23-35",
            "Termine",
            Utilisateur(2, "Atou Carter", "atou@gmail.com", "atou", "password",
                Role.manager),
            Fournisseur("nomFounisseur3", "adreesseF", "TELFounrni C")))
  ];

  var gestionEntree = GestionnaireEntre(bonEntreeList, detailsEntrees,
      listeProduits, utilisateurs, fournisseursList);

  var gestionSortie = GestionnaireSortie(listeProduits, utilisateurs);

  print("Veuillez entrer votre login :");
  String login = stdin.readLineSync() ?? "";
  print("Veuillez entrer votre mot de passe:");
  String password = stdin.readLineSync() ?? "";
  var utilisateurConnecte = utilisateurs.firstWhere(
      (user) => user.pseudo == login && user.motDePasse == password);

  void afficherlist() {
    afficherProduit(listeProduits);
    gestionEntree.afficherTousLesDetailsEntree();
  }

  void admin() {
    void choixuser() {
      print("Veuillez choisir votre tâche à faire :");
      print("-----------------------------------------------------------");
      print("|1: Afficher les informations                             |");
      print("-----------------------------------------------------------");
      print("|2: Ajouter un nouveau Utilisateur                        |");
      print("-----------------------------------------------------------");
      print("|3: Ajouter un nouveau fournisseur                        |");
      print("-----------------------------------------------------------");
      print("|4: Ajouter un nouveau Produit                            |");
      print("-----------------------------------------------------------");
      print("|5: Faire un nouveau Rentre                               |");
      print("-----------------------------------------------------------");
      print("|6: Afficher la liste des Entre                           |");
      print("-----------------------------------------------------------");
      print("|7: Faire une nouvelle Sortie                             |");
      print("-----------------------------------------------------------");
      print("|8: Afficher tous les Sortie                              |");
      print("-----------------------------------------------------------");
      print("|9: Afficher les produits                                   |");
      print("-----------------------------------------------------------");
      print("|10: Modifier un produit                                  |");
      print("-----------------------------------------------------------");
      print("|11: Rechercher un produit avec son nom                   |");
      print("-----------------------------------------------------------");
      print("|12: Supprimer Produits                                   |");
      print("-----------------------------------------------------------");
      print("|13: Afficher fournisseurs                                |");
      print("-----------------------------------------------------------");
      print("|14: Modifier fournisseurs                                |");
      print("-----------------------------------------------------------");
      print("|15: Recherche Founisseurs Par son Son                    |");
      print("-----------------------------------------------------------");
      print("|16: Supprimer un Fournisseur                             |");
      print("-----------------------------------------------------------");
      print("|17: Modifier un Entre                                    |");
      print("-----------------------------------------------------------");
      print("|18: Supprimer un Entre                                   |");
      print("-----------------------------------------------------------");
      print("|19: Modifier une sortie                                  |");
      print("-----------------------------------------------------------");
      print("|20: Supprimer une Sortie                                 |");
      print("-----------------------------------------------------------");
      print("|21: Modifier Utilisateurs                                |");
      print("-----------------------------------------------------------");
      print("|22: Modifier un utilisareur                              |");
      print("-----------------------------------------------------------");
      print("|31: Quitter                                              |");
      print("-----------------------------------------------------------");
    }

    while (true) {
      // Produit.initialiserProduits();
      choixuser();
      print("***********************************");
      String choix = stdin.readLineSync() ?? "";

      switch (choix) {
        case "1":
          afficherlist();
          continue;
        case "2":
          ajouterUtilisateur();
          continue;
        case "3":
          ajouterFournisseur();
          continue;
        case "4":
          ajouterProduit();
          continue;
        case "5":
          gestionEntree.creerBonEtDetailsEntree();
          continue;
        case "6":
          gestionEntree.afficherBonsEtDetailsEntree();
          continue;
        case "7":
          gestionSortie.creerBonEtDetailsSortie();
          continue;
        case "8":
          gestionSortie.afficherTousLesSorties();
          continue;
        case "9":
          afficherProduits();
          continue;
        case "10":
          modifierProduit();
          continue;
        case "11":
          rechercherProduitParNom();
          continue;
        case "12":
          supprimerProduit();
          continue;
        case "13":
          afficherFournisseur(fournisseursList);
          continue;
        case "14":
          print("Entrez l'ID du fournisseur à modifier :");
          int idFournisseurAModifier = int.parse(stdin.readLineSync()!);
          modifierFournisseur(idFournisseurAModifier);
          continue;
        case "15":
          print("Entrez le nom du fournisseur à chercher :");
          String nom = stdin.readLineSync()!;
          rechercherFournisseurParNom(nom);
          continue;
        case "16":
          print("Entrez le nom du fournisseur à supprimer :");
          String nomSupprimer = stdin.readLineSync()!;
          supprimerFournisseurParNom(nomSupprimer);
          continue;
        case "17":
          gestionEntree.modifierBonEtDetailsEntree();
          continue;
        case "18":
          print("Entrez l'ID de l'Entre a supprimer :");
          int idEntre = int.parse(stdin.readLineSync()!);
          gestionEntree.supprimerBonEtDetailsEntree(idEntre);
          continue;
        case "19":
          gestionSortie.modifierBonEtDetailsSortie();
          continue;
        case "20":
          print("Entrez l'ID de sortie a supprimer :");
          int idSortie = int.parse(stdin.readLineSync()!);
          gestionSortie.supprimerBonEtDetailsSortie(idSortie);
          continue;
        case "21":
          print("Entrez l'ID de user à supprimer :");
          int userId = int.parse(stdin.readLineSync()!);
          supprimerUtilisateur(userId);
          continue;
        case "22":
          print("Entrez l'ID de user à modifier :");
          int utilisateurId = int.parse(stdin.readLineSync()!);
          modifierUtilisateur(utilisateurId);
          continue;
        case "23":
          return;
        default:
          print('Option non valide. Veuillez choisir une option valide.');
      }
    }
  }

  void manager() {
    void choixuser() {
      print("Veuillez choisir votre tâche à faire :");
      print("-----------------------------------------------------------");
      print("|1: Afficher les informations                             |");
      print("-----------------------------------------------------------");
      print("|2: Ajouter un nouveau fournisseur                        |");
      print("-----------------------------------------------------------");
      print("|3: Ajouter un nouveau Produit                            |");
      print("-----------------------------------------------------------");
      print("|4: Faire un nouveau Rentre                               |");
      print("-----------------------------------------------------------");
      print("|5: Afficher la liste des Entre                           |");
      print("-----------------------------------------------------------");
      print("|6: Faire une nouvelle Sortie                             |");
      print("-----------------------------------------------------------");
      print("|7: Afficher tous les Sortie                              |");
      print("-----------------------------------------------------------");
      print("|8: Afficher les produits                                   |");
      print("-----------------------------------------------------------");
      print("|9: Modifier un produit                                  |");
      print("-----------------------------------------------------------");
      print("|10: Rechercher un produit avec son nom                   |");
      print("-----------------------------------------------------------");
      print("|11: Supprimer Produits                                   |");
      print("-----------------------------------------------------------");
      print("|12: Afficher fournisseurs                                |");
      print("-----------------------------------------------------------");
      print("|13: Modifier fournisseurs                                |");
      print("-----------------------------------------------------------");
      print("|14: Recherche Founisseurs Par son Son                    |");
      print("-----------------------------------------------------------");
      print("|15: Supprimer un Fournisseur                             |");
      print("-----------------------------------------------------------");
      print("|16: Modifier un Entre                                    |");
      print("-----------------------------------------------------------");
      print("|17: Supprimer un Entre                                   |");
      print("-----------------------------------------------------------");
      print("|18: Modifier une sortie                                  |");
      print("-----------------------------------------------------------");
      print("|19: Supprimer une Sortie                                 |");
      print("-----------------------------------------------------------");
      print("|20: Quitter                                              |");
      print("-----------------------------------------------------------");
    }

    while (true) {
      // Produit.initialiserProduits();
      choixuser();
      print("***********************************");
      String choix = stdin.readLineSync() ?? "";

      switch (choix) {
        case "1":
          afficherlist();
          continue;
        case "2":
          ajouterFournisseur();
          continue;
        case "3":
          ajouterProduit();
          continue;
        case "4":
          gestionEntree.creerBonEtDetailsEntree();
          continue;
        case "5":
          gestionEntree.afficherBonsEtDetailsEntree();
          continue;
        case "6":
          gestionSortie.creerBonEtDetailsSortie();
          continue;
        case "7":
          gestionSortie.afficherTousLesSorties();
          continue;
        case "8":
          afficherProduits();
          continue;
        case "9":
          modifierProduit();
          continue;
        case "10":
          rechercherProduitParNom();
          continue;
        case "11":
          supprimerProduit();
          continue;
        case "12":
          afficherFournisseur(fournisseursList);
          continue;
        case "13":
          print("Entrez l'ID du fournisseur à modifier :");
          int idFournisseurAModifier = int.parse(stdin.readLineSync()!);
          modifierFournisseur(idFournisseurAModifier);
          continue;
        case "14":
          print("Entrez le nom du fournisseur à chercher :");
          String nom = stdin.readLineSync()!;
          rechercherFournisseurParNom(nom);
          continue;
        case "15":
          print("Entrez le nom du fournisseur à supprimer :");
          String nomSupprimer = stdin.readLineSync()!;
          supprimerFournisseurParNom(nomSupprimer);
          continue;
        case "16":
          gestionEntree.modifierBonEtDetailsEntree();
          continue;
        case "17":
          print("Entrez l'ID de l'Entre a supprimer :");
          int idEntre = int.parse(stdin.readLineSync()!);
          gestionEntree.supprimerBonEtDetailsEntree(idEntre);
          continue;
        case "18":
          gestionSortie.modifierBonEtDetailsSortie();
          continue;
        case "19":
          print("Entrez l'ID de sortie a supprimer :");
          int idSortie = int.parse(stdin.readLineSync()!);
          gestionSortie.supprimerBonEtDetailsSortie(idSortie);
          continue;
        case "20":
          return;
        default:
          print('Option non valide. Veuillez choisir une option valide.');
      }
    }
  }

  switch (utilisateurConnecte.role) {
    case Role.administrateur:
      print("Bienvenue Administrateur");
      admin();
      break;

    case Role.manager:
      print("Bienvenue Manager !");
      manager();
      break;

    case Role.vendeur:
      print("Bienvenue Vendeur !");
      afficherProduit(
          listeProduits); // Affichage de la liste des produits pour les vendeurs
      break;

    default:
      print("Vous n'avez rien à ajouter");
  }
}

/***********************************************************Détails Sortie**********************************************************************/
// void ajouterDetailSortie(GestionDetailsSortie gestion) {
//   try {
//     print("Entrez la quantité:");
//     int quantite = int.parse(stdin.readLineSync() ?? '0');

//     print("Entrez le prix total:");
//     double prixTotal = double.parse(stdin.readLineSync() ?? '0');

//     print("Entrez l'ID du bon de sortie:");
//     int bonSortieId = int.parse(stdin.readLineSync() ?? '0');

//     print("Entrez l'ID du produit:");
//     int produitId = int.parse(stdin.readLineSync() ?? '0');

//     print(
//         "Entrez la date d'expiration (yyyy-MM-dd), ou appuyez sur Entrée si non applicable:");
//     String? dateInput = stdin.readLineSync();
//     DateTime? dateExpiration = null;
//     if (dateInput != null && dateInput.isNotEmpty) {
//       dateExpiration = DateTime.parse(dateInput);
//     }

//     gestion.ajouterDetailSortie(
//         quantite, prixTotal, dateExpiration, bonSortieId, produitId);
//     print("Détail de sortie ajouté avec succès.");
//   } catch (e) {
//     print("Erreur lors de l'ajout du détail de sortie: $e");
//   }
// }

// void modifierDetailSortie(GestionDetailsSortie gestion) {
//   print("Entrez l'ID du détail de sortie à modifier:");
//   int id = int.parse(stdin.readLineSync() ?? '0');
//   print(
//       "Entrez la nouvelle quantité (appuyez sur Entrée pour ne pas changer):");
//   String? quantiteInput = stdin.readLineSync();
//   int? quantite =
//       quantiteInput?.isEmpty ?? true ? null : int.parse(quantiteInput!);
//   print(
//       "Entrez le nouveau prix total (appuyez sur Entrée pour ne pas changer):");
//   String? prixTotalInput = stdin.readLineSync();
//   double? prixTotal =
//       prixTotalInput?.isEmpty ?? true ? null : double.parse(prixTotalInput!);

//   gestion.modifierDetailSortie(id, quantite: quantite, prixTotal: prixTotal);
// }

// void supprimerDetailSortie(GestionDetailsSortie gestion) {
//   print("Entrez l'ID du détail de sortie à supprimer:");
//   int id = int.parse(stdin.readLineSync() ?? '0');
//   gestion.supprimerDetailSortie(id);
// }

// void rechercherDetailParId(GestionDetailsSortie gestion) {
//   print("Entrez l'ID du détail de sortie à rechercher:");
//   int id = int.parse(stdin.readLineSync() ?? '0');
//   try {
//     var detail = gestion.rechercherParId(id);
//     print(detail);
//   } catch (e) {
//     print(e);
//   }
//}

// void rechercherDetailsParDateExpiration(GestionDetailsSortie gestion) {
//   try {
//     print("Entrez la date d'expiration à rechercher (yyyy-MM-dd):");
//     String? dateInput = stdin.readLineSync();
//     DateTime dateRecherche = DateTime.parse(dateInput!);
//     DateTime? dateExpiration = null;
//     if (dateInput != null && dateInput.isNotEmpty) {
//       dateExpiration = DateTime.parse(dateInput);
//     }

//     var details = gestion.rechercherParDateExpiration(dateRecherche);

//     details.forEach(print);
//   } catch (e) {
//     print("Erreur lors de la recherche du détail de sortie: $e");
//   }
// }

// /***********************************************************Produit**********************************************************************/
// // METHODE POUR AJOUTER PRODUIT
// void ajouterProduit() {
//   print(
//       "*************** Ici nous pouvons ajouter un produit *****************");
//   print("Entrez les informations du produit à ajouter:");
//   print("Nom du produit:");
//   String nomProduit = stdin.readLineSync() ?? "";
//   print("Description du produit:");
//   String descriptionProduit = stdin.readLineSync() ?? "";
//   print("Prix d'achat du produit:");
//   double prixAchat = double.parse(stdin.readLineSync() ?? "0");
//   print("Quantité en stock");
//   int quantiteStock = int.parse(stdin.readLineSync() ?? "0");

//   Produit nouveauProduit = Produit(Produit.produits.length + 1, nomProduit,
//       descriptionProduit, prixAchat, quantiteStock);
//   Produit.ajouterProduit(nouveauProduit);
//   print("Produit ajouté avec succès !");

//   print("******** Liste des produits après ajout de nouveau produit *******");
//   Produit.afficherTousProduit();
// }

// // pour modifier produit
// void modifierProduit() {
//   print(
//       "*************** Ici nous pouvons modifier un produit *****************");
//   print("Entrez l'ID du produit à modifier:");
//   int produitId = int.parse(stdin.readLineSync() ?? "0");
//   print("Entrez les nouvelles informations pour le  produit:");
//   print("Nom du produit:");
//   String nomProduit = stdin.readLineSync() ?? "";
//   print("Description du produit:");
//   String descriptionProduit = stdin.readLineSync() ?? "";
//   print("Prix d'achat du produit:");
//   double prixAchat = double.parse(stdin.readLineSync() ?? "0");
//   print("Quantité en stock");
//   int quantiteStock = int.parse(stdin.readLineSync() ?? "0");

//   Produit.modifierProduit(produitId,
//       nom_produit: nomProduit,
//       description: descriptionProduit,
//       prix: prixAchat,
//       quantite_en_stock: quantiteStock);
//   print("Produit modifié avec succès !");
//   print("******** Liste des produits après avoir modifier un produit *******");
//   Produit.afficherTousProduit();
// }

// // POUR supprimer produit

// void supprimerProduit() {
//   print(
//       "*************** Ici nous pouvons supprimer un produit *****************");
//   print("Entrez l'ID du produit à supprimer:");
//   int produitId = int.parse(stdin.readLineSync() ?? "0");

//   Produit.supprimerProduit(produitId);
//   print("Produit supprimé avec succès !");

//   print("******** Liste des produits après suppression de produit *******");
// }

// // POUR RECHERCHER PRODUIT
// void rechercherProduit() {
//   print(
//       "*************** Ici nous pouvons rechercher un produit *****************");
//   print("Entrez le nom du produit à rechercher:");
//   String nomProduit = stdin.readLineSync() ?? "";

//   List<Produit> produitsTrouves = Produit.searchByName(nomProduit);
//   if (produitsTrouves.isNotEmpty) {
//     print('Produits trouvés :');
//     produitsTrouves.forEach((produit) {
//       produit.afficherDetails();
//     });
//   } else {
//     print("Aucun produit trouvé avec le nom $nomProduit");
//   }
// }

// /***********************************************************Fournisseur*****************************************************************/
// void ajouterFournisseur(GestionFournisseurs gestionFrs) {
//   try {
//     print("Entrez l'ID du nouveau fournisseur:");
//     int id = int.parse(stdin.readLineSync() ?? '0');
//     print("Entrez le nom du nouveau fournisseur:");
//     String nom = stdin.readLineSync() ?? '';
//     print("Entrez l'adresse du nouveau fournisseur:");
//     String adresse = stdin.readLineSync() ?? '';
//     print("Entrez le téléphone du nouveau fournisseur:");
//     String telephone = stdin.readLineSync() ?? '';

//     gestionFrs.ajouterFournisseur(Fournisseur(
//         fournisseurId: id, nom: nom, adresse: adresse, telephone: telephone));
//     print("Fournisseur ajouté avec succès.");
//   } catch (e) {
//     print("Erreur lors de l'ajout du fournisseur: $e");
//   }
// }

// void modifierFournisseur(GestionFournisseurs gestionFrs) {
//   try {
//     print("Entrez l'ID du fournisseur à modifier:");
//     int id = int.parse(stdin.readLineSync() ?? '0');
//     print("Entrez le nouveau nom du fournisseur:");
//     String nom = stdin.readLineSync() ?? '';
//     print("Entrez la nouvelle adresse du fournisseur:");
//     String adresse = stdin.readLineSync() ?? '';
//     print("Entrez le nouveau téléphone du fournisseur:");
//     String telephone = stdin.readLineSync() ?? '';

//     gestionFrs.modifierFournisseur(id, nom, adresse, telephone);
//     print("Fournisseur modifié avec succès.");
//   } catch (e) {
//     print("Erreur lors de la modification du fournisseur: $e");
//   }
// }

// void supprimerFournisseur(GestionFournisseurs gestionFrs) {
//   try {
//     print("Entrez l'ID du fournisseur à supprimer:");
//     int id = int.parse(stdin.readLineSync() ?? '0');
//     gestionFrs.supprimerFournisseur(id);
//     print("Fournisseur supprimé avec succès.");
//   } catch (e) {
//     print("Erreur lors de la suppression du fournisseur: $e");
//   }
// }

// void rechercherFournisseurParNom(GestionFournisseurs gestionFrs) {
//   print("Entrez le nom du fournisseur à rechercher:");
//   String nom = stdin.readLineSync() ?? '';

//   var fournisseur = gestionFrs.rechercherFournisseurParNom(nom);
//   if (fournisseur != null) {
//     print(
//         'Fournisseur trouvé: ID=${fournisseur.fournisseurId}, Nom=${fournisseur.nom}, Adresse=${fournisseur.adresse}, Téléphone=${fournisseur.telephone}');
//   } else {
//     print('Fournisseur avec le nom "$nom" non trouvé.');
//   }
//}

/***********************************************************Utilisateur*****************************************************************/

// void ajouterutilisateur(gestionUtilisateurs) {
//   print("----------- Ajouter des utilisateurs----------");
//   print("Combien d'utilisateur vous voulez ajouter");
//   int ajouter = int.parse(stdin.readLineSync() ?? "");
//   int i;
//   for (i = 1; i <= ajouter; i++) {
//     print("Ajout de l'utilisateur $i :");
//     gestionUtilisateurs.ajouterUtilisateur();
//   }
//   print("Utilisateur ajouter avec succès !");
//   gestionUtilisateurs.afficherUtilisateurs();
// }

// void modifierutilisateur(gestionUtilisateurs) {
//   print("----------- Modifier un utilisateurs----------");
//   // GestionUtilisateurs gestionUtilisateurs = GestionUtilisateurs();
//   print("Donnez l'ID de l'utilisateur à Modifier");
//   int modifier = int.parse(stdin.readLineSync() ?? "");
//   gestionUtilisateurs.modifierUtilisateur(modifier);
//   gestionUtilisateurs.afficherUtilisateurs();
// }

// void supprimerutilisateur(gestionUtilisateurs) {
//   gestionUtilisateurs.afficherUtilisateurs();
//   print("Donnez l'ID de l'utilisateur à supprimer");
//   int supprimer = int.parse(stdin.readLineSync() ?? "");
//   gestionUtilisateurs.supprimerUtilisateur(supprimer);
// }

// void rechercherutilisateurParNom(gestionUtilisateurs) {
//   print("----------- Rechercher un utilisateur par nom----------");
//   // GestionUtilisateurs gestionUtilisateurs = GestionUtilisateurs();
//   print("Donnez le nom de l'utilisateur à chercher");
//   String rechercheNom = stdin.readLineSync() ?? "";
//   gestionUtilisateurs.rechercherParNom(rechercheNom);
// }

/***********************************************************Bon d'entrée******************************************************************/
// void ajouterBonEntree(gestionnaire) {
//   print("Entrez les informations du bon d'entrée à ajouter:");
//   print("Entrez la date de commande (format: YYYY-MM-DD):");
//   String dateDeCommande = stdin.readLineSync() ?? "";
//   print("Entrez le Statut:");
//   String statut = stdin.readLineSync() ?? "";
//   print("Entrez l'ID de l'utilisateur:");
//   int utilisateurId = int.parse(stdin.readLineSync() ?? "0");
//   print("Entrez l'ID du fournisseur:");
//   int fournisseurId = int.parse(stdin.readLineSync() ?? "0");

//   gestionnaire.ajouterBonEntree(
//       dateDeCommande, statut, utilisateurId, fournisseurId);
//   print("Bon d'entrée ajouté avec succès !");
// }

// void modifierBonEntree(gestionnaire) {
//   print("Entrez l'ID du bon d'entrée à modifier:");
//   int bonEntreeId = int.parse(stdin.readLineSync() ?? "0");
//   print("Entrez les nouvelles informations pour le bon d'entrée:");
//   print("Date de commande (format: YYYY-MM-DD):");
//   String dateDeCommande = stdin.readLineSync() ?? "";
//   print("Statut:");
//   String statut = stdin.readLineSync() ?? "";
//   print("ID de l'utilisateur:");
//   int utilisateurId = int.parse(stdin.readLineSync() ?? "0");
//   print("ID du fournisseur:");
//   int fournisseurId = int.parse(stdin.readLineSync() ?? "0");

//   gestionnaire.modifierBonEntree(bonEntreeId,
//       dateDeCommande: dateDeCommande,
//       statut: statut,
//       utilisateurId: utilisateurId,
//       fournisseurId: fournisseurId);
//   print("Bon d'entrée modifié avec succès !");
// }

// void supprimerBonEntree(gestionnaire) {
//   print("Entrez l'ID du bon d'entrée à supprimer:");
//   int bonEntreeId = int.parse(stdin.readLineSync() ?? "0");

//   gestionnaire.supprimerBonEntree(bonEntreeId);
//   print("Bon d'entrée supprimé avec succès !");
// }

// void rechercherBonEntree(gestionnaire) {
//   print("Entrez l'ID du bon d'entrée à rechercher:");
//   int bonEntreeId = int.parse(stdin.readLineSync() ?? "0");

//   try {
//     BonEntree bon = gestionnaire.rechercherBonEntreeParId(bonEntreeId);
//     print('Bon trouvé : $bon');
//   } catch (e) {
//     print(e);
//   }
// }

// /***********************************************************Bon de sortie*****************************************************************/
// void ajouterBonSortie(GestionBonSortie gestionBonSortie) {
//   print("Entrez les informations du bon de sortie à ajouter:");
//   print("Motif:");
//   String motif = stdin.readLineSync() ?? "";
//   print("Date de sortie (format: YYYY-MM-DD):");
//   DateTime dateSortie = DateTime.parse(stdin.readLineSync() ?? "");
//   print("ID de l'utilisateur:");
//   int utilisateurId = int.parse(stdin.readLineSync() ?? "0");

//   gestionBonSortie.creerBonSortie(motif, dateSortie, utilisateurId);
//   print("Bon de sortie ajouté avec succès !");
// }

// void modifierBonSortie(GestionBonSortie gestionBonSortie) {
//   print("Entrez l'ID du bon de sortie à modifier:");
//   int bonSortieId = int.parse(stdin.readLineSync() ?? "0");
//   print("Entrez les nouvelles informations pour le bon de sortie:");
//   print("Motif:");
//   String motif = stdin.readLineSync() ?? "";
//   print("Date de sortie (format: YYYY-MM-DD):");
//   DateTime dateSortie = DateTime.parse(stdin.readLineSync() ?? "");
//   print("ID de l'utilisateur:");
//   int utilisateurId = int.parse(stdin.readLineSync() ?? "0");

//   gestionBonSortie.modifierBonSortie(bonSortieId,
//       motif: motif, dateSortie: dateSortie, utilisateurId: utilisateurId);
//   print("Bon de sortie modifié avec succès !");
// }

// void supprimerBonSortie(GestionBonSortie gestionBonSortie) {
//   print("Entrez l'ID du bon de sortie à supprimer:");
//   int bonSortieId = int.parse(stdin.readLineSync() ?? "0");

//   gestionBonSortie.supprimerBonSortie(bonSortieId);
//   print("Bon de sortie supprimé avec succès !");
// }

// void rechercherBonSortie(GestionBonSortie gestionBonSortie) {
//   print("Entrez l'ID du bon de sortie à rechercher:");
//   int bonSortieId = int.parse(stdin.readLineSync() ?? "0");

//   try {
//     BonSortie bon = gestionBonSortie.rechercherParId(bonSortieId);
//     print('Bon trouvé : $bon');
//   } catch (e) {
//     print(e);
//   }
//}

/***************************************************************FIN***********************************************************************/
