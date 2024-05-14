enum Role { manager, vendeur, administrateur }

class Utilisateur {
  int utilisateurId;
  String nomUtilisateur;
  String contact;
  String pseudo;
  String motDePasse;
  Role role;

  Utilisateur(this.utilisateurId, this.nomUtilisateur, this.contact, this.pseudo, this.motDePasse, this.role);
}

class GestionUtilisateurs {
  static List<Utilisateur> utilisateurs = [];

  static void ajouterUtilisateur(int utilisateurId,
                                 String nomUtilisateur,
                                 String contact,
                                 String pseudo,
                                 String motDePasse,
                                 Role role) {
    utilisateurs.add(Utilisateur(utilisateurId, nomUtilisateur, contact, pseudo, motDePasse, role));
  }

  static void modifierUtilisateur(int userId, Utilisateur utilisateur) {
    int index = utilisateurs.indexWhere((element) => element.utilisateurId == userId);
    if (index != -1) {
      utilisateurs[index] = utilisateur;
    }
  }

  static void supprimerUtilisateur(int userId) {
    utilisateurs.removeWhere((element) => element.utilisateurId == userId);
  }

  static List<Utilisateur> rechercherParNom(String nom) {
    return utilisateurs.where((element) => element.nomUtilisateur.toLowerCase().contains(nom.toLowerCase())).toList();
  }

  static Utilisateur? rechercherParLogin(String login) {
    return utilisateurs.firstWhere((element) => element.pseudo.toLowerCase() == login.toLowerCase(), orElse: () => Utilisateur(-1, "", "", "", "", Role.vendeur));
  }
}

void main() {
  Utilisateur utilisateur1 = Utilisateur(1, "Badra Aliou SY", "sybadraaliou@gmail.com", "Aliou", "motdepasse123", Role.vendeur);
  Utilisateur utilisateur2 = Utilisateur(2, "Moussa Goita", "moussa@gmail.com", "moussa", "password", Role.manager);

  GestionUtilisateurs.ajouterUtilisateur(utilisateur1.utilisateurId,
                                         utilisateur1.nomUtilisateur,
                                         utilisateur1.contact,
                                         utilisateur1.pseudo,
                                         utilisateur1.motDePasse,
                                         utilisateur1.role);
  GestionUtilisateurs.ajouterUtilisateur(utilisateur2.utilisateurId,
                                         utilisateur2.nomUtilisateur,
                                         utilisateur2.contact,
                                         utilisateur2.pseudo,
                                         utilisateur2.motDePasse,
                                         utilisateur2.role);

  print(GestionUtilisateurs.rechercherParNom("Aliou"));
  print(GestionUtilisateurs.rechercherParLogin("moussa"));
}

  