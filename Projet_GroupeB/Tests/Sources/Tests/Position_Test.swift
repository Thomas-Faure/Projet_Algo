func Change_Position_Test()->Int{
    var ret : Int = 0
    var position = Position()
    
    do {
        try position.Change_Position(posfin:(-1,-1))
        print("Position hors plateau : Echec")
        ret+=1
    }
    catch {
        print("OK si position hors plateau")
    }
 
    position.Change_Position(posfin:(1,1))
    if (position == (1,1)) {
        print("OK changement position")
    }
    else {
        print("Erreur dans Change_Position()")
        ret = ret + 1
    }
    
    return ret
}

var nb_erreur : Int = 0
nb_erreur+=Change_Position_Test()
