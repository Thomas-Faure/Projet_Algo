public class TypePieceClass : TypePieceProtocol{
  private var nom : String

  //init -> TypePiece
  //On initialise un TypePiece a vide
  public required init(){
    nom = ""
  }

  // Give_Nom: TypePiece -> (String | Vide)
  // Donne le nom du type de la piece
  // Post: On a le nom du Type
  public func Give_Nom()->String{
    return nom
  }

  // Set_Nom: TypePiece*String -> TypePiece
  // Modifie le nom du type de la piece
  // Pre: Le nom n'est pas Vide
  // Post le nom du Type a ete modifie
  @discardableResult
  public func Set_Nom(nom:String)->Self{
    self.nom = nom
    return self
  }
}
