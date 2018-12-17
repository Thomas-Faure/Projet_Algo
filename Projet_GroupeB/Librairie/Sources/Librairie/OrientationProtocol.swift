//L orientation est definie comme 'N' pour Nord ou 'S' pour Sud
//
//      x x x       Nord : "N"
//      x x x
//      x x x
//      x x x       Sud : "S"
//
/////////////////////////////////////////////////////////////////

public enum Orientation{
    case N,S
}


public protocol OrientationProtocol{
    //init: -> Orientation
    //cree un orientation initialisee a Vide
    init()

    //Change_Orientation: Orientation*Orientation->Orientation
    //Prend en parametre une Orientation finale et modifie l'orientation initiale par cette orientation finale
    //Pre: orientfin est soit vide soit une orientation existante (Nord/Sud par exemple)
    //Post: L'orientation est changee,si le paramettre ne correspond pas a une orientation existante ou si l'orientation donnee n'est pas vide on ne fait rien.
    @discardableResult
    mutating func Change_Orientation(orientfin:Orientation)->Self
}
