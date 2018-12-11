func Give_Nom_Test() -> Int {
    var ret : Int = 0
    var name : String = "Test"
    var type = TypePiece()
    type.Set_Nom(nom:name)
    if (type.Give_Nom() == name) {
        print("OK Test de retour de nom")
    }
    else {
        print("Erreur dans Give_Nom()")
        ret = ret + 1
    }
    return ret
}

func Set_Nom_Test()->Int{
    var ret : Int = 0
    var name = nil
    var type = TypePiece()
    do {
        try type.Set_Nom(nom:name)
        print("Test de nom vide a échoue")
        ret+=1
    }
    catch {
        print("OK si nom vide")
    }
 
    name = "Test"
    type.Set_Nom(nom:name)
    if (type.Give_Nom() == name) {
        print("OK Test de changement de nom")
    }
    else {
        print("Erreur dans Set_Nom()")
        ret = ret + 1
    }
    
    return ret
}

var nb_erreur : Int = 0
nb_erreur+=Set_Nom_Test()
nb_erreur+=Give_Nom_Test()
