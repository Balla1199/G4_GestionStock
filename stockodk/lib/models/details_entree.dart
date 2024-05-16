import 'dart:io';

class DetailsEntree {
  int id;
  int quant;
  double prixtotal;
  int idprod;
  int idbonentree;

  DetailsEntree(this.id, this.quant, this.prixtotal, this.idprod, this.idbonentree);

  static List<DetailsEntree> _detailsEntrees = [];

  void creerDetailsEntree() {
    print("Entrez l'ID :");
    id = int.parse(stdin.readLineSync()!);
    print("Entrez la quantité :");
    quant = int.parse(stdin.readLineSync()!);
    print("Entrez le prix total :");
    prixtotal = double.parse(stdin.readLineSync()!);
    print("Entrez l'ID du produit :");
    idprod = int.parse(stdin.readLineSync()!);
    print("Entrez l'ID du bon d'entrée :");
    idbonentree = int.parse(stdin.readLineSync()!);

    _detailsEntrees.add(this);
    print("Détail d'entrée créé avec succès.");
  }

  void modifierDetailsEntree() {
    print("Entrez le nouvel ID :");
    id = int.parse(stdin.readLineSync()!);
    print("Entrez la nouvelle quantité :");
    quant = int.parse(stdin.readLineSync()!);
    print("Entrez le nouveau prix total :");
    prixtotal = double.parse(stdin.readLineSync()!);
    print("Entrez le nouvel ID du produit :");
    idprod = int.parse(stdin.readLineSync()!);
    print("Entrez le nouvel ID du bon d'entrée :");
    idbonentree = int.parse(stdin.readLineSync()!);

    print("Détail d'entrée modifié avec succès.");
  }

  void supprimerDetailsEntree() {
    print("Entrez l'ID du détail à supprimer :");
    var idToDelete = int.parse(stdin.readLineSync()!);
    _detailsEntrees.removeWhere((detailsEntree) => detailsEntree.id == idToDelete);
    print("Détail d'entrée supprimé avec succès.");
  }

  void rechercherDetailsEntreeParID() {
    print("Entrez l'ID du détail d'entrée à rechercher :");
    var idRecherche = int.parse(stdin.readLineSync()!);

    var detailTrouve = _detailsEntrees.firstWhere((detailsEntree) => detailsEntree.id == idRecherche);

    if (detailTrouve != null) {
      print("Détail d'entrée trouvé :");
      print("ID: ${detailTrouve.id}, Quantité: ${detailTrouve.quant}, Prix Total: ${detailTrouve.prixtotal}, ID du Produit: ${detailTrouve.idprod}, ID du Bon d'Entrée: ${detailTrouve.idbonentree}");
    } else {
      print("Aucun détail d'entrée trouvé pour l'ID spécifié.");
    }
  }
}

// void main() {
  // var detailsEntree = DetailsEntree(0, 0, 0, 0, 0);
  // print("Bienvenue ! Que souhaitez-vous faire ?");
  // print("----------------------------------")
  // print("|1. Créer un détail d'entrée     |");
  // print("----------------------------------")
  // print("|2. Modifier un détail d'entrée  |");
  // print("----------------------------------")
  // print("|3. Supprimer un détail d'entrée |");
  // print("----------------------------------")
  // print("|4. Rechercher un détail d'entrée|");
  // print("----------------------------------")
  // var choix = int.parse(stdin.readLineSync()!);

  // switch (choix) {
    // case 1:
      // detailsEntree.creerDetailsEntree();
      //break;
    // case 2:
      // detailsEntree.modifierDetailsEntree();
      //break;
    // case 3:
      // detailsEntree.supprimerDetailsEntree();
      // break;
   // case 4:
      // detailsEntree.rechercherDetailsEntreeParID();
      // break;
    // default:
      // print("Choix invalide.");
      // break;
  // }
// }