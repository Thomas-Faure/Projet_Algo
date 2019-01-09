public class ReserveClass : ReserveProtocol{

  public typealias Position = PositionClass


  public typealias TypePiece = TypePieceClass
  public typealias Piece = PieceClass
  public typealias IteratorPieceProtocol = ItPiece

  public var listePiece : [Piece]?

  public required init(){ //fait
    listePiece = nil
  }
  @discardableResult
  public func retournerListe()->[Piece]?{
    return self.listePiece
  }


  public func Est_Vide()->Bool{ //fait
    if let liste = listePiece{
      if liste.count>=1{
        return false
      }else{
        return true
      }
    }

    return self.listePiece==nil
  }


  public func Est_Dans_Reserve(piece:Piece)->Bool{ //fait
    var retour = false
    if let liste = self.listePiece{
      for p in liste{
        if(p === piece){
          retour = true
        }
      }
      return retour
    }else{
      return false
    }
  }


  public func Get_Piece(nom : TypePiece)->Piece?{
    var piece : Piece?
    piece = nil
    var trouver=false
    if let liste = self.listePiece{
      for p in liste{
        if let typ = p.Give_Type(){
          if(typ.Give_Nom() == nom.Give_Nom() && !trouver){
            piece = p
            trouver=true
          }
        }
      }
      return piece
    }
    return piece
  }

  @discardableResult
  public func Ajouter_Piece(piece :Piece)->Self{
    if(piece.Give_Position() != nil){
      var nouvellePiece = piece
      nouvellePiece = nouvellePiece.Set_Position(newPos: nil)
      if var liste = self.listePiece{
        liste.append(nouvellePiece)
        self.listePiece=liste
      }else{
        self.listePiece=[nouvellePiece]
      }
    }else{

    }
    return self
  }
  @discardableResult
  public func Supprimer_Piece(piece:Piece)->Self{
    if(!self.Est_Vide()){
      var count = 0
      if var liste = self.listePiece{
        if(piece.Give_Position() != nil){
          for ele in liste{
              if ele === piece{
                liste.remove(at: count)
                self.listePiece=liste
              }
              count = count + 1
          }
        }
      }
    }
    return self

  }
  public func makeIterator()->ItPiece{
    return ItPiece(self)

  }
}

public struct ItPiece : IteratorProtocol{
  public typealias Piece = PieceClass
  private let reserve : ReserveClass
     private var courant : Int = 0
     private let keys : [Piece]?
     fileprivate init(_ a: ReserveClass){
        self.reserve = a
        self.keys = a.retournerListe()
     }
     public mutating func next() -> Piece?{
       if var ken = keys{
         if(courant == ken.count){return nil}
         let retour = ken[courant]
         courant = courant + 1
         return retour
       }
       return nil

     }

}
