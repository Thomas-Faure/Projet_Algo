public class PositionClass : PositionProtocol{
  public typealias Position = PositionClass
  public var position = (0,0)
  public required init(x : Int,y :Int){
    position.0=x
    position.1=y
  }
  public func Change_Position(posfin:Position?)->Self{
  if let b = posfin {
    position.0 = b.position.0
    position.1 = b.position.1
    return self
  } else {
    return self
  }
  }
}
