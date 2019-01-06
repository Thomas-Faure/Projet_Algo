enum MyErrorPiece: Error {
    case runtimeError(String)
}
public class PieceClass : PieceProtocol {
  public typealias TypePieceA = TypePieceClass
  public typealias PositionA = PositionClass
  public typealias OrientationA = OrientationClass

  public var kodama : Bool
  public var kodama_samurai : Bool
  public var roi : Bool
  public var orient : OrientationA?
  public var position : PositionA?
  public var typePiece : TypePieceA?
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
    }else{
      //indiquer une erreur ?
    }

    return self
  }
  @discardableResult
  public func Set_Position(newPos : PositionA?)->Self{
    if let nPos = newPos{
      if(nPos.position.0 >= 0 && nPos.position.0 <= 3 && nPos.position.1 >= 0 && nPos.position.1 <= 3){
        self.position = nPos
      }
    }else{
      self.position = nil
    }
    return self
  }
  @discardableResult
  public func Set_Orientation(newOrient : OrientationA?)->Self{
    if let orient = newOrient{
      self.orient = orient
    }

    return self
  }
  public func Give_Type()->TypePieceA?{
    return self.typePiece
  }
  public func Give_Position()->PositionA?{
    return self.position
  }
  //fonction ajouté
  @discardableResult
  public func set_Kodama()->Self{
    self.kodama = true
    return self
  }
  public func Give_Orientation()->OrientationA?{
    return self.orient
  }
  public func Piece_Au_Fond()->Bool{
    if let orientPiece = self.Give_Orientation(){
      if let orient = orientPiece.recuperer_Orientation(){
        if(orient == Orientation.N){

          if let pos = self.Give_Position(){
            if(pos.position.1 == 3){
              return true
            }
          }

        }else if(orient == Orientation.S){
          if let pos = self.Give_Position(){
            if(pos.position.1 == 0){
              return true
            }
          }

        }
      }

    }
    return false
  }
  public func Est_Kodama()->Bool{
    return self.kodama
  }
  public func Est_Kodama_Samurai()->Bool{
    return self.kodama_samurai
  }
  public func Est_Roi()->Bool {
    return self.roi
  }
  @discardableResult
  public func Transformer_Kodama_Samurai()->Self{
    if(self.Est_Kodama()){
      if let orientPiece = self.Give_Orientation(){
        if let orient = orientPiece.recuperer_Orientation(){
          if(orient == Orientation.N){

            if let pos = self.Give_Position(){
              if(pos.position.1 == 0){
                print("transformation en Kodama Samurai")
                self.kodama_samurai = true
              }
            }

          }else if(orient == Orientation.S){
            if let pos = self.Give_Position(){
              if(pos.position.1 == 3){
                self.kodama_samurai = true
              }
            }

          }
        }

      }
    }
    return self
  }
  @discardableResult
  public func Transformer_Kodama()->Self{
    if(self.Est_Kodama() && self.Est_Kodama_Samurai()){
      self.kodama_samurai = false
    }
    return self
  }
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
                  if(orientemp.recuperer_Orientation() == Orientation.N){
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

    }else{
      //mettre l'erreur
    }
    return self
  }
}
