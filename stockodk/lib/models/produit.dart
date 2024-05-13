class Produit {
  //Déclaration des attributs/proprités/caracteriques de la classe Produit
  int produit_id;
  String nom_produit;
  String description;
  double prix;
  int quantite_en_stock;

  // Définition d'un constructeur pour la classe Produit
  Produit(this.produit_id, this.nom_produit, this.description, this.prix, this.quantite_en_stock);
}

// Création de la lasse GestionnaireProduit, qui est utilisée pour gérer les opérations sur les produits, telles que l'ajout, la modification et la suppression.
class GestionnaireProduit {

  //déclaration une liste privée _produits qui contiendra les objets Produit ajoutés 
  List<Produit> _produits = []; 

  //Définition d'une méthode get appelée produits qui renvoie la liste _produits
  List<Produit> get produits => _produits;


  // Définition de la methode d'ajout de produit à la liste _produits
  void ajouterProduit(Produit produit) {
    _produits.add(produit);
  }

  // Cette méthode permet de modifier les attributs d'un produit existant en fonction de son identifiant
  void modifierProduit(int produit_id, {String? nom_produit, String? description, double? prix, int? quantite_en_stock}) {
    Produit produitExist = _produits.firstWhere((produit) => produit.produit_id == produit_id, orElse: () => throw ArgumentError("Produit avec l'ID $produit_id introuvable"));
    
    // Vérifie si le produit rechercher existe 
    if (produitExist != null) {
      
      // Ces lignes modifient les attributs du produit existant avec les nouvelles valeurs spécifiées, si on les fournies.
      if (nom_produit != null) produitExist.nom_produit = nom_produit;
      if (description != null) produitExist.description = description;
      if (prix != null) produitExist.prix = prix;
      if (quantite_en_stock != null) produitExist.quantite_en_stock = quantite_en_stock;
    }
  }

  // Cette méthode permet de supprimer un produit de la liste _produits en fct de son id
  void supprimerProduit(int produit_id) {
    _produits.removeWhere((produit) => produit.produit_id == produit_id);
    
  }

// Implementation de la methode de recharge de produit 
Produit? searchById(int produit_id) {
  Produit? produit;
  try {
    produit = _produits.firstWhere((p) => p.produit_id == produit_id);
  } catch (e) {
    print("Aucun produit trouvé par identifiant $produit_id");
    // Vous pouvez lancer une exception personnalisée ici si nécessaire
  }
  return produit;
}

  // Méthode de recherche par nom
  List<Produit> searchByName(String nom_produit) {
    return _produits.where((produit) => produit.nom_produit.toLowerCase().contains(nom_produit.toLowerCase())).toList();
  }

  // Méthode de recherche par description
  List<Produit> searchByDescription(String description) {
    return _produits.where((produit) => produit.description.toLowerCase().contains(description.toLowerCase())).toList();
  }



}


