
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
  var detailsEntrees = [firstEntre, firstEntre1, firstEntre2];

  var gestionnaire = Bon_Sortie(0, "", DateTime.now(), 0);
  gestionnaire.creerBonSortie(1, "Achat de fournitures de bureau", DateTime(2024, 5, 10), 1);
  gestionnaire.creerBonSortie(2, "Achat d'équipement informatique", DateTime(2024, 5, 15), 2);

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
    gestionnaire.afficherBonsSortie();
    print(detailsEntrees);
    gestion.listerDetailsSortie();
  }
  
  void admin() {
    void choixuser(){
      print("Veuillez choisir votre tâche à faire :");
      print("1: Afficher les informations");      
      print("2: Ajouter un détail sortie");
      print("3: Modifier un détail sortie");
      print("4: Supprimer un détail sortie");
      print("5: Rechercher un détail de sortie par ID");
      print("6: Rechercher des détails de sortie par date d'expiration");
      print("7: Quitter");
    }
 
    while(true){
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
          return;
        default: print('Option non valide. Veuillez choisir une option valide.');
      }
    }
  }

  void manager () {
    print("Manager puissant !!!! ");

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
      Produit.afficherTousProduit();
      break;

    default: print("Vous n'avez rien à ajouter");  
  }


}

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