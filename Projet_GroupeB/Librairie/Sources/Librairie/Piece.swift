enum MyErrorPiece: Error {
    case runtimeError(String)
}
public class PieceClass : PieceProtocol {
  public typealias TypePieceA = TypePieceClass
  public typealias PositionA = PositionClass
  public typealias OrientationA = OrientationClass

  private var kodama : Bool
  private var kodama_samurai : Bool
  private var roi : Bool
  private var orient : OrientationA?
  private var position : PositionA?
  private var typePiece : TypePieceA?

  // init: -> Piece
  // creation d'une piece definie par son type, sa position et son orientation. On initialise cette piece a Vide.
  public required init(){
      self.orient = nil
      self.position = nil
      self.typePiece = nil
      self.roi = false
      self.kodama = false
      self.kodama_samurai = false

  }

  
  @discardableResult
  public func Set_Type(newType : TypePieceA?)->Self{
    if let nType = newType{
      self.typePiece = nType
    }

    return self
  }

  // Set_Position: Piece*(Position|Vide) -> Piece
  // Modifie la position d'une piece
  // Pre: newPOS doit être sur le plateau
  // Post: Si la position est sur le plateau on modifie sa position sinon on ne fait rien
  @discardableResult
  public func Set_Position(newPos : PositionA?)->Self{
    if let nPos = newPos{
      if(nPos.getX() >= 0 && nPos.getX() <= 3 && nPos.getY() >= 0 && nPos.getY() <= 3){
        self.position = nPos
      }
    }else{
      self.position = nil
    }
    return self
  }

  // Set_Orientation: Piece*(Orientation|Vide) -> Piece
  // Modifie l'orientation d'une piece
  // Pre: newOrient doit etre une orientation existante (N/S)
  // Post: L'orientation est changee. Si newOrient n'existe pas on ne fait rien
  @discardableResult
  public func Set_Orientation(newOrient : OrientationA?)->Self{
    if let orientation = newOrient{
      self.orient = orientation
    }

    return self
  }

  // Give_Type: Piece -> TypePiece
  // Retourne le type d'une piece
  // Post: On a le TypePiece
  public func Give_Type()->TypePieceA?{
    return self.typePiece
  }

  // Give_Position: Piece -> (Position|Vide)
  // Retourne la position d'une piece
  // Pre: La piece doit etre sur le plateau
  // Post: Si la piece est sur le plateau on retourne sa position sinon on retourne Vide(Si la piece est dans la reserve par exemple)
  public func Give_Position()->PositionA?{
    return self.position
  }

  //fonction ajouté
  @discardableResult
  public func set_Kodama()->Self{
    self.kodama = true
    return self
  }

  // Give_Orientation: Piece -> Orientation
  // Retourne l'orientation d'une piece
  // Post: On a l'Orientation de la piece
  public func Give_Orientation()->OrientationA?{
    return self.orient
  }

  // Piece_Au_Fond: Piece -> Bool
  // Regarde si la piece est au fond
  // Post: Retourne vrai si la piece est au fond, faux sinon
  public func Piece_Au_Fond()->Bool{
    if let orientPiece = self.Give_Orientation(){
      if let orient = orientPiece.recuperer_Orientation(){
        if(orient == Orientation.S){

          if let pos = self.Give_Position(){
            if(pos.getY() == 3){
              return true
            }
          }
        }else if(orient == Orientation.N){
          if let pos = self.Give_Position(){
            if(pos.getY() == 0){
              return true
            }
          }

        }
      }

    }
    return false
  }

  // Est_Kodama: Piece -> Bool
  // Regarde si la piece est un Kodama
  // Post: Retourne vrai si la piece est un Kodama faux sinon
  public func Est_Kodama()->Bool{
    return self.kodama
  }

  // Est_Kodama_Samurai: Piece -> Bool
  // Regarde si la piece est un Kodama samurai
  // Post: Retourne vrai si la piece est un Kodama samurai faux sinon
  public func Est_Kodama_Samurai()->Bool{
    return self.kodama_samurai
  }

  // Est_Roi: Piece -> Bool
  // Regarde si la piece est un Roi
  // Post: Retourne vrai si la piece est un Koropokkuru faux sinon
  public func Est_Roi()->Bool {
    return self.roi
  }

  // Transformer_Kodama_Samurai: Piece -> Piece
  // On transforme le kodama en kodama samurai
  // Pre: La piece doit etre un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
  // Post: On transforme le kodama en kodama samourai Si les preconditions ne sont pas remplies on ne fait rien.
  @discardableResult
  public func Transformer_Kodama_Samurai()->Self{
    if(self.Est_Kodama()){
      if let orientPiece = self.Give_Orientation(){
        if let orient = orientPiece.recuperer_Orientation(){
          if(orient == Orientation.N){
            if let pos = self.Give_Position(){
              if(pos.getY() == 0){
                self.kodama_samurai = true
              }
            }

          }else if(orient == Orientation.S){

            if let pos = self.Give_Position(){
              if(pos.getY() == 3){
                self.kodama_samurai = true
              }
            }

          }
        }

      }
    }
    return self
  }

  // Transformer_Kodama: Piece -> Piece
  // On transforme le kodama samurai・en kodama
  // Pre: La piece doit etre un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
  // Post: On transforme le kodama samourai en kodama. Si les preconditions ne sont pas remplies on ne fait rien.
  @discardableResult
  public func Transformer_Kodama()->Self{
    if(self.Est_Kodama() && self.Est_Kodama_Samurai()){
      self.kodama_samurai = false
    }
    return self
  }

