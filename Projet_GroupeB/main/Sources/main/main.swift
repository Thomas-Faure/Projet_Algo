import Foundation
import Librairie



func Saisir_Position_Finale()->PositionClass {
    let pos = PositionClass()
    var x : Int
    var y : Int
    print("A quelle position souhaitez vous déplacer la piece ?")
    repeat {
        x = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
        y = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
    }while(x<0 || y<0)
    pos.Change_Position(posfin: PositionClass(x: x,y: y))
    return pos
}


func Demander_Action()->String {
    print("Voulez vous vous déplacer ou parachuter une piece ? ")
    var res = readLine()
    while res == nil || (res != "Deplacer"  && res != "Parachuter"){
        print("Choix non possible")
        res = readLine()
    }
    guard let ret : String = res else {
        fatalError("Problème lors du choix de l'action")
    }
    return ret
}
func Saisir_Piece_A_Deplacer(main : HandClass?)->PieceClass?{
    if let mainn = main{
      var piece : PieceClass?
      let position = PositionClass()
      var x : Int
      var y : Int
      print("Quelle pièce voulez vous déplacer ?")
      repeat {
          repeat {
              x = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
              y = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
          }while(x<0 || y<0)
          position.Change_Position(posfin: PositionClass(x: x,y: y))
      }while(!mainn.Avoir_Piece(pos: position))
      piece = mainn.Get_Piece(pos : position)

    return piece
    }
    return nil
}

func Saisir_Piece_A_Parachuter(reserve : ReserveClass)->PieceClass?{
    var piece : PieceClass?
    let type = TypePieceClass()
    var nom = ""
    print("Quelle pièce voulez vous parachuter ?")
    var pieceComparaison = PieceClass()
    repeat {
      if let str = readLine(){
        nom=str
      }
      type.Set_Nom(nom:nom)
      if let tmppiece = reserve.Get_Piece(nom : type){
        pieceComparaison=tmppiece
      }
    }while(!reserve.Est_Dans_Reserve(piece: pieceComparaison))
    piece = reserve.Get_Piece(nom : type)
    return piece
}

func Changer_Noms_Joueurs(plat: inout PlateauClass){

      var joueur = JoueurClass(nom:"",joueur:1)
      var l : String?
      print("Quel est le nom du premier joueur ?")
      l = readLine()
      guard let l1 = l else {
          joueur.Set_Name(nom:"Joueur 1")
          plat.Set_Joueur1(joueur:joueur)
          return
      }
      joueur.Set_Name(nom:l1)
      plat.Set_Joueur1(joueur:joueur)
      joueur = JoueurClass(nom:"",joueur:2)
      print("Quel est le nom du deuxième joueur ?")
      l = readLine()
      guard let l2 = l else {
          joueur.Set_Name(nom:"Joueur 2")
          plat.Set_Joueur2(joueur:joueur)
          return
      }
      joueur.Set_Name(nom:l2)
      plat.Set_Joueur2(joueur:joueur)



}




