class Bon_Sortie {
  int bon_sortie_id;
  String motif;
  DateTime? date_sortie;
  int utilisateur_id;

  Bon_Sortie(this.bon_sortie_id, this.motif, DateTime date_sortie, this.utilisateur_id)
      : date_sortie = DateTime(date_sortie.year, date_sortie.month, date_sortie.day);
      
}

class GestionnaireBonSortie {
  List<Bon_Sortie> bonsSortie = [];

  // Création d'un bon de sortie
  void creerBonSortie(int bon_sortie_id, String motif, DateTime date_sortie, int utilisateur_id) {
    var nouveauBonSortie = Bon_Sortie(bon_sortie_id, motif, date_sortie, utilisateur_id);
    bonsSortie.add(nouveauBonSortie);
  }
  
 // Affichage des bons de sortie
  void afficherBonsSortie() {
    print("Liste des bons de sortie :");
    for (var bon in bonsSortie) {
      // print("ID: ${bon.bon_sortie_id}, Motif: ${bon.motif}, Date: ${bon.date_sortie}, Utilisateur ID: ${bon.utilisateur_id}");
        // print("ID: ${bon.bon_sortie_id}, Motif: ${bon.motif}, Date: ${bon.date_sortie.year}-${bon.date_sortie.month}-${bon.date_sortie.day}, Utilisateur ID: ${bon.utilisateur_id}");
        String dateAffichee = bon.date_sortie != null ? "${bon.date_sortie!.year}-${bon.date_sortie!.month}-${bon.date_sortie!.day}" : "Date non définie";
      print("ID: ${bon.bon_sortie_id}, Motif: ${bon.motif}, Date: $dateAffichee, Utilisateur ID: ${bon.utilisateur_id}");
    
    }
    print("\n");
  }
  
  // Modification d'un bon de sortie
  void modifierBonSortie(int index, int bon_sortie_id, String motif, DateTime date_sortie, int utilisateur_id) {
    if (index >= 0 && index < bonsSortie.length) {
      bonsSortie[index].bon_sortie_id = bon_sortie_id;
      bonsSortie[index].motif = motif;
      bonsSortie[index].date_sortie = date_sortie;
      bonsSortie[index].utilisateur_id = utilisateur_id;
    } else {
      print("L'index spécifié est invalide.");
    }
  }

  // Suppression d'un bon de sortie par index
  void supprimerBonSortie(int index) {
    if (index >= 0 && index < bonsSortie.length) {
      bonsSortie.removeAt(index);
    } else {
      print("L'index spécifié est invalide.");
    }
  }
    // Recherche d'un bon de sortie par identifiant
  Bon_Sortie? rechercherBonSortieParId(int bon_sortie_id) {
    var bon = bonsSortie.firstWhere(
      (bon) => bon.bon_sortie_id == bon_sortie_id,
      orElse: () {
        print("Aucun bon de sortie trouvé pour l'identifiant spécifié.");
        return Bon_Sortie(0, '', DateTime.now(), 0); // Ou une autre valeur par défaut
      },
    );
    return bon;
  }

  // Recherche de bons de sortie par date
  List<Bon_Sortie> rechercherBonsSortieParDate(DateTime date) {
    var bons = bonsSortie.where((bon) =>
        bon.date_sortie != null && bon.date_sortie!.year == date.year && bon.date_sortie!.month == date.month && bon.date_sortie!.day == date.day);
    return bons.toList();
  }

  // Suppression de tous les bons de sortie
  void supprimerTousBonsSortie() {
    bonsSortie.clear();
  }
}

/*
import '../lib/models/bon_sortie.dart';

void main() {
  var gestionnaire = GestionnaireBonSortie();

  // Création d'un bon de sortie pour un achat de fournitures de bureau
  gestionnaire.creerBonSortie(1, "Achat de fournitures de bureau", DateTime(2024, 5, 10), 1);

  // Modification du bon de sortie
  gestionnaire.modifierBonSortie(0, 1, "moi", DateTime(2024, 5, 11), 234);

  // Affichage des bons de sortie après la modification
  gestionnaire.afficherBonsSortie();

  // Suppression du bon de sortie
  gestionnaire.supprimerBonSortie(0);

  // Affichage des bons de sortie après la suppression
  gestionnaire.afficherBonsSortie();

  // Création d'autres bons de sortie
  gestionnaire.creerBonSortie(1, "Achat d'ordinateur et iphon 15 pros max", DateTime(2024, 5, 24), 243);
  gestionnaire.creerBonSortie(2, "Déjeuner d'équipe", DateTime(2024, 5, 11), 456);
  gestionnaire.creerBonSortie(3, "Envoi de colis à un client", DateTime(2024, 5, 12), 789);

  // Affichage des bons de sortie après les ajouts
  gestionnaire.afficherBonsSortie();

  // Recherche d'un bon de sortie par ID
  var bon = gestionnaire.rechercherBonSortieParId(1);
  if (bon != null) {
    print("Bon de sortie trouvé : ID ${bon.bon_sortie_id}, Motif ${bon.motif}, Date ${bon.date_sortie}, Utilisateur ID ${bon.utilisateur_id}");
  } else {
    print("Aucun bon de sortie trouvé pour l'identifiant spécifié.");
  }

  // Recherche de bons de sortie par date
  var dateRecherchee = DateTime(2024, 5, 11);
  var bonsParDate = gestionnaire.rechercherBonsSortieParDate(dateRecherchee);
  if (bonsParDate.isNotEmpty) {
    print("Bons de sortie pour la date $dateRecherchee :");
    bonsParDate.forEach((bon) {
      print("ID ${bon.bon_sortie_id}, Motif ${bon.motif}, Utilisateur ID ${bon.utilisateur_id}");
    });
  } else {
    print("Aucun bon de sortie trouvé pour la date spécifiée.");
  }
}
*/