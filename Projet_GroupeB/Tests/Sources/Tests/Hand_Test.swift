
func Initialiser_Debut_Test()->Int {
    var main = Hand()
    var type1 = TypePiece() //Crée un type inexistant
    type1.Set_Nom("koropokkuru")
    var type1 = TypePiece() //Crée un type inexistant
    type2.Set_Nom("kitsune")
    var type1 = TypePiece() //Crée un type inexistant
    type3.Set_Nom("tanuki")
    var type1 = TypePiece() //Crée un type inexistant
    type4.Set_Nom("kodama")
    var ret : Int = 0
   
    main.Initialiser_Debut()
    if!((main.Est_Dans_Main(type:type1)&&(main.Est_Dans_Main(type:type2))&&(main.Est_Dans_Main(type:type3))&&(main.Est_Dans_Main(type:type1))){
        print("Test si il y a toute les pieces: Echec")
        ret+=1
    }
    else {
        print("OK il y a toute les pieces")
    }
    return ret
}


func Est_Dans_Main_Test()->Int {
    var main = Hand()
    var type_piece TypePiece()
    var type_piece_inexistant = TypePiece() //Crée un type inexistant
    var piece = Piece()
    type_piece_inexistant.Set_Nom(nom:"KoKiKo")
    type_piece.Set_Nom(nom:"kodama")
    piece.Set_Type(type:type_piece)
    main.Ajouter_Piece(piece:piece,pos:(1,1))
    
    var ret : Int = 0
    
    do {
        try main.Est_Dans_Main(type:type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
    if !main.Est_Dans_Main(type:type_piece){
        print("Test type piece si le type existe : ECHEC")
        ret+=1
    }
    else{
        print("OK si type inexistant")
    }
    return ret
}



func Avoir_Piece_Test()->Int{
    var main = Hand()
    var position_inexistante = Position()
    var piece = Piece()
    main.Ajouter_Piece(piece:piece,pos:(1,1))
    position_inexistante.Set_Position(-1,-1)
    var ret : Int = 0
    do {
        try main.Avoir_Piece(pos:position_inexistante)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
    if !main.Avoir_Piece(pos:(1,1)){
        print("Test avoir piece si il y a une piece a cette position : ECHEC")
        ret+=1
    }
    else{
        print("OK si il y a une piece a cette position")
    }
    return ret
}

func Get_Piece_Test()->Int{
    var ret : Int = 0
    var piece = Piece()
    var pieceResult = Piece()
    var main = Hand()
    main.Ajouter_Piece(piece:piece,(1,1))


    
    do {
        try pieceResult=main.Get_Piece(pos:(-1,-1)){
        print("Test si le programme fonction lorsque la position ne fait pas partie du plateau: ECHEC")
        ret+=1
        }
    }
    catch {
        print("OK si la position n'est pas sur le plateau")
    }
    pieceResult=main.Get_Piece(pos:(1,1))
    if !(pieceResult == piece) {
          print("Test si le programme fonctionne lorsque la position est bonne: ECHEC")
          ret+=1
        }
    }
    catch {
        print("OK si la position est bonne")
    }
    return ret
}
    

func Ajouter_Piece_Test()->Int{
    var main = Hand()
    var piece_sans_position = Piece()
    var piece_plateau = Piece()
    
    piece_plateau.Set_Position(2,2)
    
    var ret : Int = 0
    do {
        try {
            main.Ajouter_Piece(piece:piece_plateau,pos:(1,1))
            print("Test si une piece qui a une position peut etre ajoute a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si il y a une piece qui a deja une position")
    }
    do {
        try {
            main.Ajouter_Piece(piece:piece_sans_position,pos:(2,2))
            print("Test si une piece peut etre ajouter a une position deja occupe a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si il y a deja une pieces a la position rentree en parametre")
    }
    do {
        try {
            main.Ajouter_Piece(piece:piece_sans_position,pos:(-1,-1))
            print("Test si une piece peut etre ajouter en dehors du plateau a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si on essaye d'ajouter une piece en dehors du plateau")
    }
    main.Ajouter_Piece(piece:piece_sans_position,pos:(3,3))
    if !main.Avoir_Piece(pos:(3,3)){
        print("Test si l'ajout d'une piece dans la main fonctionne : ECHEC")
        ret+=1
    }
    else{
        print("OK si on ajoute une piece dans la main")
    }
    
    return ret
}



func Supprimer_Piece_Test()->Int{
    var main = Hand()
    var piece_pas_dans_main = Piece()
    var piece = Piece()
    main.Ajouter_Piece(piece:piece,(1,1))
    var ret : Int = 0
    do {
        try main.Supprimer_Piece(piece:piece_plateau,pos:(1,1))
        print("Test si une piece qui n'est pas dans la main peut etre supprimer de la main a echoue")
        ret+=1   
    }
    catch {
        print("OK si on essaye de supprimer une piece qui n'est pas dans la main")
    }
    main.Supprimer_Piece(piece:piece,pos:(1,1))
    if main.Avoir_Piece(1,1)){
        print("Test si supprimer une piece dans la main fonctionne : ECHEC")
        ret+=1
    }
    else{
        print("OK si on supprime une piece dans la main")
    }
    return ret
}

func Deplacer_Piece_Test()->Int{
    var main = Hand()
    var piece = Piece()
    var piece_dans_main = Piece()
    main.Ajouter_Piece(piece:piece_dans_main,(1,1))
    var ret : Int = 0
    do {
        try main.Deplacer_Piece(piece:piece_dans_main,pos:(-1,-1))
        print("Test si une piece peut etre deplacee a une position hors plateau: ECHEC")
        ret+=1
    }
    catch {
        print("OK si la position donnee n'est pas sur le tableau")
    }
    do {
        try main.Deplacer_Piece(piece:piece,pos:(1,1))
        print("Test si une piece qui n'est pas dans la main peut etre deplacee: ECHEC")
        ret+=1
    }
    catch {
        print("OK la piece n'est pas dans la main")
    }
    
    main.Deplacer_Piece(piece:piece_dans_main,pos:(1,2))
    if !main.Avoir_Piece(1,2)){
        print("Test si deplacer une piece fonctionne : ECHEC")
        ret+=1
    }
    else{
        print("OK si on deplace une piece dans la main")
    }
    return ret
}






var nb_erreur : Int = 0
nb_erreur+=Initialiser_Debut_Test()
nb_erreur+=Est_Dans_Main_Test()
nb_erreur+=Avoir_Piece_Test()
nb_erreur+=Ajouter_Piece_Test()
nb_erreur+=Supprimer_Piece_Test()
nb_erreur+=Get_Piece_Test()
nb_erreur+=Deplacer_Piece_Test()

