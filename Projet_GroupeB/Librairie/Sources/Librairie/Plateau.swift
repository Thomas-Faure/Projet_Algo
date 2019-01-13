//Un plateau est une collection de positions +2 joueurs
public class PlateauClass : PlateauProtocol{
    public typealias Joueur = JoueurClass
    public typealias Piece = PieceClass
    public typealias Position = PositionClass
    public typealias IteratorPositionProtocol = ItPosition

    private var l : Int
    private var h : Int
    private var joueur1 : Joueur?
    private var joueur2 : Joueur?
    private var position : [Position]

    //init: Int*Int->Plateau
    //Initialisation d'un plateau de longeur de longeur l et de hauteur h et de deux joueurs
    //Pre: l>0 & h>0
    //Sinon la creation du plateau echoue
    public required init?(l:Int,h:Int){
      if(l <= 0 || h <= 0){
        return nil
      }

      self.l = l
      self.h = h
      self.joueur1 = nil
      self.joueur2 = nil
      self.position = []
      for i in 0...h-1{
        for j in 0...l-1{
          position.append(Position(x : j,y : i))
        }
      }
    }

    //Give_Joueur1: Plateau -> Joueur
    //retourne le joueur 1 du plateau
    //Post: On a le Joueur1
    public func Give_Joueur1()->Joueur?{
      return self.joueur1
    }

    //Give_Joueur1: Plateau -> Joueur
    //retourne le joueur 2 du plateau
    //Post: On a le Joueur2
    public func Give_Joueur2()->Joueur?{
      return self.joueur2
    }

    //Set_Joueur1: Plateau -> Joueur
    //modifie le joueur1 du plateau
    //Post: Le joueur1 du plateau est modifie
    @discardableResult
    public func Set_Joueur1(joueur:Joueur)->Self{
      self.joueur1 = joueur
      return self
    }

    //Set_Joueur2: Plateau -> Joueur
    //modifie le joueur2 du plateau
    //Post: Le joueur2 du plateau est modifie
    @discardableResult
    public func Set_Joueur2(joueur:Joueur)->Self{
      self.joueur2 = joueur
      return self
    }

    //Est_Case_Vide: Plateau*Position -> Bool
    //Verifie si une position est vide ou pas
    //Pre: Position est dans le plateau (ne depasse pas la hauteur ou la largeur)
    //Post: Retourne Vrai si il n'y a pas de piece a cette position, faux si la case est occupee. Si jamais la position entree en parametre n'est pas sur le plateau on retourne une erreur.
    public func Est_Case_Vide(pos:Position)->Bool{
      var EstSurPlateau=false
      for p in self.position{
        if (p.getX() == pos.getX() && p.getY() == pos.getY()){
          EstSurPlateau = true
        }
      }
      if(!EstSurPlateau){
        return false
      }
      if let joueurUn = self.Give_Joueur1(){
        if let pieceJoueur1 = joueurUn.Give_Hand(){
          for piece in pieceJoueur1{
            if let givepos = piece.Give_Position(){
              if (givepos.getX() == pos.getX() && givepos.getY() == pos.getY()){
                return false
              }
            }
          }
        }
      }


      if let joueurDeux = self.Give_Joueur2(){
        if let pieceJoueur2 = joueurDeux.Give_Hand(){
          for piece in pieceJoueur2{
            if let givepos = piece.Give_Position(){
              if(givepos.getX() == pos.getX() && givepos.getY() == pos.getY()){
                return false
              }
            }
          }
        }
      }
      return true

    }

