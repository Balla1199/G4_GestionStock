
import 'package:stockodk/models/bon_sortie.dart';
import 'package:stockodk/models/details_entree.dart';
import 'package:stockodk/models/details_sortie.dart';
void main (){ 
  try {
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
  } catch (e) {
    print(e);
    
  }

}
void afficherDetails(DetailsEntree details ){
    print("id: ${details.id}");
    print("la quantite: ${details.quant}, le prix total: ${details.prixtotal}, l'id produit: ${details.idprod}, l'id bon entree': ${details.idbonentree}, l'id");

  }
