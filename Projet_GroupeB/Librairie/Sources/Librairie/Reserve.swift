public class ReserveClass : ReserveProtocol{

  public typealias Position = PositionClass


  public typealias TypePiece = TypePieceClass
  public typealias Piece = PieceClass
  public typealias IteratorPieceProtocol = IteratorProtocol

  public var listePiece : [Piece]


  public required init?(){

  }

  public func Est_Vide()->Bool{
    if(listePiece.count == 0){
      return true
    }else{
      return false
    }
  }


  public func Est_Dans_Reserve(piece:Piece)->Bool{
  var retour = false
  for i in 0...(self.listePiece.count-1){
      if(self.listePiece[i] === piece){
        retour = true
      }
    }
    return retour
  }


  public func Get_Piece(nom : TypePiece)->Piece?{
    var piece : Piece?
    for i in 0...(self.listePiece.count-1){
      if(self.listePiece[i].Give_Type() === nom){
        piece = self.listePiece[i]
      }
    }
    return piece
  }


  public func Ajouter_Piece(piece:Piece)->Self{
    return self
  }

  public func Supprimer_Piece(piece:Piece)->Self{
    return self

  }
  public func makeIteratorPiece()->IteratorPieceProtocol{

  }

}
