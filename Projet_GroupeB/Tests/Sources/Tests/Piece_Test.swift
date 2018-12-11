func Set_Type_Test()->Int {
    var piece = Piece()
    var type_piece_inexistant = TypePiece() //Crée un type inexistant
    type_piece_inexistant.Set_Nom(nom : "KoKiKo")
    var ret : Int = 0
    
    do {
        try piece.Set_Type(type : type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
	
	do {
        try piece.Set_Type(type : nil)
        print("Test type piece vide a echoue")
        ret+=1
    }
    catch {
        print("OK si type vide")
    }
	
	var type_piece_existant = TypePiece() //Crée un type inexistant
    type_piece_inexistant.Set_Nom(nom : "Tanuki")
	piece.Set_Type(type : type_piece_existant)
	if piece.Give_Type() == type_piece_existant{
		print("OK pour l'attribution de type")
	}
	else {
		print("ERREUR dans Set_Type")
		ret+=1
	}
    return ret
}





func Set_Position_Test()->Int{
    var piece = Piece()
    var position_non_dispo = Position()
    var piece_plateau = Piece()
	position_non_dispo.Change_Position(posfin : (-1,-1))
    
    var ret : Int = 0

    do {
        try {
            Set_Position(main,piece_sans_position,position_non_dispo)
            print("Test si une piece peut etre ajouter en dehors du plateau a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si on essaye d'ajouter une piece en dehors du plateau")
    }
	
	var position_dispo = Position()
	position_dispo.Change_Position(posfin : (1,1))
	piece.Set_Position(newPos : position_dispo)
	if Piece.Give_Position() == position_dispo {
		print("OK pour l'attribution de position")
	}
	else {
		print("ERREUR dans Set_Position")
		ret+=1
	}
	
    return ret
}


func Set_Orientation_Test() -> Int {

	var orientation = Orientation()
	var piece = Piece()
    	var ret : Int = 0
  	do {
        	try Set_Orientation(orientfin : X)
       		print("Test orientation inexistante a echoue")
        	ret+=1
   	}
    	catch {
        	print("OK si orientation inexistante")
    	}
	
	orientation.Change_Orientation(orientfin : S)
	piece.Set_Orientation(newPos : orientation)
	if (orientation == piece.Give_Orientation()) {
		print("OK pour le changement d'orientation")
	}
	else {
		print("ERREUR lors du changement de position")
		ret+=1
	}
	
    	return ret
}


func Give_Nom_Test() -> Int {
	var ret : Int = 0
	var type_piece= TypePiece() //Crée un type inexistant
	type_piece.Set_Nom(nom : "KoKiKo")
	var piece = Piece()
	piece.Set_Type(type:name)
	if (piece.Give_Type() == type_piece) {
        	print("OK Test de retour de nom")
	}
	else {
        	print("Erreur dans Give_Nom()")
        	ret = ret + 1
	}
	return ret
}


func Give_Position_Test() -> Int {
	var piece = Piece()
	var ret : Int = 0
	var position_dispo = Position()
	position_dispo.Change_Position(posfin : (1,1))
	piece.Set_Position(newPos : position_dispo)
	if Piece.Give_Position() == position_dispo {
		print("OK pour la recuperation de position")
	}
	else {
		print("ERREUR dans Give_Position")
		ret+=1
	}
	
    	return ret
}

func Give_Orientation_Test() -> Int {
	var orientation = Orientation()
	var piece = Piece()do {
        try main.Est_Dans_Main(type:type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
}
    	var ret : Int = 0

	orientation.Change_Orientation(orientfin : S)
	piece.Set_Orientation(newPos : orientation)
	if (orientation == piece.Give_Orientation()) {
		print("OK pour la recuperation d'orientation")
	}
	else {
		print("ERREUR lors de la recuperation de position")
		ret+=1
	}
	
    	return ret
}


func Est_Kodama_Test() -> Int {
	var ret : Int = 0
	var kodama = Piece()
	var piece = Piece()
	var type = TypePiece()
	type.Set_Nom("Kodama")
	piece.Set_Type(type)
	if Est_Kodama(piece){
		print("OK test avec un Kodama reussi")
	}
	else {
		print("ERREUR Test est Kodama avec Kodama)
		ret =+ 1
	}
	type.Set_Nom("Test")
	piece.Set_Type(type)
	if !Est_Kodama(piece){
		print("OK test avec non kodama reussi")
	}
	else {
		print("ERREUR Test est Kodama avec non Kodama)
		ret =+ 1
	}
	return ret
}
		

	
func Est_Kodama_Samourai_Test() -> Int {
	var ret : Int = 0
	var kodama = Piece()
	var piece = Piece()
	var type = TypePiece()
	type.Set_Nom("Kodama_Samourai")
	piece.Set_Type(type)
	if Est_Kodama_Samourai(piece){
		print("OK test avec un Kodama Samourai reussi")
	}
	else {
		print("ERREUR Test est Kodama Samourai avec Kodama Samourai)
		ret =+ 1
	}
	type.Set_Nom("Test")
	piece.Set_Type(type)
	if !Est_Kodama(piece){
		print("OK test avec non kodama Samourai reussi")
	}
	else {
		print("ERREUR Test est Kodama Samourai avec non Kodama Samourai)
		ret =+ 1
	}
	return ret
}

		
		
		
func Est_Roi_Test() -> Int {
	var ret : Int = 0
	var roi = Piece()
	var piece = Piece()
	var type = TypePiece()
	type.Set_Nom("Koropokkuru")
	piece.Set_Type(type)
	if Est_Roi(piece){
		print("OK test avec un Roi reussi")
	}
	else {
		print("ERREUR Test est Roi avec Roi)do {
        try main.Est_Dans_Main(type:type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
}
		ret =+ 1
	}
	type.Set_Nom("Test")
	piece.Set_Type(type)
	if !Est_Roi(piece){
		print("OK test avec non Roi reussi")
	}
	else {
		print("ERREUR Test est Roi avec non Roi)
		ret =+ 1
	}
	return ret
}	
		


func Transformer_Kodama_Samourai() -> Int {
	var kodama = Piece()
	var piece = Piece()
	var type = TypePiece()
	type.Set_Nom("Kodama")
	kodama.Set_Type(type)
	type.Set_Nom("Tanuki")
	piece.Set_Type(type)
	do {
		try piece.Transformer_Kodama_Samourai()
		print("ERREUR test test transformer non kodama a echoue")
		ret+=1
   	}
		catch {
		print("OK si type est un autre")
	}
	
	type.Set_Nom("Test")
	piece.Set_Type(type)
	do {
		try piece.Transformer_Kodama_Samourai()
		print("ERREUR test type inexistant a echoue")
		ret+=1
   	}
		catch {
		print("OK si type est inexistant")
	}
	
	kodama.Transformer_Kodama_Samourai() 
	if (kodama.GiveType().GiveNom()=="Kodama_Samourai"){
		print("OK pour transformer Kodama_Samourai")
	}
	else {
		print("Erreur transformer Kodama Samourai")
		ret+=1
	}
	return ret
}
	
	
	
func Transformer_Kodama() -> Int {
	var kodama = Piece()
	var piece = Piece()
	var type = TypePiece()
	type.Set_Nom("Kodama_Samourai")
	kodama.Set_Type(type)
	type.Set_Nom("Tanuki")
	piece.Set_Type(type)
	do {
		try piece.Transformer_Kodama()
		print("ERREUR test test transformer non kodama samourai a echoue")
		ret+=1
   	}
		catch {
		print("OK si type est un autre")
	}
	
	type.Set_Nom("Test")
	piece.Set_Type(type)
	do {
		try piece.Transformer_Kodama()
		print("ERREUR test type inexistant a echoue")
		ret+=1
   	}
		catch {
		print("OK si type est inexistant")
	}
	
	kodama.Transformer_Kodama_Samourai() 
	if (kodama.GiveType().GiveNom()=="KodamaKodama_Samourai"){
		print("OK pour transformer Kodama")
	}
	else {
		print("Erreur transformer Kodama")
		ret+=1
	}
	return ret
}

	
	
	
	
	
	
var nb_erreur : Int =0
nb_erreur+=Set_Type_Test()
nb_erreur+=Set_Position_Test()
nb_erreur+=Set_Orientation_Test()
nb_erreur+=Give_Nom_Test()
nb_erreur+=Give_Position_Test()
nb_erreur+=Give_Orientation_Test()
nb_erreur+=Est_Kodama_Test()
nb_erreur+=Est_Kodama_Samourai_Test()
nb_erreur+=Est_Roi_Test()
nb_erreur+=Transformer_Kodama_Samourai()
nb_erreur+=Transformer_Kodama()
