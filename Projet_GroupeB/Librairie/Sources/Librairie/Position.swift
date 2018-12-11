//Position indique l'emplacement d'une carte sur notre Plateau
//Il est défini comme un couple x,y
protocol Position{
    //init: -> Position
    //cree un position initialisee a Vide
    init()
    
    //Change_Position: Position*Position->Position
    //Prend en parametre une position finale et modifie la postion initiale par cette position finale
    //Pre: posfin est soit vide soit sur le plateau
    //Post: La position est changee,si le paramettre ne correspond pas a une position sur le plateau ou si la position donnee n'est pas vide on ne fait rien.
    @discardableResult
    mutating func Change_Position(posfin:Position?)->Self
}
