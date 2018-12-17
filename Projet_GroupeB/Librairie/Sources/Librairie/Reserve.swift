public class ReserveClass : ReserveProtocol{

  public typealias Position = PositionClass


  public typealias TypePiece = TypePieceClass
  public typealias Piece = PieceClass
  var listePiece : [Piece]


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
    for i in listePiece{
        if(listePiece[i]==Piece){
          retour=true
        }
    }
    return retour
  }


  public func Get_Piece(nom:TypePiece) -> Piece?{
    var piece : Piece?
    for i in listePiece{
      if(listePiece.Give_Type() == nom.Give_Type){
        piece=listePiece()
      }
    }
    return
  }


  public func Ajouter_Piece(piece:Piece)->Self{
    return self
  }

  public func Supprimer_Piece(piece:Piece)->Self{
    return self

  }

}