  // Deplacer_Piece: Piece*Position -> Piece
  // On deplace une piece jusqu'a une position finale.
  // Pre: La Position finale correspond ・une position sur laquelle la piece peut se deplacer
  // Post: La piece est deplacee. Si la piece ne peut pas se deplacer sur la position finale alors rien n'est fait
  @discardableResult
  public func Deplacer_Piece(PosFin:PositionA)->Self{
    //on verifie que la position souhaité soit bien sur le plateau
    if(PosFin.getX() >= 0 && PosFin.getX() <= 3 && PosFin.getY() >= 0 && PosFin.getY() <= 3){
      //on doit verifier que la piece peut se déplacer présisement à cet endroit en fonction de son type
      if let pos = self.Give_Position(){
        if let type = self.Give_Type(){
          if type.Give_Nom() == "tanuki"{
            if PosFin.getX() == pos.getX() && (PosFin.getY()-1) == pos.getY(){//bas
              self.position=PosFin
            }else if PosFin.getX() == pos.getX() && (PosFin.getY()+1) == pos.getY(){//haut
              self.position=PosFin
            }else if (PosFin.getX()-1) == pos.getX() && PosFin.getY() == pos.getY(){//gauche
              self.position=PosFin
            }else if (PosFin.getX()+1) == pos.getX() && PosFin.getY() == pos.getY(){//droite
              self.position=PosFin
            }

          }else if type.Give_Nom() == "kodama"{
            //si il est samurai il peut bouger de partout sauf dans la diagonale bas gauche et droite
            if self.Est_Kodama_Samurai(){
              if let orientemp = self.orient{
                if(orientemp.recuperer_Orientation() == Orientation.S){
                  if !(PosFin.getX() == (pos.getX()-1) && PosFin.getY() == (pos.getY()))//gauche
                  || !(PosFin.getX() == (pos.getX()+1) && PosFin.getY() == (pos.getY()))//droite
                  || !(PosFin.getX() == (pos.getX()) && PosFin.getY() == (pos.getY()+1))//bas
                  || !(PosFin.getX() == (pos.getX()) && PosFin.getY() == (pos.getY()-1))//haut
                  || !(PosFin.getX() == (pos.getX()-1) && PosFin.getY() == (pos.getY()-1))//haut gauche
                  || !(PosFin.getX() == (pos.getX()+1) && PosFin.getY() == (pos.getY()-1)){//haut droit

                    self.position=PosFin
                  }

                }else{
                  if !(PosFin.getX() == (pos.getX()-1) && PosFin.getY() == (pos.getY()))//gauche
                  || !(PosFin.getX() == (pos.getX()+1) && PosFin.getY() == (pos.getY()))//droite
                  || !(PosFin.getX() == (pos.getX()) && PosFin.getY() == (pos.getY()+1))//bas
                  || !(PosFin.getX() == (pos.getX()) && PosFin.getY() == (pos.getY()-1))//haut
                  || !(PosFin.getX() == (pos.getX()-1) && PosFin.getY() == (pos.getY()+1))//bas gauche
                  || !(PosFin.getX() == (pos.getX()+1) && PosFin.getY() == (pos.getY()+1)){//bas droit

                    self.position=PosFin
                  }

                }
              }

            //si il est juste kodama (sans samurai) il peut bouger uniquement par le haut
            }else{
              if let orientemp = self.orient{
                if(orientemp.recuperer_Orientation() == Orientation.N){
                  if PosFin.getX() == pos.getX() && (PosFin.getY()+1) == pos.getY(){
                    self.position=PosFin
                  }
                }else{
                  if PosFin.getX() == pos.getX() && (PosFin.getY()-1) == pos.getY(){
                    self.position=PosFin
                  }
                }
              }


            }

          }else if type.Give_Nom() == "koropokkuru"{
            if PosFin.getX() == pos.getX() && (PosFin.getY()-1) == pos.getY(){//bas
              self.position=PosFin
            }else if PosFin.getX() == pos.getX() && (PosFin.getY()+1) == pos.getY(){//haut
              self.position=PosFin
            }else if (PosFin.getX()-1) == pos.getX() && PosFin.getY() == pos.getY(){//gauche
              self.position=PosFin
            }else if (PosFin.getX()+1) == pos.getX() && PosFin.getY() == pos.getY(){//droite
              self.position=PosFin
            }
            else if (PosFin.getX()+1) == pos.getX() && (PosFin.getY()-1) == pos.getY(){//bas gauche
              self.position=PosFin
            }else if (PosFin.getX()+1) == pos.getX() && (PosFin.getY()+1) == pos.getY(){//haut gauche
              self.position=PosFin
            }else if (PosFin.getX()-1) == pos.getX() && (PosFin.getY()-1) == pos.getY(){//bas droit
              self.position=PosFin
            }else if (PosFin.getX()-1) == pos.getX() && (PosFin.getY()+1) == pos.getY(){//haut droit
              self.position=PosFin
            }

          }else if type.Give_Nom() == "kitsune"{
            if (PosFin.getX()+1) == pos.getX() && (PosFin.getY()-1) == pos.getY(){//bas gauche
              self.position=PosFin
            }else if (PosFin.getX()+1) == pos.getX() && (PosFin.getY()+1) == pos.getY(){//haut gauche
              self.position=PosFin
            }else if (PosFin.getX()-1) == pos.getX() && (PosFin.getY()-1) == pos.getY(){//bas droit
              self.position=PosFin
            }else if (PosFin.getX()-1) == pos.getX() && (PosFin.getY()+1) == pos.getY(){//haut droit
              self.position=PosFin
            }

          }
        }
        //position de la piece est nul il s'agit donc d'un parachutage
      }else{
        self.position=PosFin
      }

    }
    return self
  }
}
