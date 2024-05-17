import 'dart:io';

class BonEntree {
  int bonEntreeId;
  String dateDeCommande;
  String statut;
  int utilisateurId;
  int fournisseurId;

  BonEntree(this.bonEntreeId, this.dateDeCommande, this.statut, this.utilisateurId, this.fournisseurId);

  @override
  String toString() {
    return 'BonEntree{id: $bonEntreeId, dateDeCommande: $dateDeCommande, statut: $statut, utilisateurId: $utilisateurId, fournisseurId: $fournisseurId}';
  }
}

class GestionBonEntree {
  int _nextId = 1;
  List<BonEntree> _bonEntreeList = [];

  void ajouterBonEntree(String dateDeCommande, String statut, int utilisateurId, int fournisseurId) {
    var nouveauBonEntree = BonEntree(_nextId++, dateDeCommande, statut, utilisateurId, fournisseurId);
    _bonEntreeList.add(nouveauBonEntree);
  }

  void afficherBonsEntree() {
    for (var bon in _bonEntreeList) {
      print(bon);
    }
  }

  void modifierBonEntree(int id, {String? dateDeCommande, String? statut, int? utilisateurId, int? fournisseurId}) {
    var bon = _bonEntreeList.firstWhere((b) => b.bonEntreeId == id, orElse: () => throw Exception('Bon d\'entrée non trouvé'));
    if (dateDeCommande != null) bon.dateDeCommande = dateDeCommande;
    if (statut != null) bon.statut = statut;
    if (utilisateurId != null) bon.utilisateurId = utilisateurId;
    if (fournisseurId != null) bon.fournisseurId = fournisseurId;
    print('Bon d\'entrée modifié avec succès: $bon');
  }

  void supprimerBonEntree(int id) {
    _bonEntreeList.removeWhere((b) => b.bonEntreeId == id);
    print('Bon d\'entrée supprimé avec succès');
  }

  BonEntree rechercherBonEntreeParId(int id) {
    try {
      return _bonEntreeList.firstWhere((bon) => bon.bonEntreeId == id);
    } catch (e) {
      throw Exception('Bon d\'entrée non trouvé pour l\'ID: $id');
    }
  }
}
