import 'package:stockodk/models/produit.dart';

void main() {
  GestionnaireProduit gestionnaireProduit = GestionnaireProduit();

  // Ajout de produits
  gestionnaireProduit.ajouterProduit(Produit(1, "Ordinateur portable", "Ordinateur portable avec écran tactile.", 999.99, 10));
  gestionnaireProduit.ajouterProduit(Produit(2, "Souris sans fil", "Souris ergonomique avec technologie sans fil.", 29.99, 20));
  gestionnaireProduit.ajouterProduit(Produit(3, "Clavier mécanique", "Clavier rétroéclairé avec switches mécaniques.", 149.99, 5));

  // Ajout d'autres produits
  gestionnaireProduit.ajouterProduit(Produit(4, "Écouteurs Bluetooth", "Écouteurs sans fil avec suppression de bruit.", 79.99, 15));
  gestionnaireProduit.ajouterProduit(Produit(5, "Disque dur externe", "Disque dur externe portable de 1 To.", 79.99, 8));
  gestionnaireProduit.ajouterProduit(Produit(6, "Imprimante laser", "Imprimante laser monochrome avec Wi-Fi.", 199.99, 3));

  // Modification d'un produit
  gestionnaireProduit.modifierProduit(2, nom_produit: "Souris optique", description: "Souris sans fil avec capteur optique.");

  // Suppression d'un produit
  gestionnaireProduit.supprimerProduit(1);

  // Affichage des produits restants
  print("Produits restants:");
  gestionnaireProduit.produits.forEach((produit) {
    print("ID: ${produit.produit_id}, Nom: ${produit.nom_produit}, Description: ${produit.description}, Prix: ${produit.prix}, Quantité en stock: ${produit.quantite_en_stock}");
  });

  // Recherche par ID
  Produit? produitById = gestionnaireProduit.searchById(2);
  if (produitById != null) {
    print("Produit trouvé par identifiant: ${produitById.nom_produit}");
  } else {
    print("Aucun produit trouvé par identifiant");
  }

  // Recherche par nom
  List<Produit> produitsByName = gestionnaireProduit.searchByName("Souris");
  if (produitsByName.isNotEmpty) {
    print("Produits trouvés par nom:");
    produitsByName.forEach((product) => print("ID: ${product.produit_id}, Nom: ${product.nom_produit}, Description: ${product.description}, Prix: ${product.prix}, Quantité en stock: ${product.quantite_en_stock}"));
  } else {
    print("Aucun produit trouvé par nom");
  }

  // Recherche par description
  List<Produit> produitsByDescription = gestionnaireProduit.searchByDescription("mécaniques");
  if (produitsByDescription.isNotEmpty) {
    print("Produits trouvés par description:");
    produitsByDescription.forEach((product) => print("ID: ${product.produit_id}, Nom: ${product.nom_produit}, Description: ${product.description}, Prix: ${product.prix}, Quantité en stock: ${product.quantite_en_stock}"));
  } else {
    print("Aucun produit trouvé par description");
  }
}


