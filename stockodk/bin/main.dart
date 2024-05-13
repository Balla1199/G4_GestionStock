
import 'package:stockodk/models/details_entree.dart';
import 'package:stockodk/models/details_sortie.dart';
void main (){ 
  print("*************** Ici nous avons lee details sortiies *****************"); 
  var gestion = GestionDetailsSortie();
  gestion.ajouterDetailSortie(5, 1500.0, null, 1, 1);
  print(gestion.listerDetailsSortie());
  gestion.modifierDetailSortie(1, quantite: 10, prixTotal: 3000.0);
  print(gestion.listerDetailsSortie());
  gestion.supprimerDetailSortie(1);
  print(gestion.listerDetailsSortie());

  print("*************** Ici nous avons les details du bon d'entre *****************");
  DetailsEntree firstEntre = DetailsEntree(1, 8, 45000.00, 1, 1);
  print("Ceci est notre tout premier details entree");
  print("la quantite = ${firstEntre.quant}");
  DetailsEntree detailsModifie= DetailsEntree(1, 10, 50.0, 5, 7);

  //Modification details entree
  detailsModifie.modifierDetailsEntree(detailsModifie);
  print("Detail entrée modifiée");
  afficherDetails(detailsModifie); 

  //suppression de details entree
  firstEntre.supprimerDetailsEntree(1);
  print("\nDétail d'entree supprimée");
  print("*************** Ici nous avons les details du bon d'entre *****************");

}
void afficherDetails(DetailsEntree details ){
    print("id: ${details.id}");
    print("la quantite: ${details.quant}, le prix total: ${details.prixtotal}, l'id produit: ${details.idprod}, l'id bon entree': ${details.idbonentree}, l'id");

  }
