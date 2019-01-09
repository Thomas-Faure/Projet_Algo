public class PositionClass : PositionProtocol{
  public typealias Position = PositionClass

  private var position = (0,0)

  public required init(){}

  // init: -> Position
  // cree un position
  public required init(x : Int,y :Int){
    position.0 = x
    position.1 = y
  }

  // Change_Position: Position*Position->Position
  // Prend en parametre une position finale et modifie la postion initiale par cette position finale
  // Pre: posfin est soit vide soit sur le plateau
  // Post: La position est changee, si le paramettre ne correspond pas a une position sur le plateau ou si la position donnee n'est pas vide on ne fait rien.
  @discardableResult
  public func Change_Position(posfin:Position?)->Self{
    if let newPosition = posfin {
      self.position.0 = newPosition.getX()
      self.position.1 = newPosition.getY()
    } 
    return self
  }

  public func getX()->Int{
    return self.position.0
  }

  public func getY()->Int{
    return self.position.1
  }
}
