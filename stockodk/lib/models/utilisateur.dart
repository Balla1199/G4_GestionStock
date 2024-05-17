import 'dart:io';
enum Role { manager, vendeur, administrateur } 
class Utilisateur {
  int? utilisateurId;
  String nomUtilisateur;
  String? contact;
  String pseudo;
  String? motDePasse;
  Role? role;

  Utilisateur(this.utilisateurId, this.nomUtilisateur, this.contact, this.pseudo, this.motDePasse, this.role);
}

// Classe Vendeur héritant de Utilisateur
class Vendeur extends Utilisateur {
  Vendeur(int utilisateurId, String nomUtilisateur, String contact, String pseudo, String motDePasse)
      : super(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse, Role.vendeur);
}

// Classe Manager héritant de Utilisateur
class Manager extends Utilisateur {
  Manager(int utilisateurId, String nomUtilisateur, String contact, String pseudo, String motDePasse)
      : super(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse, Role.manager);
}

// Classe Administrateur héritant de Utilisateur
class Administrateur extends Utilisateur {
  Administrateur(int utilisateurId, String nomUtilisateur, String contact, String pseudo, String motDePasse)
      : super(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse, Role.administrateur);
}

class GestionUtilisateurs 
{
    List<Utilisateur> utilisateurs = [];

// Méthode d'ajout des utilisateurs 
    void ajouterUtilisateur() 
            {
              print("Donnez l'ID de l'utilisateur");
              String? utilisateurIdEnChaine = stdin.readLineSync() ?? "";
              int? utilisateurId = int.tryParse(utilisateurIdEnChaine);

              print("Donnez le nom d'utilisateur de l'utilisateur");
              String? nomUtilisateur = stdin.readLineSync() ?? "";
              
              print("Donnez le contact de l'utilisateur");
              String? contact = stdin.readLineSync() ?? "";
              
              print("Donnez le pseudo de l'utilisateur");
              String? pseudo = stdin.readLineSync() ?? "";
              
              print("Donnez le mot de passe de l'utilisateur");
              String? motDePasse = stdin.readLineSync() ?? "";
              String? roleProvisoir;
              int? roleProvisoirEntier;
              
            do {
          print("Quel est le rôle de l'utilisateur en chiffre (1: administrateur, 2: manager, 3: vendeur) : ");
          String? roleProvisoir = stdin.readLineSync();
          roleProvisoirEntier = int.tryParse(roleProvisoir ?? "");

        } while (roleProvisoirEntier == null || !(roleProvisoirEntier >= 1 && roleProvisoirEntier <= 3));
              switch (roleProvisoirEntier) {
                case 1:
                  Utilisateur utilisateur = Utilisateur(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse,Role.administrateur);
              utilisateurs.add(utilisateur);
                  break;
                  case 2 :
                  Utilisateur utilisateur = Utilisateur(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse,Role.manager);
              utilisateurs.add(utilisateur);
                  break;
                default:
                Utilisateur utilisateur = Utilisateur(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse,Role.vendeur);
              utilisateurs.add(utilisateur);
              }
              

            }
        
// Méthode de suppression des utilisateurs 
  void supprimerUtilisateur(int userId)
            {
              utilisateurs.removeWhere((element) => element.utilisateurId == userId);
              print("Utilisateur supprimer avec succès");
            }

// Méthode d'affichage des utilisateurs 
  void afficherUtilisateurs() 
          {
            for (var utilisateur in utilisateurs)
             {
              print('---------------------------------------------------------------------------');
              print('ID: ${utilisateur.utilisateurId} Nom: ${utilisateur.nomUtilisateur} Contact: ${utilisateur.contact} Pseudo: ${utilisateur.pseudo} Mot de passe: ${utilisateur.motDePasse}');
              print('---------------------------------------------------------------------------');
              }
          }

  // Méthode de modification des utilisateurs 
   void modifierUtilisateur (int? utilisateurId)
          {
            for (var utilisateur in utilisateurs)
                {
                    if (utilisateur.utilisateurId == utilisateurId)
                    { 
                      print("Que souhaitez vous modifier : ");
                      print("1:Nom de l'utilisateur | 2: Contact | 3: Pseudo 4: Mot de passe");
                      String? modifier = stdin.readLineSync();
                      int? modifierEntier = int.tryParse(modifier ?? "");
                      if (modifierEntier == 1)
                      {  print("Donner le nouveau Nom ");
                        String NomNouveau = stdin.readLineSync() ?? "";
                        utilisateur.nomUtilisateur = NomNouveau;
                      } else if (modifierEntier == 2 ){
                        print("Donner le nouveau Contact ");
                        String? nouveauContact = stdin.readLineSync();
                          utilisateur.contact = nouveauContact;
                      } else if (modifierEntier == 3){
                        print("Donner le nouveau Pseudo ");
                        String nouveauPseudo = stdin.readLineSync() ?? "";
                          utilisateur.pseudo = nouveauPseudo;
                      } else if (modifierEntier == 4){
                          print("Donner le nouveau mot de passe ");
                          String? nouveauMotDePasse = stdin.readLineSync();
                          utilisateur.motDePasse = nouveauMotDePasse;
                      } 
                    } else{
                      print("Entrer un ID valide !");
                      }
                }
          }
// Méthode de recherche par nom des utilisateurs 
 void rechercherParNom(String nom)
        {
          bool utilisateurTrouve = false;  
          
          for (var utilisateur in utilisateurs) {
            if (utilisateur.nomUtilisateur.toLowerCase() == nom.toLowerCase()) {
              print("Nom trouvé :");
              print('-------------------------------------------------------------------------------------------------');
              print('ID: ${utilisateur.utilisateurId} Nom: ${utilisateur.nomUtilisateur} Contact: ${utilisateur.contact} Pseudo: ${utilisateur.pseudo} Mot de passe: ${utilisateur.motDePasse}');
              print('-------------------------------------------------------------------------------------------------');
              utilisateurTrouve = true;
              break; 
            }
          }
          
          if (!utilisateurTrouve) {
            print("Cet nom n'existe pas");
          }
        }
// Méthode de recherche par pseudo des utilisateurs 
 void rechercherParPseudo(String pseudoR)
        {
          bool utilisateurTrouve = false;  
          
          for (var utilisateur in utilisateurs) {
            if (utilisateur.pseudo.toLowerCase() == pseudoR.toLowerCase()) {
              print("Pseudo trouvé :");
              print('-------------------------------------------------------------------------------------------------');
              print('ID: ${utilisateur.utilisateurId} Nom: ${utilisateur.nomUtilisateur} Contact: ${utilisateur.contact} Pseudo: ${utilisateur.pseudo} Mot de passe: ${utilisateur.motDePasse}');
              print('-------------------------------------------------------------------------------------------------');
              utilisateurTrouve = true;
              break; 
            }
          }
          
          if (!utilisateurTrouve) {
            print("Cet pseudo n'existe pas");
          }
        }

  // --------------------------------------------------------------------
}