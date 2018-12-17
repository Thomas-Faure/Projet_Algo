//Un typePiece est defini par son nom
public protocol TypePieceProtocol{
    //init -> TypePiece
    //On initialise un TypePiece a vide
    init()
    
    //Give_Nom: TypePiece -> (String | Vide)
    //Donne le nom du type de la piece
    //Post: On a le nom du Type
    func Give_Nom()->String
    
    //Set_Nom: TypePiece*String -> TypePiece
    //Modifie le nom du type de la piece
    //Pre: Le nom n'est pas Vide
    //Post le nom du Type a ete modifie
    mutating func Set_Nom(nom:String)->Self
}

