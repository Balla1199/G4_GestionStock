class DetailsSortie {
  int detailsSortieId;
  int quantite;
  double prixTotal;
  DateTime? dateExpiration;
  int bonSortieId;
  int produitId;

  DetailsSortie({
    required this.detailsSortieId,
    required this.quantite,
    required this.prixTotal,
    this.dateExpiration,
    required this.bonSortieId,
    required this.produitId,
  });

  @override
  String toString() {
    return 'DetailsSortie{id: $detailsSortieId, quantite: $quantite, prixTotal: $prixTotal, dateExpiration: $dateExpiration, bonSortieId: $bonSortieId, produitId: $produitId}';
  }
}

class GestionDetailsSortie {
  int _nextId = 1;
  List<DetailsSortie> _details = [];

  void ajouterDetailSortie(int quantite, double prixTotal, DateTime? dateExpiration, int bonSortieId, int produitId) {
    var newDetail = DetailsSortie(
      detailsSortieId: _nextId++,
      quantite: quantite,
      prixTotal: prixTotal,
      dateExpiration: dateExpiration,
      bonSortieId: bonSortieId,
      produitId: produitId,
    );
    _details.add(newDetail);
    print('Détail de sortie ajouté avec succès: $newDetail');
  }

  List<DetailsSortie> listerDetailsSortie() {
    return _details;
  }

  void modifierDetailSortie(int id, {int? quantite, double? prixTotal, DateTime? dateExpiration, int? bonSortieId, int? produitId}) {
    var detail = _details.firstWhere((d) => d.detailsSortieId == id, orElse: () => throw Exception('Détail non trouvé'));
    if (quantite != null) detail.quantite = quantite;
    if (prixTotal != null) detail.prixTotal = prixTotal;
    if (dateExpiration != null) detail.dateExpiration = dateExpiration;
    if (bonSortieId != null) detail.bonSortieId = bonSortieId;
    if (produitId != null) detail.produitId = produitId;
    print('Détail de sortie modifié avec succès: $detail');
  }

  void supprimerDetailSortie(int id) {
    _details.removeWhere((d) => d.detailsSortieId == id);
    print('Détail de sortie supprimé avec succès');
  }

  // Recherche de détail de sortie par identifiant
  DetailsSortie rechercherParId(int id) {
    try {
      return _details.firstWhere((detail) => detail.detailsSortieId == id);
    } catch (e) {
      throw Exception('Détail de sortie non trouvé pour l\'ID: $id');
    }
  }

  // Recherche de détails de sortie par date d'expiration
  List<DetailsSortie> rechercherParDateExpiration(DateTime dateRecherche) {
    return _details.where((detail) => detail.dateExpiration != null && detail.dateExpiration!.isAtSameMomentAs(dateRecherche)).toList();
  }
}

/*
void main() {
  var gestion = GestionDetailsSortie();
  gestion.ajouterDetailSortie(5, 1500.0, null, 1, 1);
  print(gestion.listerDetailsSortie());
  gestion.modifierDetailSortie(1, quantite: 10, prixTotal: 3000.0);
  print(gestion.listerDetailsSortie());
  gestion.supprimerDetailSortie(1);
  print(gestion.listerDetailsSortie());

  var gestion2 = GestionDetailsSortie();
  gestion2.ajouterDetailSortie(5, 1500.0, DateTime.parse('2024-10-01'), 1, 1);
  gestion2.ajouterDetailSortie(10, 3000.0, DateTime.parse('2024-10-01'), 2, 2);

  try {
    var detail = gestion2.rechercherParId(1);
    print('Recherche par ID: $detail');
  } catch (e) {
    print(e);
  }

  var detailsParDate = gestion2.rechercherParDateExpiration(DateTime.parse('2024-10-01'));
  print('Recherche par date d\'expiration: $detailsParDate');
}
*/