var plattemp = PlateauClass(l:3,h:4)
if var plat = plattemp{


var action : String
var piece = PieceClass()
var piece_a_capturer : PieceClass
var tour : Int = 1
var positionFinale = PositionClass()
var tour_effectue : Bool
var fin_de_partie : Bool = false
var joueur = JoueurClass()
var adversaire = JoueurClass()


//Gestion de la déclaration du nom des joueurs. Si le nom reste vide on attribuera Joueur 1 et Joueur 2
Changer_Noms_Joueurs(plat : &plat)

while !fin_de_partie {
    tour_effectue=false
    //Changement du joueur et donc de l'adversaire à chaque tour
    if tour%2==1{
        if let j1 = plat.Give_Joueur1(){
          joueur = j1
          print("c'est le tour du joueur 1")
        }
        if let j2 = plat.Give_Joueur2(){
          adversaire = j2
        }

    }
    else {
      if let j1 = plat.Give_Joueur1(){
        adversaire = j1
      }
      if let j2 = plat.Give_Joueur2(){
        joueur = j2
        print("c'est le tour du joueur 2")
      }
    }
    //Vérification que la partie n'est pas finie, donc les deux joueurs possèdent un roi et qu'il n'est pas sur la dernière ligne.
    if(plat.Fin() != nil){
        print("fin de partie !!!")
        tour_effectue=true
        fin_de_partie=true
    }
    //On crée le while pour vérifier que le tour est effectué (créé dans des cas où le joueur veut avoir accès à sa réserve mais qu'elle est vide), on redemandera alors le choix du début
    while(!tour_effectue){
        action=Demander_Action()

        //Si le joueur veut se déplacer
        if action == "Deplacer" {
          if let liste = joueur.Give_Hand()!.liste{
            for element in liste{

                print(element.Give_Type()!.Give_Nom())
                print(element.Give_Position()!.getX())
                print(element.Give_Position()!.getY())
                print("-------------------------------")
            }
          }
            repeat{
                if let giveHand = joueur.Give_Hand(){
                  if let saisirPieceDeplacer = Saisir_Piece_A_Deplacer(main : giveHand){
                    piece = saisirPieceDeplacer
                  }
                  positionFinale = Saisir_Position_Finale()
                }
            } while(!plat.Est_Deplacement_Possible(piece:piece,pos:positionFinale))
            //Un deplacement n'est pas possible si la piece sort du plateau, si une piece nous appartenant est à cette place ou si ce deplacement n'est pas autorisé par les caractéristiques de la piece

            if let giveHand = adversaire.Give_Hand(){
              if (giveHand.Avoir_Piece(pos:positionFinale)){
                  if let PiecePositionFin = giveHand.Get_Piece(pos:positionFinale){

                    //capturer une piece
                    piece_a_capturer = PiecePositionFin

                    //Suppression dans le jeu adverse
                    let tmp2 = giveHand

                    tmp2.Supprimer_Piece(piece: piece_a_capturer)
                    adversaire.Set_Hand(newHand: tmp2)

                    if piece_a_capturer.Est_Kodama_Samurai(){

                        piece_a_capturer.Transformer_Kodama()
                    }

                    //Ajout dans notre Reserve

                    var tmp = joueur.Give_Reserve()

                    if let tmpp = tmp{

                      tmpp.Ajouter_Piece(piece : piece_a_capturer)
                      joueur.Set_Reserve(newReserve : tmpp)
                      tmp=tmpp
                    }
                  }
              }
            }
            piece.Deplacer_Piece(PosFin:positionFinale)
            if piece.Est_Kodama(){
                if (piece.Piece_Au_Fond()){
                    piece.Transformer_Kodama_Samurai()
                }
            }
            tour_effectue=true

        }
        else if action=="Parachuter"{
            if let joueurReserve = joueur.Give_Reserve(){
              if (!joueurReserve.Est_Vide()){
                  repeat{
                      if let giveReserve = joueur.Give_Reserve(){
                        if let saisirPiece = Saisir_Piece_A_Parachuter(reserve : giveReserve){
                          piece = saisirPiece
                        }
                        positionFinale = Saisir_Position_Finale()
                      }
                  } while(!plat.Est_Case_Vide(pos:positionFinale))
                  //Un parachutage est possible uniquement si la case est vide
                  //Ajout a notre main
                  var tmp3 = joueur.Give_Hand()
                  if let tmpp = tmp3{
                    tmpp.Ajouter_Piece(piece : piece , pos : positionFinale)
                    joueur.Set_Hand(newHand : tmpp)
                    tmp3=tmpp
                  }

                  //On enleve de la reserve
                  var tmp4 = joueur.Give_Reserve()
                  if let tmpp = tmp4{
                    tmpp.Supprimer_Piece(piece : piece)
                    joueur.Set_Reserve(newReserve : tmpp)
                    tmp4=tmpp
                  }

                  tour_effectue = true
              }
          }
        }
    }



    tour = tour + 1
}
var joueur_gagnant = JoueurClass()
if let fin = plat.Fin(){
  joueur_gagnant=fin
}

let annonce = "Le joueur " + joueur_gagnant.Give_Name() + " a gagné"
print(annonce)
}
