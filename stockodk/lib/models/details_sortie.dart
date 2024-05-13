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
}
*/