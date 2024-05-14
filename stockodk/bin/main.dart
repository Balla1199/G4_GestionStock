
import 'package:stockodk/models/bon_entree.dart';
import 'package:stockodk/models/bon_sortie.dart';
import 'package:stockodk/models/details_entree.dart';
import 'package:stockodk/models/details_sortie.dart';
import 'package:stockodk/models/fournisseur.dart';
import 'package:stockodk/models/produit.dart';
import 'package:stockodk/models/utilisateur.dart';
void main (){ 
  try {
    Utilisateur utilisateur1 = Utilisateur(1, "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou", "motdepasse123", Role.vendeur);
    Utilisateur utilisateur2 = Utilisateur(2, "Moussa Goita", "moussa@gmail.com", "moussa", "password", Role.manager);
    print(utilisateur2.nomUtilisateur);
  } catch (e) {
    print(e);
    
  }

}
void afficherDetails(DetailsEntree details ){
    print("id: ${details.id}");
    print("la quantite: ${details.quant}, le prix total: ${details.prixtotal}, l'id produit: ${details.idprod}, l'id bon entree': ${details.idbonentree}, l'id");

  }
