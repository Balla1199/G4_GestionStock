import 'dart:io';

class AutoIncrement {
  static int _currentId = 1;

  static int get nextId => _currentId++;
}

class Produit {
  int produitId;
  String nomProduit;
  String description;
  double prix;
  int quantite_en_stock;

  Produit(this.nomProduit, this.description, this.prix, this.quantite_en_stock)
      : produitId = AutoIncrement.nextId;
  @override
  String toString() {
    return 'Produit{id: $produitId, nomProduit: $nomProduit, quantite: $quantite_en_stock, description: $description, prix: $prix}';
  }
}

List<Produit> listeProduits = [];
void ajouterProduit() {
  print('Entrez le nom du produit :');
  var nomProduit = stdin.readLineSync()!;
  if (listeProduits.any((produit) => produit.nomProduit == nomProduit)) {
    print('Erreur : Le nom du produit doit être unique.');
    return;
  }
  print('Entrez la description :');
  var description = stdin.readLineSync()!;

  print('Entrez le prix :');
  var prix = double.parse(stdin.readLineSync()!);
  print('Entrez la quantité :');
  var quantite_en_stock = int.parse(stdin.readLineSync()!);
  var nouveauProduit =
      Produit(nomProduit, description, prix, quantite_en_stock);
  listeProduits.add(nouveauProduit);

  print('Produit ajouté avec succès : $nouveauProduit');
}

void modifierProduit() {
  print('Entrez l\'ID du produit à modifier :');
  var idProduit = int.parse(stdin.readLineSync()!);
  var produit = listeProduits.firstWhere((produit) => idProduit == idProduit,
      orElse: () => throw Exception('ID non trouvé'));

  // ignore: unnecessary_null_comparison
  if (produit == null) {
    print("Erreur : Produit avec l'ID $idProduit n'existe pas.");
    return;
  }

  print('Que souhaitez-vous modifier ?');
  print('1. Nom du produit');
  print('2. Quantité');
  print('3. Description');
  print('4. Prix');
  var choix = int.parse(stdin.readLineSync()!);

  switch (choix) {
    case 1:
      print('Nouveau nom du produit :');
      var nouveauNom = stdin.readLineSync()!;
      if (listeProduits.any((p) => p.nomProduit == nouveauNom)) {
        print('Erreur : Le nom du produit doit être unique.');
        return;
      }
      produit.nomProduit = nouveauNom;
      break;
    case 2:
      print('Nouvelle quantité :');
      produit.quantite_en_stock = int.parse(stdin.readLineSync()!);
      break;
    case 3:
      print('Nouvelle description :');
      produit.description = stdin.readLineSync()!;
      break;
    case 4:
      print('Nouveau prix :');
      produit.prix = double.parse(stdin.readLineSync()!);
      break;
    default:
      print('Choix invalide.');
      return;
  }

  print('Produit modifié avec succès : $produit');
}

void afficherProduits() {
  if (listeProduits.isEmpty) {
    print("Aucun produit disponible.");
  } else {
    for (var produit in listeProduits) {
      print(produit);
    }
  }
}

void supprimerProduit() {
  print('Entrez l\'ID du produit à supprimer :');
  var idProduit = int.parse(stdin.readLineSync()!);
  var produitExistant = listeProduits.any((produit) => idProduit == idProduit);

  if (!produitExistant) {
    print("Erreur : Produit avec l'ID $idProduit n'existe pas.");
    return;
  }

  listeProduits.removeWhere((produit) => idProduit == idProduit);
  print('Produit supprimé avec succès.');
}

//Recherche Produit Par son nom
void rechercherProduitParNom() {
  print('Entrez le nom du produit à rechercher :');
  var nomProduit = stdin.readLineSync()!;
  var produitsTrouves = listeProduits
      .where((produit) =>
          produit.nomProduit.toLowerCase() == nomProduit.toLowerCase())
      .toList();

  if (produitsTrouves.isEmpty) {
    print('Aucun produit trouvé avec le nom : $nomProduit');
  } else {
    for (var produit in produitsTrouves) {
      print(produit);
    }
  }
}

void afficherProduit(List<Produit> listeProduits) {
  print('Liste des produits :');
  for (var produit in listeProduits) {
    print('${produit.produitId}: ${produit.nomProduit}');
  }
}

