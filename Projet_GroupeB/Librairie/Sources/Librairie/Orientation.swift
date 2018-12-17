public class OrientationClass : OrientationProtocol{
    //init: -> Orientation
    //cree un orientation initialisee a Vide
    private var orient : Orientation?
    public required init(){

    }
    public func recuperer_Orientation()->Orientation?{
      if let a = self.orient{
        return a
      }
      return nil
    }


    public func Change_Orientation(orientfin : Orientation)->Self{
      self.orient = orientfin
      return self
    }
}
