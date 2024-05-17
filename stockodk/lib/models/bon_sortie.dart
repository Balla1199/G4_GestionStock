import 'dart:io';

class BonSortie {
  int bonSortieId;
  String motif;
  DateTime? dateSortie;
  int utilisateurId;

  BonSortie({
    required this.bonSortieId,
    required this.motif,
    this.dateSortie,
    required this.utilisateurId,
  });

  @override
  String toString() {
    return 'BonSortie{id: $bonSortieId, motif: $motif, dateSortie: $dateSortie, utilisateurId: $utilisateurId}';
  }
}

class GestionBonSortie {
  int _nextId = 1;
  List<BonSortie> _bonsSortie = [];

  void creerBonSortie(String motif, DateTime? dateSortie, int utilisateurId) {
    var nouveauBonSortie = BonSortie(
      bonSortieId: _nextId++,
      motif: motif,
      dateSortie: dateSortie,
      utilisateurId: utilisateurId,
    );
    _bonsSortie.add(nouveauBonSortie);
  }

  List<BonSortie> listerBonsSortie() {
    return _bonsSortie;
  }

  void modifierBonSortie(int id, {String? motif, DateTime? dateSortie, int? utilisateurId}) {
    var bon = _bonsSortie.firstWhere((b) => b.bonSortieId == id, orElse: () => throw Exception('Bon de sortie non trouvé'));
    if (motif != null) bon.motif = motif;
    if (dateSortie != null) bon.dateSortie = dateSortie;
    if (utilisateurId != null) bon.utilisateurId = utilisateurId;
    print('Bon de sortie modifié avec succès: $bon');
  }

  void supprimerBonSortie(int id) {
    _bonsSortie.removeWhere((b) => b.bonSortieId == id);
    print('Bon de sortie supprimé avec succès');
  }

  // Recherche de bon de sortie par identifiant
  BonSortie rechercherParId(int id) {
    try {
      return _bonsSortie.firstWhere((bon) => bon.bonSortieId == id);
    } catch (e) {
      throw Exception('Bon de sortie non trouvé pour l\'ID: $id');
    }
  }
}