// void addProduit(
//     String nom, String description, double prix, int quantiteEnStock) {
//   int idProduit = AutoIncrement.nextId;
//   // Ajouter le produit à la liste des produits
//   listeProduits
//       .add(Produit(idProduit, nom, description, prix, quantiteEnStock));
//   print("Produit ajouté avec succès.");
// }
//  List<Produit> get produits => _produits;

// void consultationStock() {
//   print('Quantité en stock de $nom_produit : $quantite_en_stock');
// }

// void afficherDetails() {
//   print(
//       'ID: $produit_id, Nom: $nom_produit, Prix: $prix, Quantité: $quantite_en_stock');
// }

//Methode de recherche par id
Produit? searchById(int produitId) {
  Produit? produit;
  try {
    produit = listeProduits.firstWhere((p) => p.produitId == produitId);
  } catch (e) {
    print("Aucun produit trouvé par identifiant $produitId");
  }
  return produit;
}

//Methode de recherche par NOM
// List<Produit> searchByName(String nomProduit) {
//   return listeProduits
//       .where((produit) => listeProduits.nomProduit
//           .toLowerCase()
//           .contains(nomProduit.toLowerCase()))
//       .toList();
// }

// Methode de recherche par description
// List<Produit> searchByDescription(String description) {
//   return _produits
//       .where((produit) => produit.description
//           .toLowerCase()
//           .contains(description.toLowerCase()))
//       .toList();
// }

// void afficherTousProduit() {
//   print('Liste des Produits :');
//   _produits.forEach((article) {
//     article.afficherDetails();
//   });
// }

// void ajouterProduit(Produit produit) {
//   if (!_produits.contains(produit)) {
//     _produits.add(produit);
//   }
// }

// void modifierProduit(int produit_id,
//     {String? nom_produit,
//     String? description,
//     double? prix,
//     int? quantite_en_stock}) {
//   Produit? produitExist = searchById(produit_id);

//   if (produitExist != null) {
//     if (nom_produit != null) produitExist.nom_produit = nom_produit;
//     if (description != null) produitExist.description = description;
//     if (prix != null) produitExist.prix = prix;
//     if (quantite_en_stock != null)
//       produitExist.quantite_en_stock = quantite_en_stock;
//   } else {
//     print("Produit avec l'ID $produit_id introuvable");
//   }
// }

// void supprimerProduit(int produit_id) {
//   _produits.removeWhere((produit) => produit.produit_id == produit_id);
// }

// Méthode pour initialiser les produits
//   void initialiserProduits() {
//     if (_produits.isEmpty) {
//       ajouterProduit(Produit(1, "Ordinateur portable",
//           "Ordinateur portable avec écran tactile.", 999.99, 10));
//       ajouterProduit(Produit(2, "Souris sans fil",
//           "Souris ergonomique avec technologie sans fil.", 29.99, 20));
//       ajouterProduit(Produit(3, "Clavier mécanique",
//           "Clavier rétroéclairé avec switches mécaniques.", 149.99, 5));

//       ajouterProduit(Produit(4, "Écouteurs Bluetooth",
//           "Écouteurs sans fil avec suppression de bruit.", 79.99, 15));
//       ajouterProduit(Produit(5, "Disque dur externe",
//           "Disque dur externe portable de 1 To.", 79.99, 8));
//       ajouterProduit(Produit(6, "Imprimante laser",
//           "Imprimante laser monochrome avec Wi-Fi.", 199.99, 3));
//     }
//   }
// }

/*void main() {
  Produit.initialiserProduits();

  Produit.modifierProduit(2, nom_produit: "Souris optique", description: "Souris sans fil avec capteur optique.");
  Produit.supprimerProduit(1);

  Produit.afficherTousProduit();

  Produit? produitById = Produit.searchById(6);
  if (produitById != null) {
    print("Produit trouvé par identifiant: ${produitById.nom_produit}");
  } else {
    print("Aucun produit trouvé par identifiant");
  }

  List<Produit> produitsByName = Produit.searchByName("Souris");
  if (produitsByName.isNotEmpty) {
    print("Produits trouvés par son nom:");
    produitsByName.forEach((product) => print(
        "ID: ${product.produit_id}, Nom: ${product.nom_produit}, Description: ${product.description}, Prix: ${product.prix}, Quantité en stock: ${product.quantite_en_stock}"));
  } else {
    print("Aucun produit trouvé par nom");
  }

  Produit? produitConsultation = Produit.searchById(2);
  if (produitConsultation != null) {
    produitConsultation.consultationStock();
  } else {
    print("Produit non trouvé.");
  }
}

*/
