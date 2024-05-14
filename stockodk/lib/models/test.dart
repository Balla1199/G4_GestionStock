// import 'dart:io';

// class Employe {
//   String nom;
//   String prenom;
//   int age;
//   String poste;

//   Employe(this.nom, this.prenom, this.age, this.poste);

//   void afficherDetails() {
//     print('Nom: $nom, Prénom: $prenom, Âge: $age, Poste: $poste');
//   }
// }

// void main() {
//   // Demander à l'utilisateur de saisir les détails de l'employé
//   print('Entrez le nom de l\'employé:');
//   var nom = stdin.readLineSync();

//   print('Entrez le prénom de l\'employé:');
//   var prenom = stdin.readLineSync();

//   print('Entrez l\'âge de l\'employé:');
//   var age = int.parse(stdin.readLineSync());

//   print('Entrez le poste de l\'employé:');
//   var poste = stdin.readLineSync();

//   // Créer l'employé avec les détails saisis par l'utilisateur
//   Employe employe = Employe(nom, prenom, age, poste);

//   // Afficher les détails de l'employé
//   print('Détails de l\'employé créé:');
//   employe.afficherDetails();
// }


//      var gestionnaire = GestionnaireBonSortie();

//     // Création d'un bon de sortie pour un achat de fournitures de bureau
//     gestionnaire.creerBonSortie(1, "Achat de fournitures de bureau", DateTime(2024, 5, 10), 1);

//     // Modification du bon de sortie
//     gestionnaire.modifierBonSortie(0, 1, "moi", DateTime(2024, 5, 11), 234);

//     // Affichage des bons de sortie après la modification
//     gestionnaire.afficherBonsSortie();

//     // Suppression du bon de sortie
//     gestionnaire.supprimerBonSortie(0);

//     // Affichage des bons de sortie après la suppression
//     gestionnaire.afficherBonsSortie();

//     // Création d'autres bons de sortie
//     gestionnaire.creerBonSortie(1, "Achat d'ordinateur et iphon 15 pros max", DateTime(2024, 5, 24), 243);
//     gestionnaire.creerBonSortie(2, "Déjeuner d'équipe", DateTime(2024, 5, 11), 456);
//     gestionnaire.creerBonSortie(3, "Envoi de colis à un client", DateTime(2024, 5, 12), 789);

//     // Affichage des bons de sortie après les ajouts
//     gestionnaire.afficherBonsSortie();

//     // Recherche d'un bon de sortie par ID
//     var bon = gestionnaire.rechercherBonSortieParId(1);
//     if (bon != null) {
//       print("Bon de sortie trouvé : ID ${bon.bon_sortie_id}, Motif ${bon.motif}, Date ${bon.date_sortie}, Utilisateur ID ${bon.utilisateur_id}");
//     } else {
//       print("Aucun bon de sortie trouvé pour l'identifiant spécifié.");
//     }

//     // Recherche de bons de sortie par date
//     var dateRecherchee = DateTime(2024, 5, 11);
//     var bonsParDate = gestionnaire.rechercherBonsSortieParDate(dateRecherchee);
//     if (bonsParDate.isNotEmpty) {
//       print("Bons de sortie pour la date $dateRecherchee :");
//       bonsParDate.forEach((bon) {
//         print("ID ${bon.bon_sortie_id}, Motif ${bon.motif}, Utilisateur ID ${bon.utilisateur_id}");
//       });
//     } else {
//       print("Aucun bon de sortie trouvé pour la date spécifiée.");
//     }
    
//     print("*************** Ici nous avons lee details sortiies *****************"); 
//     var gestion = GestionDetailsSortie();
//     gestion.ajouterDetailSortie(5, 1500.0, null, 1, 1);
//     print(gestion.listerDetailsSortie());
//     gestion.modifierDetailSortie(1, quantite: 10, prixTotal: 3000.0);
//     print(gestion.listerDetailsSortie());
//     gestion.supprimerDetailSortie(1);
//     print(gestion.listerDetailsSortie());

//     print("*************** Ici nous avons les details du bon d'entre *****************");
//     DetailsEntree firstEntre = DetailsEntree(1, 8, 45000.00, 1, 1);
//     print("Ceci est notre tout premier details entree");
//     print("la quantite = ${firstEntre.quant}");
//     DetailsEntree detailsModifie= DetailsEntree(1, 10, 50.0, 5, 7);

