func Give_Joueur1_Test(){
  var plat = Plateau()
  var joueur = Joueur()
  var ret:Int = 0
  plat.Set_Joueur1(joueur:joueur)
  if plat.Give_Joueur1() == joueur {
    	print("Ok pour Give_Joueur1()")
  }
  else{
      print("Erreur pour Give_Joueur1()")
      ret+=1
  }
  return ret
}

func Give_Joueur2_Test(){
  var plat = Plateau()
  var ret:Int = 0
  var joueur = Joueur()
  plat.Set_Joueur2(joueur:joueur)
  if plat.Give_Joueur2() == joueur {
    	print("Ok pour Give_Joueur2()")
  }
  else{
      print("Erreur pour Give_Joueur2()")
      ret+=1
  }
  return ret
}

func Set_Joueur1_Test(){
   var plat = Plateau()
   var joueur = Joueur()
   var ret:Int = 0
   do{
      try plat.Set_Joueur1(joueur:joueur)
      print("Ok pour la modification du Joueur1") 
   }
   catch{
      print("Erreur lors de la modification du Joueur1")
      ret+=1
   }
   plat.Set_Joueur1(joueur:joueur)	
   if plat.Give_Joueur1() == joueur {
    	print("Ok pour Give_Joueur1()")
   }
   else{
       print("Erreur pour Give_Joueur1()")
       ret+=1
   }
   return ret
}

func Set_Joueur2_Test(){
   var plat = Plateau()
   var joueur = Joueur()
   var ret:Int = 0
   do{
      try plat.Set_Joueur2(joueur:joueur)
      print("Ok pour la modification du Joueur1") 
   }
   catch{
      print("Erreur lors de la modification du Joueur2")
      ret+=1
   }
   plat.Set_Joueur2(joueur:joueur)	
   if plat.Give_Joueur2() == joueur {
    	print("Ok pour Give_Joueur2()")
   }
   else{
       print("Erreur pour Give_Joueur2()")
       ret+=1
   }
   return ret
}

func Est_Case_Vide_Test(){
	var plat=Plateau()
	var piece=Piece()
	var main=Main()
	var joueur=Joueur()
	var ret:Int = 0
	piece.Set_Position(pos:(1,1)
        main.Ajouter_Piece(piece:piece)
	joueur.Set_Hand(newHand:main)
	plateau.Set_Joueur1(joueur:joueur)
			   
	do{
		try palt.Est_Case_Vide(pos:(-1,-1))
		print("Le test pour regarder si le programme fonctionne avec une position hors plateau a echoue")
		ret+=1
	}
	catch{
		print("Ok si la position n'est pas sur le plateau")
	}
	if!(plat.Est_Case_Vide(pos:(1,1))){
		print("Erreur pour Est_Case_Vide()")
		ret+=1
	}
	else{
		print("Ok pour Est_Case_Vide()")
	}
	return ret
}
	
func Piece_Position_Test(){
	var pieceResult = Piece()
	var plat=Plateau()
	var piece=Piece()
	var main=Main()
	var joueur=Joueur()
	var ret:Int = 0
	piece.Set_Position(pos:(1,1)
        main.Ajouter_Piece(piece:piece)
	joueur.Set_Hand(newHand:main)
	plateau.Set_Joueur1(joueur:joueur)
			   
	do{
		try pieceResult=plat.Piece_Position(pos:(-1,-1))
		print("Le test pour regarder si le programme fonctionne avec une position hors plateau a echoue")
		ret+=1
	}
	catch{
		print("Ok si la position n'est pas sur le plateau")
	}
	pieceResult=plat.Piece_Position(pos:(1,1))		   
	if!(pieceResult==piece){
		print("Erreur pour Piece_Position()")
		ret+=1
	}
	else{
		print("Ok pour Piece_Position()")
	}
	return ret
}
	
var nb_erreur : Int =0
nb_erreur+=Give_Joueur1_Test()
nb_erreur+=Give_Joueur2_Test()
nb_erreur+=Set_Joueur1_Test()
nb_erreur+=Set_Joueur2_Test()
nb_erreur+=Est_Case_Vide_Test()
nb_erreur+=Piece_Position_Test()





	







