func Est_Vide_Test()->Int{
    var ret : Int = 0
    var piece = Piece()
    var reserve_vide = Reserve()
    var reserve = Reserve()
    reserve.Ajouter_Piece(piece:piece)

    if reserve.Est_Vide(){
          print("Test si une reserve non vide fonctionne a échoué")
          ret+=1
    }
    else {
        print("OK si la reserve n'est pas vide")
    }
    if !reserve_vide.Est_Vide(){
        print("Test si une reserve vide fonctionne : ECHEC")
        ret+=1
    }
    else {
        print("OK si la reserve est vide")
    }
    return ret
}

func Est_Dans_Reserve_Test()->Int{
    var ret : Int = 0
    var piece = Piece()
    var piece_dans_reserve = Piece()
    var reserve = Reserve()
    reserve.Ajouter_Piece(piece:piece_dans_reserve)
    

    if !reserve.Est_Dans_Reserve(piece:piece_dans_reserve){
        print("Test si le programme fonction lorsque la piece est dans la reserve: ECHEC")
        ret+=1
    }
    else{
        print("OK si la piece est dans la reserve")
    }
    if reserve.Est_Dans_Reserve(piece:piece){
        int("Test si le programme fonctionne lorsque la piece n'est pas dans la reserve: ECHEC")
        ret+=1
    }
    else{
        print("OK si la piece n'est pas dans la reserve")
    }
    return ret
}

func Ajouter_Piece_Test()->Int{
    var ret : Int = 0
    var piece = Piece()
    var piece_sans_position = Piece()
    var reserve = Reserve()
    piece.Set_Position(newPos:(1,1))

    
    do {
        try reserve.Ajouter_Piece(piece:piece_sans_position){
        print("Test si le programme fonction lorsque la piece n'a pas de position: ECHEC")
        ret+=1
        }
    }
    catch {
        print("OK si la piece n'a pas de position")
    }
    reserve.Ajouter_Piece(piece:piece)
    if!reserve.Est_Dans_Reserve(piece:piece){
      print("Test si le programme fonctionne lorsque on ajoute une piece qui a une position: ECHEC")
      ret+=1
    }
    else {
        print("OK si on ajoute une piece avec une position")
    }
    return ret
}

func Get_Piece_Test()->Int{
    var ret : Int = 0
    var piece = Piece()
    var piece_type_inexistant = Piece()
    var type = TypePiece()
    var type_inexistant
    var pieceResult = Piece()
   
    type.Set_Nom(nom:"kodama")
    type_inexistant.Set_Nom(nom:"kokiko")
    piece.Set_Type(type:type)
    piece_type_inexistant.Set_Type(type:type_inexistant)
    piece.Set_Position(newPos:(1,1))
    piece_type_inexistant.Set_Position(newPos:(1,1))
    
    var reserve = Reserve()
    reserve.Ajouter_Piece(piece:piece)
    reserve.Ajouter_Piece(piece:piece_type_inexistant)

    
    do {
        try pieceResult=reserve.Get_Piece(nom:type_inexistant){
        print("Test si le programme fonction lorsque le type n'existe pas: ECHEC")
        ret+=1
        }
    }
    catch {
        print("OK si le type n'existe pas")
    }
    pieceResult=reserve.Get_Piece(nom:type)
    if!(pieceResult==piece){
       print("Test si le programme fonctionne lorsque demande un piece a partir d'un type existant: ECHEC")
       ret+=1
    }
    else {
       print("OK si le type existe")
    }
    return ret
}

func Supprimer_Piece_Test()->Int{
    var ret : Int = 0
    var piece = Piece()
    var piece_dans_reserve = Piece()
    var reserve = Reserve()
    piece.Set_Position(newPos:(1,1))
    reserve.Ajouter_Piece(piece:piece_dans_reserve)

    
    do {
        try reserve.Supprimer_Piece(piece:piece){
        print("Test si le programme fonction lorsque on supprime une piece qui n'est pas dans la reserve: ECHEC")
        ret+=1
        }
    }
    catch {
        print("OK si la piece n'est pas dans la reserve")
    }
    reserve.Supprimer_Piece(piece:piece_dans_reserve)
    if!reserve.Est_Vide(){
       print("Test si le programme fonctionne lorsque on supprime une piece qui est dans la reserve: ECHEC")
       ret+=1
    }
    else {
       print("OK si on ajoute une piece avec une position")
    }
    return ret
}









var nb_erreur : Int = 0
nb_erreur+=Est_Vide_Test()
nb_erreur+=Est_Dans_Reserve_Test()
nb_erreur+=Get_Piece_Test()
nb_erreur+=Ajouter_Piece_Test()
nb_erreur+=Supprimer_Piece_Test()
