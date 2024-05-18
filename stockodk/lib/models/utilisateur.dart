import 'dart:io';

enum Role { manager, vendeur, administrateur }

class Utilisateur {
  int? utilisateurId;
  String nomUtilisateur;
  String? contact;
  String pseudo;
  String? motDePasse;
  Role? role;

  Utilisateur(this.utilisateurId, this.nomUtilisateur, this.contact,
      this.pseudo, this.motDePasse, this.role);
}

// Classe Vendeur héritant de Utilisateur
class Vendeur extends Utilisateur {
  Vendeur(int utilisateurId, String nomUtilisateur, String contact,
      String pseudo, String motDePasse)
      : super(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse,
            Role.vendeur);
}

// Classe Manager héritant de Utilisateur
class Manager extends Utilisateur {
  Manager(int utilisateurId, String nomUtilisateur, String contact,
      String pseudo, String motDePasse)
      : super(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse,
            Role.manager);
}

// Classe Administrateur héritant de Utilisateur
class Administrateur extends Utilisateur {
  Administrateur(int utilisateurId, String nomUtilisateur, String contact,
      String pseudo, String motDePasse)
      : super(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse,
            Role.administrateur);
}

class GestionUtilisateurs {
  // --------------------------------------------------------------------
}
