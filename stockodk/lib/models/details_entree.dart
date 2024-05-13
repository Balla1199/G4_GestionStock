class DetailsEntree {
  // Attributs
  int id;
  int quant;
  double prixtotal;
  int idprod;
  int idbonentree;
  // constructeur
  DetailsEntree( this.id, this.quant, this.prixtotal, this.idprod, this.idbonentree);
  //Liste en memoire pour stocker les details sorties
  static List<DetailsEntree> _detailsEntrees = [];
  // Fonctionnalité de creation d'un détails entrée
    void creerDetailsEntree(DetailsEntree detailsEntree){
      _detailsEntrees.add(detailsEntree);
    }
  // Fonctionnalité de modification d'un détail d'entrée
  void modifierDetailsEntree(DetailsEntree detailsEntreemodifie){
     int index = _detailsEntrees.indexWhere((detailsEntree) => detailsEntree.id == detailsEntreemodifie.id);
     if (index!= -1) {
_detailsEntrees [index]= detailsEntreemodifie;
     } else{
      print("Detail entree non trouvé");
     }
  }
  // Fonctionnalité de suppression d'un détail d'entrée
  void supprimerDetailsEntree(int id){
     _detailsEntrees.remove((detailsEntree)=> detailsEntree.id == id);
  }
  

  }

    