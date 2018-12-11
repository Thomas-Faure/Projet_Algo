func Give_Hand_Test() -> Int {
    var ret : Int = 0
    var main = Hand()
    var joueur = Joueur()
    if (joueur.Give_Hand() == main) {
        print("OK Test de retour de main avec main initialisée")
    }
    else {
        print("Erreur dans Give_Hand()")
        ret = ret + 1
    }
    return ret
}


func Give_Reserve_Test() -> Int {
    var ret : Int = 0
    var reserve = Reserve()
    var joueur = Joueur()
    if (joueur.Give_Hand() == reserve) {
        print("OK Test de retour de reserve avec main initialisée")
    }
    else {
        print("Erreur dans Give_Reserve()")
        ret = ret + 1
    }
    return ret
}


func Give_Name_Test() -> Int {
    var ret : Int = 0
    var name : String = "Test"
    var joueur = Joueur()
    joueur.Set_Name(nom:name)
    if (joueur.Give_Name() == name) {
        print("OK Test de retour de nom")
    }
    else {
        print("Erreur dans Give_Name()")
        ret = ret + 1
    }
    return ret
}




func Set_Name_Test()->Int{
    var ret : Int = 0
    var name = nil
    var joueur = Joueur()
    do {
        try joueur.Set_Name(name:name)
        print("Test de nom vide a échoué")
        ret+=1
    }
    catch {
        print("OK si nom vide")
    }
 
    name = "Test"
    joueur.Set_Name(nom:name)
    if (joueur.Give_Name() == name) {
        print("OK Test de changement de nom")
    }
    else {
        print("Erreur dans Set_Name()")
        ret = ret + 1
    }
    
    return ret
}


func Set_Hand_Test()->Int{
    var ret : Int = 0
    var joueur = Joueur()
    var main = Hand()
    joueur.Set_Hand(newHand : main)
    if (joueur.GiveHand()==main) {
        print("OK test de changement de main")
    }
    else {
        print("Erreur dans Set_Hand")
        ret = ret + 1
    }
}


func Set_Reserve_Test()->Int{
    var ret : Int = 0
    var joueur = Joueur()
    var reserve = Reserve()
    var piece = Piece()
    reserve.Ajouter_Piece(piece : piece)
    joueur.Set_Reserve(newReserve : reserve)
    if (joueur.GiveReserve()==reserve) {
        print("OK test de changement de reserve")
    }
    else {
        print("Erreur dans Set_Reserve")
        ret = ret + 1
    }
}



var nb_erreur : Int = 0
nb_erreur+=Give_Hand_Test()
nb_erreur+=Give_Reserve_Test()
nb_erreur+=Give_Name_Test()
nb_erreur+=Set_Name_Test()
nb_erreur+=Set_Hand_Test()
nb_erreur+=Set_Reserve_Test()
