public class TypePieceClass : TypePieceProtocol{

    var nom : String

    public required init(){
        nom = ""
    }


    public func Give_Nom()->String{
        return nom
    }

    public func Set_Nom(nom:String)->Self{
        self.nom = nom
        return self
    }
}
