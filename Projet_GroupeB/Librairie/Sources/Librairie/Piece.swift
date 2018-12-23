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
    // indiquer une erreur ?
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
  public func Transformer_Kodama_Samurai()->Self{
    if(self.Est_Kodama()){
      self.kodama_samurai = true
    }
    return self
  }
  public func Transformer_Kodama()->Self{
    if(self.Est_Kodama() && self.Est_Kodama_Samurai()){
      self.kodama_samurai = false
    }
    return self
  }
  @discardableResult
  public func Deplacer_Piece(PosFin:PositionA)->Self{
    //on verifie qu'on soit bien sur le plateau
    if(PosFin.position.0 >= 0 && PosFin.position.0 <= 3 && PosFin.position.1 >= 0 && PosFin.position.1 <= 3){
        self.position=PosFin
    }else{
      //mettre l'erreur
    }
    return self
  }
}
