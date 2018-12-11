func Change_Orientation_Test(){
	var orientation = Orientation()
	var piece = Piece()
    	var ret : Int = 0
  	do {
        	try Change_Orientation(orientfin : X)
       		print("Test orientation inexistante a echoue")
        	ret+=1
   	}
    	catch {
        	print("OK si orientation inexistante")
    	}
	
	orientation.Change_Orientation(orientfin : S)
	if (orientation == S) {
		print("OK pour le changement d'orientation")
	}
	else {
		print("ERREUR lors du changement de position")
		ret+=1
	}
	
    	return ret
}

var nb_erreur : Int = 0
nb_erreur+=Change_Orientation_Test()
