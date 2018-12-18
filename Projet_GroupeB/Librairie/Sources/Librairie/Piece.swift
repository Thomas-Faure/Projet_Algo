public class PieceClass : PieceProtocol {
  public typealias TypePieceA = TypePieceClass
  public typealias PositionA = PositionClass
  public typealias OrientationA = OrientationClass

  public var kodama : Bool
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

  }
  public func Set_Type(newType : TypePieceA?)->Self{
    self.typePiece = newType
    return self
  }
  public func Set_Position(newPos : PositionA?)->Self{
    self.position = newPos
    return self
  }
  public func Set_Orientation(newOrient : OrientationA?)->Self{
    self.orient = newOrient
    return self
  }
  public func Give_Type()->TypePieceA?{
    return self.typePiece
  }
  public func Give_Position()->PositionA?{
    return self.position
  }
  public func Give_Orientation()->OrientationA?{
    return self.orient
  }
  public func Piece_Au_Fond()->Bool{
    return false
  }
  public func Est_Kodama()->Bool{
    return !self.kodama
  }
  public func Est_Kodama_Samurai()->Bool{
    return self.kodama
  }
  public func Est_Roi()->Bool {
    return self.roi
  }
  public func Transformer_Kodama_Samurai()->Self{
    self.kodama=true
    return self
  }
  public func Transformer_Kodama()->Self{
    self.kodama=false
    return self
  }
  public func Deplacer_Piece(PosFin:PositionA)->Self{
    self.position=PosFin
    return self
  }
}
