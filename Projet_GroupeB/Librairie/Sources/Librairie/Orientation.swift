public class OrientationClass : OrientationProtocol{
  //init: -> Orientation
  //cree un orientation initialisee a Vide
  private var orient : Orientation?

  // init: -> Orientation
  // cree un orientation initialisee a Vide
  public required init(){

  }


  public func recuperer_Orientation()->Orientation?{
    if let a = self.orient{
      return a
    }
    return nil
  }

  // Change_Orientation: Orientation*Orientation->Orientation
  // Prend en parametre une Orientation finale et modifie l'orientation initiale par cette orientation finale
  // Pre: orientfin est soit vide soit une orientation existante (Nord/Sud par exemple)
  // Post: L'orientation est changee,si le paramettre ne correspond pas a une orientation existante ou si l'orientation donnee n'est pas vide on ne fait rien.
  @discardableResult
  public func Change_Orientation(orientfin : Orientation)->Self{
    self.orient = orientfin
    return self
  }
}
