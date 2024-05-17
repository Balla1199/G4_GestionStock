
import 'dart:convert';
import 'dart:io';

import 'package:stockodk/models/bon_entree.dart';
import 'package:stockodk/models/bon_sortie.dart';
import 'package:stockodk/models/details_entree.dart';
import 'package:stockodk/models/details_sortie.dart';
import 'package:stockodk/models/fournisseur.dart';
import 'package:stockodk/models/produit.dart';
import 'package:stockodk/models/utilisateur.dart';

void main (){ 
    
  Utilisateur utilisateur1 = Utilisateur(1,  "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou", "password", Role.administrateur);
  Utilisateur utilisateur2 = Utilisateur(2, "Atou Carter", "atou@gmail.com", "atou", "password", Role.manager);
  Utilisateur utilisateur3 = Utilisateur(3, "Moussa Goita", "moussa@gmail.com", "moussa", "password", Role.vendeur);
  var utilisateurs = [utilisateur1, utilisateur2, utilisateur3];
  GestionUtilisateurs gestionUtilisateurs = GestionUtilisateurs();

  Produit.ajouterProduit(Produit(1, "14 pro max", "512go", 34.78, 34));
  Produit.ajouterProduit(Produit(2, "Stylo", "Red", 20, 4));
  Produit.ajouterProduit(Produit(3, "Oridnateur Dell", "Hp", 78, 12));

  var gestionFrs = GestionFournisseurs();
  gestionFrs.ajouterFournisseur(Fournisseur(fournisseurId: 1, nom: "Balla", adresse: "Bamako", telephone: '2378'));
  gestionFrs.ajouterFournisseur(Fournisseur(fournisseurId: 2, nom: "Oumar", adresse: "Kayes", telephone: '123'));

  BonEntree.ajouterBonEntree(1, "22-05-2020", "Livré", 1, 1);
  BonEntree.ajouterBonEntree(2, "22-03-2023", "Encours", 1, 2);
  BonEntree.ajouterBonEntree(3, "12-05-2024", "Encours", 1, 2);

  DetailsEntree firstEntre = DetailsEntree(1, 10, 34.78, 2, 1);
  DetailsEntree firstEntre1 = DetailsEntree(2, 13, 78, 2, 1);
  DetailsEntree firstEntre2 = DetailsEntree(3, 4, 50.5, 1, 2);
  var detailsEntree = DetailsEntree(0, 0, 0, 0, 0);

  var gestionBonSortie = GestionBonSortie();
  // Création de bons de sortie
  gestionBonSortie.creerBonSortie("Achat de fournitures de bureau", DateTime(2024, 5, 10), 1);
  gestionBonSortie.creerBonSortie("Achat d'équipement informatique", DateTime(2024, 5, 15), 2);

  var gestion = GestionDetailsSortie();
  gestion.ajouterDetailSortie(5, 1500.0, null, 1, 1);
  gestion.ajouterDetailSortie(5, 1500.0, null, 1, 1);
  gestion.ajouterDetailSortie(5, 1500.0, null, 2, 2);

  print("Veuillez entrer votre login :");
  String login = stdin.readLineSync() ?? "";
  print("Veuillez entrer votre mot de passe:");
  String password = stdin.readLineSync() ?? "";

  var utilisateurConnecte = utilisateurs.firstWhere((user) => user.pseudo == login && user.motDePasse == password);
  
  void afficherlist(){
    Produit.afficherTousProduit();
    gestionFrs.afficherFournisseur();
    BonEntree.afficherBonsEntree();
    for (var bon in gestionBonSortie.listerBonsSortie()) {
    print(bon);
    }
    detailsEntree.afficherTousLesDetailsEntree();
    gestion.listerDetailsSortie();
  }
  
  void admin() {
    void choixuser(){
      print("Veuillez choisir votre tâche à faire :");
      print("-----------------------------------------------------------");
      print("|1: Afficher les informations                             |");
      print("-----------------------------------------------------------");
      print("|2: Ajouter un détail sortie                              |");
      print("-----------------------------------------------------------");
      print("|3: Modifier un détail sortie                             |");
      print("-----------------------------------------------------------");
      print("|4: Supprimer un détail sortie                            |");
      print("-----------------------------------------------------------");
      print("|5: Rechercher un détail de sortie par ID                 |");
      print("-----------------------------------------------------------");
      print("|6: Rechercher des détails de sortie par date d'expiration|");
      print("-----------------------------------------------------------");
      print("|7: Ajouter un produit                                    |");
      print("-----------------------------------------------------------");
      print("|8: Modifier un produit                                   |");
      print("-----------------------------------------------------------");
      print("|9: Supprimer un produit                                  |");
      print("-----------------------------------------------------------");
      print("|10: Recherche un produit                                 |");
      print("-----------------------------------------------------------");
      print("|11: Ajouter fournisseurs                                 |");
      print("-----------------------------------------------------------");      
      print("|12: Modifier fournisseurs                                |");
      print("-----------------------------------------------------------");
      print("|13: Supprimer fournisseurs                               |");
      print("-----------------------------------------------------------");
      print("|14: Recherche fournisseurs                               |");
      print("-----------------------------------------------------------");
      print("|15: Ajouter un bon de sortie                             |");
      print("-----------------------------------------------------------");
      print("|16: Modifier un bon de sortie                            |");
      print("-----------------------------------------------------------");
      print("|17: Supprimer un bon de sortie                           |");
      print("-----------------------------------------------------------");
      print("|18: Recherche un bon de sortie                           |");
      print("-----------------------------------------------------------");
      print("|19: Ajouter un bon de d'entrée                           |");
      print("-----------------------------------------------------------");
      print("|20: Modifier un bon de d'entrée                          |");
      print("-----------------------------------------------------------");
      print("|21: Supprimer un bon de d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|22: Recherche un bon de d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|23: Ajouter un détail d'entrée                           |");
      print("-----------------------------------------------------------");
      print("|24: Modifier un détail d'entrée                          |");
      print("-----------------------------------------------------------");
      print("|25: Supprimer un détail d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|26: Recherche un détail d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|27: Ajouter un utilisateur                               |");
      print("-----------------------------------------------------------");
      print("|28: Modifier un utilisateur                              |");
      print("-----------------------------------------------------------");
      print("|29: Supprimer un utilisateur                             |");
      print("-----------------------------------------------------------");
      print("|30: Recherche un utilisateur                             |");
      print("-----------------------------------------------------------");
      print("|31: Quitter                                              |");
      print("-----------------------------------------------------------");
    }
 
    while(true){
      Produit.initialiserProduits();
      choixuser();
      print("***********************************");
      String choix = stdin.readLineSync() ?? "";

      switch(choix) {
        case "1":
          afficherlist();
          continue;
        case "2":
          ajouterDetailSortie(gestion);
          continue;
        case "3":
          modifierDetailSortie(gestion);
          continue;
        case "4":
          supprimerDetailSortie(gestion);
          continue;
        case "5":
          rechercherDetailParId(gestion);
          continue;
        case "6":
          rechercherDetailsParDateExpiration(gestion);
          continue;
        case "7":
          ajouterProduit();
          continue;
        case "8":
          modifierProduit();
          continue;
        case "9":
          supprimerProduit();
          continue;
        case "10":
          rechercherProduit();
          continue;
        case "11":
          ajouterFournisseur(gestionFrs);
          continue;
        case "12":
          modifierFournisseur(gestionFrs);
          continue;
        case "13":
          supprimerFournisseur(gestionFrs);
          continue;
        case "14":
          rechercherFournisseurParNom(gestionFrs);
          continue;
        case "15":
          ajouterBonSortie(gestionBonSortie);
          continue;
        case "16":
          modifierBonSortie(gestionBonSortie);
          continue;
        case "17":
          supprimerBonSortie(gestionBonSortie);
          continue;
        case "18":
          rechercherBonSortie(gestionBonSortie);
          continue;
        case "19":
          ajouterProduit();
          continue;
        case "20":
          modifierProduit();
          continue;
        case "21":
          supprimerProduit();
          continue;
        case "22":
          rechercherProduit();
          continue;
        case "23":
          detailsEntree.creerDetailsEntree();
          continue;
        case "24":
          detailsEntree.creerDetailsEntree();
          continue;
        case "25":
          detailsEntree.creerDetailsEntree();
          continue;
        case "26":
          detailsEntree.creerDetailsEntree();
          continue;
        case "27":
          ajouterutilisateur(gestionUtilisateurs);
          continue;
        case "28":
          modifierutilisateur(gestionUtilisateurs);
          continue;
        case "29":
          supprimerutilisateur(gestionUtilisateurs);
          continue;
        case "30":
          rechercherutilisateurParNom(gestionUtilisateurs);
          continue;          
        case "31":
          return;
        default: print('Option non valide. Veuillez choisir une option valide.');
      }
    }
  }

  void manager () {
    void choixuser(){
      print("Veuillez choisir votre tâche à faire :");
      print("-----------------------------------------------------------");
      print("|1: Afficher les informations                             |");
      print("-----------------------------------------------------------");
      print("|2: Ajouter un détail sortie                              |");
      print("-----------------------------------------------------------");
      print("|3: Modifier un détail sortie                             |");
      print("-----------------------------------------------------------");
      print("|4: Supprimer un détail sortie                            |");
      print("-----------------------------------------------------------");
      print("|5: Rechercher un détail de sortie par ID                 |");
      print("-----------------------------------------------------------");
      print("|6: Rechercher des détails de sortie par date d'expiration|");
      print("-----------------------------------------------------------");
      print("|7: Ajouter un produit                                    |");
      print("-----------------------------------------------------------");
      print("|8: Modifier un produit                                   |");
      print("-----------------------------------------------------------");
      print("|9: Supprimer un produit                                  |");
      print("-----------------------------------------------------------");
      print("|10: Recherche un produit                                 |");
      print("-----------------------------------------------------------");
      print("|11: Ajouter fournisseurs                                 |");
      print("-----------------------------------------------------------");      
      print("|12: Modifier fournisseurs                                |");
      print("-----------------------------------------------------------");
      print("|13: Supprimer fournisseurs                               |");
      print("-----------------------------------------------------------");
      print("|14: Recherche fournisseurs                               |");
      print("-----------------------------------------------------------");
      print("|15: Ajouter un bon de sortie                             |");
      print("-----------------------------------------------------------");
      print("|16: Modifier un bon de sortie                            |");
      print("-----------------------------------------------------------");
      print("|17: Supprimer un bon de sortie                           |");
      print("-----------------------------------------------------------");
      print("|18: Recherche un bon de sortie                           |");
      print("-----------------------------------------------------------");
      print("|19: Ajouter un bon de d'entrée                           |");
      print("-----------------------------------------------------------");
      print("|20: Modifier un bon de d'entrée                          |");
      print("-----------------------------------------------------------");
      print("|21: Supprimer un bon de d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|22: Recherche un bon de d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|23: Ajouter un détail d'entrée                           |");
      print("-----------------------------------------------------------");
      print("|24: Modifier un détail d'entrée                          |");
      print("-----------------------------------------------------------");
      print("|25: Supprimer un détail d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|26: Recherche un détail d'entrée                         |");
      print("-----------------------------------------------------------");
      print("|27: Quitter                                              |");
      print("-----------------------------------------------------------");
    }
 
    while(true){
      Produit.initialiserProduits();
      choixuser();
      print("***********************************");
      String choix = stdin.readLineSync() ?? "";

      switch(choix) {
        case "1":
          afficherlist();
          continue;
        case "2":
          ajouterDetailSortie(gestion);
          continue;
        case "3":
          modifierDetailSortie(gestion);
          continue;
        case "4":
          supprimerDetailSortie(gestion);
          continue;
        case "5":
          rechercherDetailParId(gestion);
          continue;
        case "6":
          rechercherDetailsParDateExpiration(gestion);
          continue;
        case "7":
          ajouterProduit();
          continue;
        case "8":
          modifierProduit();
          continue;
        case "9":
          supprimerProduit();
          continue;
        case "10":
          rechercherProduit();
          continue;
        case "11":
          ajouterFournisseur(gestionFrs);
          continue;
        case "12":
          modifierFournisseur(gestionFrs);
          continue;
        case "13":
          supprimerFournisseur(gestionFrs);
          continue;
        case "14":
          rechercherFournisseurParNom(gestionFrs);
          continue;
        case "15":
          ajouterBonSortie(gestionBonSortie);
          continue;
        case "16":
          modifierBonSortie(gestionBonSortie);
          continue;
        case "17":
          supprimerBonSortie(gestionBonSortie);
          continue;
        case "18":
          rechercherBonSortie(gestionBonSortie);
          continue;
        case "19":
          ajouterProduit();
          continue;
        case "20":
          modifierProduit();
          continue;
        case "21":
          supprimerProduit();
          continue;
        case "22":
          rechercherProduit();
          continue;
        case "23":
          detailsEntree.creerDetailsEntree();
          continue;
        case "24":
          detailsEntree.creerDetailsEntree();
          continue;
        case "25":
          detailsEntree.creerDetailsEntree();
          continue;
        case "26":
          detailsEntree.creerDetailsEntree();
          continue;
        case "27":
          return;
        default: print('Option non valide. Veuillez choisir une option valide.');
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
      Produit.afficherTousProduit(); // Affichage de la liste des produits pour les vendeurs
      break;

    default: print("Vous n'avez rien à ajouter");  
  }


}

/***********************************************************Détails Sortie**********************************************************************/
void ajouterDetailSortie(GestionDetailsSortie gestion) {
  try {
    print("Entrez la quantité:");
    int quantite = int.parse(stdin.readLineSync() ?? '0');

    print("Entrez le prix total:");
    double prixTotal = double.parse(stdin.readLineSync() ?? '0');

    print("Entrez l'ID du bon de sortie:");
    int bonSortieId = int.parse(stdin.readLineSync() ?? '0');

    print("Entrez l'ID du produit:");
    int produitId = int.parse(stdin.readLineSync() ?? '0');

    print("Entrez la date d'expiration (yyyy-MM-dd), ou appuyez sur Entrée si non applicable:");
    String? dateInput = stdin.readLineSync();
    DateTime? dateExpiration = null;
    if (dateInput != null && dateInput.isNotEmpty) {
      dateExpiration = DateTime.parse(dateInput);
    }

    gestion.ajouterDetailSortie(quantite, prixTotal, dateExpiration, bonSortieId, produitId);
    print("Détail de sortie ajouté avec succès.");
  } catch (e) {
    print("Erreur lors de l'ajout du détail de sortie: $e");
  }
}

void modifierDetailSortie(GestionDetailsSortie gestion) {
  print("Entrez l'ID du détail de sortie à modifier:");
  int id = int.parse(stdin.readLineSync() ?? '0');
  print("Entrez la nouvelle quantité (appuyez sur Entrée pour ne pas changer):");
  String? quantiteInput = stdin.readLineSync();
  int? quantite = quantiteInput?.isEmpty ?? true ? null : int.parse(quantiteInput!);
  print("Entrez le nouveau prix total (appuyez sur Entrée pour ne pas changer):");
  String? prixTotalInput = stdin.readLineSync();
  double? prixTotal = prixTotalInput?.isEmpty ?? true ? null : double.parse(prixTotalInput!);

  gestion.modifierDetailSortie(id, quantite: quantite, prixTotal: prixTotal);
}

void supprimerDetailSortie(GestionDetailsSortie gestion) {
  print("Entrez l'ID du détail de sortie à supprimer:");
  int id = int.parse(stdin.readLineSync() ?? '0');
  gestion.supprimerDetailSortie(id);
}

void rechercherDetailParId(GestionDetailsSortie gestion) {
  print("Entrez l'ID du détail de sortie à rechercher:");
  int id = int.parse(stdin.readLineSync() ?? '0');
  try {
    var detail = gestion.rechercherParId(id);
    print(detail);
  } catch (e) {
    print(e);
  }
}

void rechercherDetailsParDateExpiration(GestionDetailsSortie gestion) {
    try {
      print("Entrez la date d'expiration à rechercher (yyyy-MM-dd):");
      String? dateInput = stdin.readLineSync();
      DateTime dateRecherche = DateTime.parse(dateInput!);
      DateTime? dateExpiration = null;
      if (dateInput != null && dateInput.isNotEmpty) {
        dateExpiration = DateTime.parse(dateInput);
      }

      var details = gestion.rechercherParDateExpiration(dateRecherche);

      details.forEach(print);
  } catch (e) {
    print("Erreur lors de la recherche du détail de sortie: $e");
  }  
}

/***********************************************************Produit**********************************************************************/
// METHODE POUR AJOUTER PRODUIT
void ajouterProduit() {
  print(
      "*************** Ici nous pouvons ajouter un produit *****************");
  print("Entrez les informations du produit à ajouter:");
  print("Nom du produit:");
  String nomProduit = stdin.readLineSync() ?? "";
  print("Description du produit:");
  String descriptionProduit = stdin.readLineSync() ?? "";
  print("Prix d'achat du produit:");
  double prixAchat = double.parse(stdin.readLineSync() ?? "0");
  print("Quantité en stock");
  int quantiteStock = int.parse(stdin.readLineSync() ?? "0");

  Produit nouveauProduit = Produit(Produit.produits.length + 1, nomProduit,
      descriptionProduit, prixAchat, quantiteStock);
  Produit.ajouterProduit(nouveauProduit);
  print("Produit ajouté avec succès !");

  print("******** Liste des produits après ajout de nouveau produit *******");
  Produit.afficherTousProduit();
}

// pour modifier produit
void modifierProduit() {
  print(
      "*************** Ici nous pouvons modifier un produit *****************");
  print("Entrez l'ID du produit à modifier:");
  int produitId = int.parse(stdin.readLineSync() ?? "0");
  print("Entrez les nouvelles informations pour le  produit:");
  print("Nom du produit:");
  String nomProduit = stdin.readLineSync() ?? "";
  print("Description du produit:");
  String descriptionProduit = stdin.readLineSync() ?? "";
  print("Prix d'achat du produit:");
  double prixAchat = double.parse(stdin.readLineSync() ?? "0");
  print("Quantité en stock");
  int quantiteStock = int.parse(stdin.readLineSync() ?? "0");

  Produit.modifierProduit(produitId,
      nom_produit: nomProduit,
      description: descriptionProduit,
      prix: prixAchat,
      quantite_en_stock: quantiteStock);
  print("Produit modifié avec succès !");
  print("******** Liste des produits après avoir modifier un produit *******");
  Produit.afficherTousProduit();
}

// POUR supprimer produit

void supprimerProduit() {
  print(
      "*************** Ici nous pouvons supprimer un produit *****************");
  print("Entrez l'ID du produit à supprimer:");
  int produitId = int.parse(stdin.readLineSync() ?? "0");

  Produit.supprimerProduit(produitId);
  print("Produit supprimé avec succès !");

  print("******** Liste des produits après suppression de produit *******");
}

// POUR RECHERCHER PRODUIT
void rechercherProduit() {
  print("*************** Ici nous pouvons rechercher un produit *****************");
  print("Entrez le nom du produit à rechercher:");
  String nomProduit = stdin.readLineSync() ?? "";

  List<Produit> produitsTrouves = Produit.searchByName(nomProduit);
  if (produitsTrouves.isNotEmpty) {
    print('Produits trouvés :');
    produitsTrouves.forEach((produit) {
      produit.afficherDetails();
    });
  } else {
    print("Aucun produit trouvé avec le nom $nomProduit");
  }
}

/***********************************************************Fournisseur*****************************************************************/
void ajouterFournisseur(GestionFournisseurs gestionFrs) {
  try {
    print("Entrez l'ID du nouveau fournisseur:");
    int id = int.parse(stdin.readLineSync() ?? '0');
    print("Entrez le nom du nouveau fournisseur:");
    String nom = stdin.readLineSync() ?? '';
    print("Entrez l'adresse du nouveau fournisseur:");
    String adresse = stdin.readLineSync() ?? '';
    print("Entrez le téléphone du nouveau fournisseur:");
    String telephone = stdin.readLineSync() ?? '';

    gestionFrs.ajouterFournisseur(Fournisseur(fournisseurId: id, nom: nom, adresse: adresse, telephone: telephone));
    print("Fournisseur ajouté avec succès.");
  } catch (e) {
    print("Erreur lors de l'ajout du fournisseur: $e");
  }
}

void modifierFournisseur(GestionFournisseurs gestionFrs) {
  try {
    print("Entrez l'ID du fournisseur à modifier:");
    int id = int.parse(stdin.readLineSync() ?? '0');
    print("Entrez le nouveau nom du fournisseur:");
    String nom = stdin.readLineSync() ?? '';
    print("Entrez la nouvelle adresse du fournisseur:");
    String adresse = stdin.readLineSync() ?? '';
    print("Entrez le nouveau téléphone du fournisseur:");
    String telephone = stdin.readLineSync() ?? '';

    gestionFrs.modifierFournisseur(id, nom, adresse, telephone);
    print("Fournisseur modifié avec succès.");
  } catch (e) {
    print("Erreur lors de la modification du fournisseur: $e");
  }
}

void supprimerFournisseur(GestionFournisseurs gestionFrs) {
  try {
    print("Entrez l'ID du fournisseur à supprimer:");
    int id = int.parse(stdin.readLineSync() ?? '0');
    gestionFrs.supprimerFournisseur(id);
    print("Fournisseur supprimé avec succès.");
  } catch (e) {
    print("Erreur lors de la suppression du fournisseur: $e");
  }
}

void rechercherFournisseurParNom(GestionFournisseurs gestionFrs) {
  print("Entrez le nom du fournisseur à rechercher:");
  String nom = stdin.readLineSync() ?? '';
  
  var fournisseur = gestionFrs.rechercherFournisseurParNom(nom);
  if (fournisseur != null) {
    print('Fournisseur trouvé: ID=${fournisseur.fournisseurId}, Nom=${fournisseur.nom}, Adresse=${fournisseur.adresse}, Téléphone=${fournisseur.telephone}');
  } else {
    print('Fournisseur avec le nom "$nom" non trouvé.');
  }
}

/***********************************************************Utilisateur*****************************************************************/

void ajouterutilisateur(GestionUtilisateurs gestionUtilisateurs) {
  print("----------- Ajouter des utilisateurs----------");
    print("Combien d'utilisateur vous voulez ajouter");
    int ajouter = int.parse(stdin.readLineSync() ?? "");  
    int i;
    for(i = 1; i <= ajouter; i++ ){
      print("Ajout de l'utilisateur $i :");
      gestionUtilisateurs.ajouterUtilisateur();
    }
     print("Utilisateur ajouter avec succès !");
     gestionUtilisateurs.afficherUtilisateurs();
}

void modifierutilisateur(GestionUtilisateurs gestionUtilisateurs) {
  print("----------- Modifier un utilisateurs----------");
GestionUtilisateurs gestionUtilisateurs = GestionUtilisateurs();
    print("Donnez l'ID de l'utilisateur à Modifier");
    int modifier = int.parse(stdin.readLineSync() ?? "");  
         gestionUtilisateurs.modifierUtilisateur(modifier);
        gestionUtilisateurs.afficherUtilisateurs();
}

void supprimerutilisateur(GestionUtilisateurs gestionUtilisateurs) {
  gestionUtilisateurs.afficherUtilisateurs();
  print("Donnez l'ID de l'utilisateur à supprimer");
  int supprimer = int.parse(stdin.readLineSync() ?? "");  
  gestionUtilisateurs.supprimerUtilisateur(supprimer);
}

void rechercherutilisateurParNom(GestionUtilisateurs gestionUtilisateurs) {
  print("----------- Rechercher un utilisateur par nom----------");
  GestionUtilisateurs gestionUtilisateurs = GestionUtilisateurs();
  print("Donnez le nom de l'utilisateur à chercher");
  String rechercheNom = stdin.readLineSync() ?? ""; 
  gestionUtilisateurs.rechercherParNom(rechercheNom);
}

/***********************************************************Bon d'entrée******************************************************************/


/***********************************************************Bon de sortie*****************************************************************/
void ajouterBonSortie(GestionBonSortie gestionBonSortie) {
  print("Entrez les informations du bon de sortie à ajouter:");
  print("Motif:");
  String motif = stdin.readLineSync() ?? "";
  print("Date de sortie (format: YYYY-MM-DD):");
  DateTime dateSortie = DateTime.parse(stdin.readLineSync() ?? "");
  print("ID de l'utilisateur:");
  int utilisateurId = int.parse(stdin.readLineSync() ?? "0");

  gestionBonSortie.creerBonSortie(motif, dateSortie, utilisateurId);
  print("Bon de sortie ajouté avec succès !");
}

void modifierBonSortie(GestionBonSortie gestionBonSortie) {
  print("Entrez l'ID du bon de sortie à modifier:");
  int bonSortieId = int.parse(stdin.readLineSync() ?? "0");
  print("Entrez les nouvelles informations pour le bon de sortie:");
  print("Motif:");
  String motif = stdin.readLineSync() ?? "";
  print("Date de sortie (format: YYYY-MM-DD):");
  DateTime dateSortie = DateTime.parse(stdin.readLineSync() ?? "");
  print("ID de l'utilisateur:");
  int utilisateurId = int.parse(stdin.readLineSync() ?? "0");

  gestionBonSortie.modifierBonSortie(bonSortieId, motif: motif, dateSortie: dateSortie, utilisateurId: utilisateurId);
  print("Bon de sortie modifié avec succès !");
}

void supprimerBonSortie(GestionBonSortie gestionBonSortie) {
  print("Entrez l'ID du bon de sortie à supprimer:");
  int bonSortieId = int.parse(stdin.readLineSync() ?? "0");

  gestionBonSortie.supprimerBonSortie(bonSortieId);
  print("Bon de sortie supprimé avec succès !");
}

void rechercherBonSortie(GestionBonSortie gestionBonSortie) {
  print("Entrez l'ID du bon de sortie à rechercher:");
  int bonSortieId = int.parse(stdin.readLineSync() ?? "0");

  try {
    BonSortie bon = gestionBonSortie.rechercherParId(bonSortieId);
    print('Bon trouvé : $bon');
  } catch (e) {
    print(e);
  }
}

/***************************************************************FIN***********************************************************************/