//     //Modification details entree
//     detailsModifie.modifierDetailsEntree(detailsModifie);
//     print("Detail entrée modifiée");
//     afficherDetails(detailsModifie); 

//     //suppression de details entree
//     firstEntre.supprimerDetailsEntree(1);
//     print("\nDétail d'entree supprimée");

//     print("*************** Ici nous avons les Fournisseurs *****************");

// var gestionFrs = GestionFournisseurs();

//     gestionFrs.ajouterFournisseur(Fournisseur(
//       fournisseurId: 1, nom: "Oumar", adresse: "Bamako", telephone: '2378'));
//       gestionFrs.ajouterFournisseur(Fournisseur(
//       fournisseurId: 2, nom: "Oumar", adresse: "Bamako", telephone: '2378'));
//     gestionFrs.afficherFournisseur();

//     print("*************** Ici nous avons les Produits *****************");

// Produit.ajouterProduit(Produit(1, "Ordinateur portable", "Ordinateur portable avec écran tactile.", 999.99, 10));
//     Produit.ajouterProduit(Produit(2, "Souris sans fil", "Souris ergonomique avec technologie sans fil.", 29.99, 20));
//     Produit.ajouterProduit(Produit(3, "Clavier mécanique", "Clavier rétroéclairé avec switches mécaniques.", 149.99, 5)); 
//     Produit.afficherTousProduit();
//     Produit.supprimerProduit(1);
//     print("Nous allons Supprimer le produit avec 1");
//     Produit.afficherTousProduit();
//     print("Nous allons recuperer le produit avec 6");
//     Produit.searchById(2);
//     print("Nous allons recuperer le produit avec le nom Souris");
//     Produit.searchByName("OK");

//     print("*************** Ici nous avons les BonEntree *****************");

  //   var gestionnaire = Bon_Sortie(0,"", DateTime.now(), 0);

  // // Création d'un bon de sortie pour un achat de fournitures de bureau
  // gestionnaire.creerBonSortie(1, "Achat de fournitures de bureau", DateTime(2024, 5, 10), 1);

  // // Affichage des bons de sortie après la création
  // gestionnaire.afficherBonsSortie();

  // // Ajout d'un nouveau bon de sortie
  // gestionnaire.creerBonSortie(2, "Achat d'équipement informatique", DateTime(2024, 5, 15), 2);

  // // Affichage des bons de sortie après l'ajout
  // gestionnaire.afficherBonsSortie();


  //     print("*************** Ici nous avons les produits *****************");


//      Produit.ajouterProduit(Produit(1, "Balacia", "description", 34.78, 34));
//     Produit.ajouterProduit(Produit(2, "Stylo", "Red", 20, 4));
//     Produit.ajouterProduit(Produit(3, "Bazin", "Fousco", 78, 12));
//     Produit.afficherTousProduit();
//     print("Aprés suppression du produit n° 1");
//     Produit.supprimerProduit(1);
//     Produit.afficherTousProduit();


//     print("Recherche du produit n° 2");
//     Produit? produitById = Produit.searchById(2);
//   if (produitById != null) {
//     print("Produit trouvé par identifiant: ${produitById.nom_produit}");
//   } else {
//     print("Aucun produit trouvé par identifiant");
//   }

//   List<Produit> produitsByName = Produit.searchByName("Bazin");
//   if (produitsByName.isNotEmpty) {
//     print("Produits trouvés par son nom:");
//     produitsByName.forEach((product) => print(
//         "ID: ${product.produit_id}, Nom: ${product.nom_produit}, Description: ${product.description}, Prix: ${product.prix}, Quantité en stock: ${product.quantite_en_stock}"));
//   } else {
//     print("Aucun produit trouvé par nom");
//   }
 
//  Produit? produitConsultation = Produit.searchById(2);
//   if (produitConsultation != null) {
//     produitConsultation.consultationStock();
//   } else {
//     print("Produit non trouvé.");
//   }

  //     print("*************** Ici nous avons les utilisateurs *****************");

    // Utilisateur utilisateur1 = Utilisateur(1, "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou", "motdepasse123", Role.vendeur);
    // Utilisateur utilisateur2 = Utilisateur(2, "Moussa Goita", "moussa@gmail.com", "moussa", "password", Role.manager);
    // print(utilisateur2.nomUtilisateur);


 //     print("*************** Ici nous avons les bonEntre *****************");

    //     BonEntree.ajouterBonEntree(1, "22-05-2025", "nn", 1, 1);
    // BonEntree.afficherBonsEntree();