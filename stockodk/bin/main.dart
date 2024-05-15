
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
    
    Utilisateur utilisateur1 = Utilisateur(1, "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou", "motdepasse123", Role.administrateur);
    Utilisateur utilisateur2 = Utilisateur(2, "Atou Carter", "atou@gmail.com", "atou", "password", Role.manager);
    Utilisateur utilisateur3 = Utilisateur(3, "Moussa Goita", "moussa@gmail.com", "moussa", "password", Role.vendeur);

    Produit.ajouterProduit(Produit(1, "14 pro max", "512go", 34.78, 34));
    Produit.ajouterProduit(Produit(2, "Stylo", "Red", 20, 4));
    Produit.ajouterProduit(Produit(3, "Oridnateur Dell", "Hp", 78, 12));

    void choixuser(){
      print("Veuillez choisir votre tâche à faire :");
      print("1 : Afficher les informations");      
      print("2 : Ajouter un produit");
      print("3 : Modifier un produit");
      print("4 : Supprimer un produit");
      print("5 : Rechercher un produit");
      print("6 : Ajouter un fournisseur");
      print("7 : Modifier un fournisseur");
      print("8 : Supprimer un fournisseur");
      print("9 : Rechercher un fournisseur");
      print("10 : Ajouter un bon d'entrée");
      print("11 : Modifier un bon d'entrée");
      print("12 : Supprimer un bon d'entrée");
      print("13 : Rechercher un bon d'entrée");
    }

    print("Veuillez entrer votre login :");
    String login = stdin.readLineSync() ?? "";
    print("Veuillez entrer votre mot de passe:");
    String password = stdin.readLineSync() ?? "";
    
    if(login == '' || password == ''){
      print("Idendifiants incorrects !");
      return;
    }
    else if (login == 'moussa' && password == 'password'){
      print("Bienvenue Vendeurni! Vous pouvez voir la liste des produits.");
      Produit.afficherTousProduit();
    }

    else if (login == 'atou' && password == 'password'){
      print("Bienvenue Manager! ");
      choixuser();
      String choix = stdin.readLineSync() ?? "";
      switch (choix) {
        case "1":
          print("*************** Ici nous avons les informations *****************");
          Produit.afficherTousProduit();
          //Fournisseur.afficherTousFournisseurs();
          //BonEntree.afficherTousBonsEntree();
          //BonSortie.afficherTousBonsSortie();
          //DetailsEntree.afficherTousDetailsEntree();
          //DetailsSortie.afficherTousDetailsSortie();
          break;
        case "2":
          print("*************** Ici nous pouvons ajouter un produit *****************");
          print("Entrez les informations du produit à ajouter:");
          print("Nom du produit:");
          String nomProduit = stdin.readLineSync() ?? "";
          print("Description du produit:");
          String descriptionProduit = stdin.readLineSync() ?? "";
          print("Prix d'achat du produit:");
          double prixAchat = double.parse(stdin.readLineSync() ?? "0");
          print("Quantité en stock");
          int quantiteStock = int.parse(stdin.readLineSync() ?? "0");
          break;
      }
    }

    else if (login == 'Aliou' && password == 'motdepasse123'){
      print("Bienvenue Admin! ");
      Produit.afficherTousProduit();
    }

    else {
      print("Vous n'avez rien à faire ici !");
    }
}
    /*  try {
    print("*************** Ici nous avons les utilisateurs *****************");
    print("Liste des Utilisateurs : ");
    print("Nom : ${utilisateur2.nomUtilisateur} - ${utilisateur2.contact} - ${utilisateur2.pseudo} - ${utilisateur2.motDePasse} - ${utilisateur2.role}");
    print("Nom : ${utilisateur1.nomUtilisateur} - ${utilisateur1.contact} - ${utilisateur1.pseudo} - ${utilisateur1.motDePasse} - ${utilisateur1.role}");
    
    print("*************** Ici nous avons les Fournisseurs *****************");
    
    var gestionFrs = GestionFournisseurs();

    gestionFrs.ajouterFournisseur(Fournisseur(
      fournisseurId: 1, nom: "Balla", adresse: "Bamako", telephone: '2378'));
      gestionFrs.ajouterFournisseur(Fournisseur(
      fournisseurId: 2, nom: "Oumar", adresse: "Kayes", telephone: '123'));

    print("Liste des Fournisseurs : ");
    gestionFrs.afficherFournisseur();
    
    
    print("*************** Ici nous avons les produits *****************");
    
    Produit.ajouterProduit(Produit(1, "14 pro max", "512go", 34.78, 34));
    Produit.ajouterProduit(Produit(2, "Stylo", "Red", 20, 4));
    Produit.ajouterProduit(Produit(3, "Oridnateur Dell", "Hp", 78, 12));
    Produit.afficherTousProduit();
    print("Aprés suppression du produit n° 1");
    Produit.supprimerProduit(1);
    Produit.afficherTousProduit();

    print("Recherche du produit n°2");
    Produit? produitById = Produit.searchById(2);
    if (produitById != null) {
      print("Produit trouvé par identifiant: ${produitById.nom_produit}");
      } else {
        print("Aucun produit trouvé par identifiant");
        }
        
        List<Produit> produitsByName = Produit.searchByName("Bazin");
        if (produitsByName.isNotEmpty) {
          print("Produits trouvés par son nom:");
          produitsByName.forEach((product) => print("ID: ${product.produit_id}, Nom: ${product.nom_produit}, Description: ${product.description}, Prix: ${product.prix}, Quantité en stock: ${product.quantite_en_stock}"));
          } else {
            print("Aucun produit trouvé par nom");
            }
            Produit? produitConsultation = Produit.searchById(2);
            if (produitConsultation != null) {
              produitConsultation.consultationStock();
              } else {
                print("Produit non trouvé.");
                }

  print("*************** Ici nous avons les BonEntres *****************");

  BonEntree.ajouterBonEntree(1, "22-05-2020", "Livré", 1, 1);
  BonEntree.ajouterBonEntree(2, "22-03-2023", "Encours", 1, 2);
  BonEntree.ajouterBonEntree(3, "12-05-2024", "Encours", 1, 2);
  BonEntree.afficherBonsEntree();

  BonEntree.rechercherBonEntreeParId(2);
  
  print("*************** Ici nous avons les details du bon d'entre *****************");
  
  DetailsEntree firstEntre = DetailsEntree(1, 10, 34.78, 2, 1);
  DetailsEntree firstEntre1 = DetailsEntree(2, 13, 78, 2, 1);
  DetailsEntree firstEntre2 = DetailsEntree(3, 4, 50.5, 1, 2);
  afficherDetails(firstEntre);
  afficherDetails(firstEntre1);
  afficherDetails(firstEntre2);
  print("Modification du bon n°1"); 
  DetailsEntree detailsModifie= DetailsEntree(1, 10, 34.78, 1, 1); 
  //Modification details entree
  detailsModifie.modifierDetailsEntree(detailsModifie);
  print("Detail entrée modifiée");
  afficherDetails(detailsModifie); 

  //suppression de details entree
  firstEntre.supprimerDetailsEntree(1);
  print("\nDétail d'entree supprimée");

  print("*************** Ici nous avons les Bon Sorties *****************");
  
  var gestionnaire = Bon_Sortie(0,"", DateTime.now(), 0);
  gestionnaire.creerBonSortie(1, "Achat de fournitures de bureau", DateTime(2024, 5, 10), 1);
  gestionnaire.creerBonSortie(2, "Achat d'équipement informatique", DateTime(2024, 5, 15), 2); 
  gestionnaire.afficherBonsSortie();
    
  print("*************** Ici nous avons les details sortiies *****************"); 
  var gestion = GestionDetailsSortie();
  gestion.ajouterDetailSortie(5, 1500.0, null, 1, 1);
  gestion.modifierDetailSortie(1, quantite: 10, prixTotal: 3000.0);
  print(gestion.listerDetailsSortie());
  gestion.supprimerDetailSortie(1);
  print(gestion.listerDetailsSortie());
  } catch (e) {
    print(e);
  }
}
void afficherDetails(DetailsEntree details ){
    print("id: ${details.id}");
    print("la quantite: ${details.quant}, le prix total: ${details.prixtotal}, l'id produit: ${details.idprod}, l'id bon entree': ${details.idbonentree}, l'id");

  }
*/