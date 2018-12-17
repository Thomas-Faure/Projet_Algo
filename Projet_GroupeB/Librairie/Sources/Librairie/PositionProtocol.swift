//Position indique l'emplacement d'une carte sur notre Plateau
//Il est défini comme un couple x,y d'entier avec la disposition suivante:
//
//      x x x       (0,0)(0,1)(0,2)
//      x x x   ==  (1,0)(1,1)(1,2)
//      x x x   ==  (2,0)(2,1)(2,2)
//      x x x       (3,0)(3,1)(3,2)
//
///////////////////////////////////////////////////////////////////

public protocol PositionProtocol{
    associatedtype Position : PositionProtocol
    //init: -> Position
    //cree un position
    init(x : Int,y :Int)


    //Change_Position: Position*Position->Position
    //Prend en parametre une position finale et modifie la postion initiale par cette position finale
    //Pre: posfin est soit vide soit sur le plateau
    //Post: La position est changee,si le paramettre ne correspond pas a une position sur le plateau ou si la position donnee n'est pas vide on ne fait rien.
    @discardableResult
    mutating func Change_Position(posfin:Position?)->Self
}
