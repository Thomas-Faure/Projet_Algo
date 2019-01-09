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
  if let a = self.listePiece{
    for i in 0...(a.count-1){
        if(a[i] === piece){
          retour = true
        }
      }
      return retour
    }
    return false
  }


  public func Get_Piece(nom : TypePiece)->Piece?{ //fait
    var piece : Piece?
    piece = nil
    var trouver=false
    if let a = self.listePiece{
      for i in 0...(a.count-1){
        if let typ = a[i].Give_Type(){
          if(typ.Give_Nom() == nom.Give_Nom() && !trouver){
            piece = a[i]
            trouver=true
          }
        }
      }
      return piece
    }
    return piece
  }

  @discardableResult
  public func Ajouter_Piece(piece :Piece)->Self{ //fait
    if(piece.Give_Position() != nil){
      var nouvellePiece = piece
      nouvellePiece = nouvellePiece.Set_Position(newPos: nil)
      if var a = self.listePiece{
        a.append(nouvellePiece)

        self.listePiece=a
      }else{
        self.listePiece=[nouvellePiece]
      }
    }else{

    }
    return self
  }
  @discardableResult
  public func Supprimer_Piece(piece:Piece)->Self{ //fait
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
