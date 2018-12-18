public class ReserveClass : ReserveProtocol{

  public typealias Position = PositionClass


  public typealias TypePiece = TypePieceClass
  public typealias Piece = PieceClass
  public typealias IteratorPieceProtocol = ItPiece

  public var listePiece : [Piece]?


  public required init?(){
    listePiece = nil
  }

  public func Est_Vide()->Bool{
    if let a = self.listePiece{
      if(a.count == 0){
        return true
      }else{
        return false
      }
    }
    return false
  }


  public func Est_Dans_Reserve(piece:Piece)->Bool{
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


  public func Get_Piece(nom : TypePiece)->Piece?{
    var piece : Piece?
    if let a = self.listePiece{
      for i in 0...(a.count-1){
        if(a[i].Give_Type() === nom){
          piece = a[i]
        }
      }
      return piece
    }
    return nil
  }


  public func Ajouter_Piece(piece:Piece)->Self{
    return self
  }

  public func Supprimer_Piece(piece:Piece)->Self{
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
     private let keys : [Piece]

     fileprivate init(_ a: ReserveClass){
        self.reserve = a
        let test = Piece()
        self.keys = [test,test]
     }
     public mutating func next() -> Piece?{
       let test = Piece()
       return test

  }

}
