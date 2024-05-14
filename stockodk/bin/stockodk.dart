import 'package:stockodk/stockodk.dart' as stockodk;
import 'package:stockodk/models/bon_entree.dart';
void main(List<String> arguments) {

  // Ajout des bons d'entrée à la liste
  BonEntree.ajouterBonEntree(1, "2023-05-14", "En cours", 123, 456);
  BonEntree.modifierUnBonEntee(1, dateDeCommande: "2023-78-00", );
  // Affichage des bons d'entrée
  BonEntree.afficherBonsEntree();

  // BonEntree.rechercherBonEntreeParId(2);
}
