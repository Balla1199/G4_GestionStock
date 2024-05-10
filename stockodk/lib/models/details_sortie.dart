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
    required this.produitId
  });

  @override
  String toString() {
    return 'DetailsSortie{detailsSortieId: $detailsSortieId, quantite: $quantite, prixTotal: $prixTotal, bonSortieId: $bonSortieId, produitId: $produitId}';
  }
}