    //Est_Deplacement_Possible: Plateau*Piece*Position
    //Verifie si un piece peut se deplacer a un position donnee
    //Pre:La position est sur la plateau
    //Pre:La position n'est pas occupe par une piece du meme joueur
    //Pre:Le deplacement est permi par le type de la piece
    //Post:Si le deplacement est permis on retourne vrai sinon on retourne faux
    public func Est_Deplacement_Possible(piece:Piece,pos:Position)->Bool{
      

      var positionDansPlateau : Bool = false
      for p in self.position{
        if (p.getX() == pos.getX() && p.getY() == pos.getY()){
          positionDansPlateau = true
        }
      }
      if(!positionDansPlateau){
        return false
      }

      //verifier si la piece ne vas pas sur la position d'une piece d'un même joueur
      if let piecePosition = piece.Give_Position(){
        if let joueurUn = self.Give_Joueur1(){
          if let mainJoueur1 = joueurUn.Give_Hand(){
            if(mainJoueur1.Avoir_Piece(pos: piecePosition)){
              for pieceMainJoueur1 in mainJoueur1{
                if let positionPieceJoueur1 = pieceMainJoueur1.Give_Position(){
                  if (positionPieceJoueur1.getX() == pos.getX() && positionPieceJoueur1.getY() == pos.getY()){
                    return false
                  }
                }
              }
            }
          }
        }
      }

      if let piecePosition = piece.Give_Position(){
        if let joueurDeux = self.Give_Joueur2(){
          if let mainJoueur2 = joueurDeux.Give_Hand(){
            if(mainJoueur2.Avoir_Piece(pos: piecePosition)){
              for pieceJoueur2 in mainJoueur2{
                if let positionPieceJoueur2 = pieceJoueur2.Give_Position(){
                  if (positionPieceJoueur2.getX() == pos.getX() && positionPieceJoueur2.getY() == pos.getY()){
                    return false
                  }
                }
              }
            }
          }
        }
      }

      if let positionActuel = piece.Give_Position(){
        if let orientation = piece.Give_Orientation(){
          if let sens = orientation.recuperer_Orientation(){
            if(sens == Orientation.S){
              if let typePiece = piece.Give_Type(){

                if typePiece.Give_Nom() == "koropokkuru" {
                  if(pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY() || // droite
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1 || // bas
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY() || // gauche
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1 || // haut
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()-1 || // haut droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()-1 || // haut gauche
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()+1 || // bas droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()+1){  // bas gauche
                    return true
                  } else {
                    return false
                  }
                } else if typePiece.Give_Nom() == "kitsune" {
                  if(pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()+1 || // En bas à droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()-1 || // En haut à gauche
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()-1 || // En haut à droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()+1){  // En bas à gauche
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "tanuki" {

                  if(pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY() || // À droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY() || // À gauche
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1 || // En haut
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1){  // En bas
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "kodama" && (piece.Est_Kodama_Samurai() == false) {
                  if(pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1){
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "kodama" && (piece.Est_Kodama_Samurai() == true) {
                  if(pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1 ||   // En bas
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()+1 || // En bas à droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()+1 || // En bas à gauche
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1 ||   // En bas
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY() ||   // À droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()){    // À gauche
                    return true
                  } else {
                    return false
                  }
                }
              }

            } else if(sens == Orientation.N) {
              if let typePiece = piece.Give_Type(){

                if typePiece.Give_Nom() == "koropokkuru" {
                  if(pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY() || // droite
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1 || // bas
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY() || // gauche
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1 || // haut
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()-1 || // haut droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()-1 || // haut gauche
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()+1 || // bas droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()+1){  // bas gauche
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "kitsune" {
                  if(pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()+1 || // En bas à droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()-1 || // En haut à gauche
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()-1 || // En haut à droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()+1){  // En bas à gauche
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "tanuki" {
                  if(pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY() || // À droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY() || // À gauche
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1 || // En haut
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1){  // En bas
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "kodama"  && (piece.Est_Kodama_Samurai() == false) {
                  if(pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1){
                    return true
                  } else {
                    return false
                  }

                } else if typePiece.Give_Nom() == "kodama"  && (piece.Est_Kodama_Samurai() == true) {
                  if(pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()-1 ||   // En haut
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY()-1 || // En haut à droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()-1 || // En haut à gauche
                     pos.getX() == positionActuel.getX() && pos.getY() == positionActuel.getY()+1 ||   // En bas
                     pos.getX() == positionActuel.getX()+1 && pos.getY() == positionActuel.getY() ||   // À droite
                     pos.getX() == positionActuel.getX()-1 && pos.getY() == positionActuel.getY()){    // À gauche
                    return true
                  } else {
                    return false
                  }
                }
              }

            } else {
              return false
            }
          }
        }
      }
      return false
    }
    
    //Piece_Position: Plateau*Position->(Piece|Vide)
    //Ressort un piece a partir d'une position du plateau
    //Pre:Il y a une piece sur cette position
    //Pre:La position est dans le plateau
    //Post: Retourne la piece. Si jamais la position n'est pas sur la plateau ou si il n'y a pas de piece a cette position on retourne Vide.
    public func Piece_Position(pos:Position)->Piece?{
      if let joueurUn = self.Give_Joueur1(){
        if let pieceJoueur1 = joueurUn.Give_Hand(){
          for piece in pieceJoueur1{
            if let position = piece.Give_Position(){
              if (position.getX() == pos.getX() && position.getY() == pos.getY()){
                return piece
              }
            }
          }
        }
      }


      if let joueurDeux = self.Give_Joueur2(){
        if let pieceJoueur2 = joueurDeux.Give_Hand(){
          for piece in pieceJoueur2{
            if let position = piece.Give_Position(){
              if (position.getX() == pos.getX() && position.getY() == pos.getY()){
                return piece
              }
            }
          }
        }
      }

      return nil
    }

    //Fin: Plateau -> (Joueur | Vide)
    //Regarde si la partie est finie.
    //Post: Il faut que l'un des deux joueurs n'ai plus son roi ou que le roi d'un des deux joueurs soit sur la derniere case pour retourner un joueur gagnant. Sinon on retourne Vide
    public func Fin()->Joueur?{
      var joueur1PossedeRoi : Bool = false
      var joueur2PossedeRoi : Bool = false
      var roi1Gagnant : Bool = false
      var roi2Gagnant : Bool = false

      if let joueurUn = self.Give_Joueur1(){
        if let mainJoueur1 = joueurUn.Give_Hand(){

          for piece in mainJoueur1{
            if let typePiece = piece.Give_Type(){
              if(typePiece.Give_Nom() == "koropokkuru"){

                joueur1PossedeRoi = true

                if let position = piece.Give_Position(){
                  if (position.getY() == h-1) { // Si le roi est dans le camp adverse en supposant que le joueur1 démarre en haut du plateau
                    roi1Gagnant = true
                    if let joueurDeux = self.Give_Joueur2(){
                      if let mainJoueur2 = joueurDeux.Give_Hand(){
                        for pieceJoueur2 in mainJoueur2 { // On regarde si une piece adverse peut capturer le roi
                          if (self.Est_Deplacement_Possible(piece : pieceJoueur2, pos : position)){
                            roi1Gagnant = false
                          }
                          
                        }
                      }
                    }

                  }
                }
              }
            }
          }
        }
      }

      if let joueurDeux = self.Give_Joueur2(){
        if let mainJoueur2 = joueurDeux.Give_Hand(){

          for piece in mainJoueur2{
            if let typePiece = piece.Give_Type(){
              if(typePiece.Give_Nom() == "koropokkuru"){

                joueur2PossedeRoi = true

                if let position = piece.Give_Position(){
                  if (position.getY() == 0) { // Si le roi est dans le camp adverse en supposant que le joueur2 démarre en bas du plateau
                    roi2Gagnant = true
                    if let joueurUn = self.Give_Joueur1(){
                      if let mainJoueur1 = joueurUn.Give_Hand(){
                        for pieceJoueur1 in mainJoueur1 { // On regarde si une piece adverse peut capturer le roi
                          if (Est_Deplacement_Possible(piece : pieceJoueur1, pos : position)){
                            roi2Gagnant = false
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      if(roi1Gagnant || !joueur2PossedeRoi){
        return self.Give_Joueur1()

      } else if(roi2Gagnant || !joueur1PossedeRoi){
        return self.Give_Joueur2()

      } else {
        return nil
      }
    }

    public func makeIterator()->ItPosition{
      return ItPosition(self)
    }
}

public struct ItPosition: IteratorProtocol{
  public typealias Position = PositionClass
  private let plateau : PlateauClass
     private var courant : Int = 0
     private let keys : [Position]

     fileprivate init(_ a: PlateauClass){
        self.plateau = a
        let test = Position(x:0,y:0)
        self.keys = [test,test]
     }
     public mutating func next() -> Position?{
       let test = Position(x:0,y:0)
       return test

  }
}
