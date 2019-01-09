public class PositionClass : PositionProtocol{
  public typealias Position = PositionClass

  private var position = (0,0)

  public required init(){}
  public required init(x : Int,y :Int){
    position.0 = x
    position.1 = y
  }

  @discardableResult
  public func Change_Position(posfin:Position?)->Self{
    if let newPosition = posfin {
      self.position.0 = newPosition.getX()
      self.position.1 = newPosition.getY()
      return self
    } else {
      return self
    }
  }

  public func getX()->Int{
    return self.position.0
  }

  public func getY()->Int{
    return self.position.1
  }
}
