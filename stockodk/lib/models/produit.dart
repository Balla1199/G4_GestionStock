class Produit {
  static List<Produit> _produits = [];

  int produit_id;
  String nom_produit;
  String description;
  double prix;
  int quantite_en_stock;

  Produit(this.produit_id, this.nom_produit, this.description, this.prix, this.quantite_en_stock) {
    _produits.add(this);
  }

  static List<Produit> get produits => _produits;

  void consultationStock() {
    print('Quantité en stock de $nom_produit : $quantite_en_stock');
  }

  void afficherDetails() {
    print('ID: $produit_id, Nom: $nom_produit, Prix: $prix, Quantité: $quantite_en_stock');
  }

// Methode de recherche par id
  static Produit? searchById(int produit_id) {
    Produit? produit;
    try {
      produit = _produits.firstWhere((p) => p.produit_id == produit_id);
    } catch (e) {
      print("Aucun produit trouvé par identifiant $produit_id");
    }
    return produit;
  }
// Methode de recherche par NOM 
  static List<Produit> searchByName(String nom_produit) {
    return _produits.where((produit) => produit.nom_produit.toLowerCase().contains(nom_produit.toLowerCase())).toList();
  }

// Methode de recherche par id
  static List<Produit> searchByDescription(String description) {
    return _produits.where((produit) => produit.description.toLowerCase().contains(description.toLowerCase())).toList();
  }

  static void afficherTousProduit() {
    print('Liste des Produits :');
    _produits.forEach((article) {
      article.afficherDetails();
    });
  }

  static void ajouterProduit(Produit produit) {
    if (!_produits.contains(produit)) {
      _produits.add(produit);
    }
  }

  static void modifierProduit(int produit_id, {String? nom_produit, String? description, double? prix, int? quantite_en_stock}) {
    Produit? produitExist = searchById(produit_id);
    
    if (produitExist != null) {
      if (nom_produit != null) produitExist.nom_produit = nom_produit;
      if (description != null) produitExist.description = description;
      if (prix != null) produitExist.prix = prix;
      if (quantite_en_stock != null) produitExist.quantite_en_stock = quantite_en_stock;
    } else {
      print("Produit avec l'ID $produit_id introuvable");
    }
  }

  static void supprimerProduit(int produit_id) {
    _produits.removeWhere((produit) => produit.produit_id == produit_id);
  }

  // Méthode pour initialiser les produits
  static void initialiserProduits() {
    if (_produits.isEmpty) {
      ajouterProduit(Produit(1, "Ordinateur portable", "Ordinateur portable avec écran tactile.", 999.99, 10));
      ajouterProduit(Produit(2, "Souris sans fil", "Souris ergonomique avec technologie sans fil.", 29.99, 20));
      ajouterProduit(Produit(3, "Clavier mécanique", "Clavier rétroéclairé avec switches mécaniques.", 149.99, 5));

      ajouterProduit(Produit(4, "Écouteurs Bluetooth", "Écouteurs sans fil avec suppression de bruit.", 79.99, 15));
      ajouterProduit(Produit(5, "Disque dur externe", "Disque dur externe portable de 1 To.", 79.99, 8));
      ajouterProduit(Produit(6, "Imprimante laser", "Imprimante laser monochrome avec Wi-Fi.", 199.99, 3));
    }
  }
}



void main() {
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
