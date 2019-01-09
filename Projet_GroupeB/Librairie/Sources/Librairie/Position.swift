public class PositionClass : PositionProtocol{
  public typealias Position = PositionClass

  public var position = (0,0)

  public required init(){}
  public required init(x : Int,y :Int){
    position.0 = x
    position.1 = y
  }

  @discardableResult
  public func Change_Position(posfin:Position?)->Self{
    if let newPosition = posfin {
      position.0 = newPosition.position.0
      position.1 = newPosition.position.1
      return self
    } else {
      return self
    }
  }

  public func getX()->Int{
    return position.0
  }

  public func getY()->Int{
    return position.1
  }
}
