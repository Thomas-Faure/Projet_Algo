import Foundation
import Librairie



var joueur = JoueurClass(nom:"test",joueur:1)
var main = joueur.Give_Hand()
if let mano = main{
  for i in mano{
    print(i)
  }
}

/*
func Saisir_Position_Finale()->Position {
    var pos = Position()
    var x : Int
    var y : Int
    print("A quelle position souhaitez vous déplacer la piece ?")
    repeat {
        x = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
        y = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
    }while(x<0 || y<0)
    pos.Change_Position(posfin:(x,y))
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


func Saisir_Piece_A_Deplacer(main : Hand)->Piece{
    var piece : Piece?
    var position = Position()
    var x : Int
    var y : Int
    print("Quelle pièce voulez vous déplacer ?")
    repeat {
        repeat {
            x = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
            y = Int(readLine() ?? "") ?? -1 //Force la saisie d'un entier et met la valeur -1 si ce n'en est pas un
        }while(x<0 || y<0)
        position.Change_Position(posfin:(x,y))
    }while(!main.Avoir_Piece(pos: position))
    piece = main.Get_Piece(pos : position)
    return piece
}


func Saisir_Piece_A_Parachuter(reserve : Reserve)->Piece{
    var piece : Piece?
    var type = TypePiece
    var nom : String
    print("Quelle pièce voulez vous parachuter ?")
    repeat {
        nom = ReadLine
        type.Set_Nom(nom:nom)
    }while(!reserve.Est_Dans_Reserve(piece: nom))
    piece = reserve.Get_Piece(nom : type)
    return piece
}


func Changer_Noms_Joueurs(plat:Plateau){
    var joueur : Joueur
    var l : String?
    print("Quel est le nom du premier joueur ?")
    l = readLine()
    guard let l1 : String = l else {
        joueur.Set_Name(nom:"Joueur 1")
        plat.Set_Joueur_1(joueur:joueur)
    }
    joueur.Set_Name(nom:l1)
    plat.Set_Joueur_1(joueur:joueur)
    print("Quel est le nom du deuxième joueur ?")
    l = readLine()
    guard let l2 : String = l else {
        joueur.Set_Name(nom:"Joueur 2")
        plat.Set_Joueur_1(joueur:joueur)
    }
    joueur.CSet_Name(nom:l2)
    plat.Set_Joueur_2(joueur:joueur)

}








var plat = Plateau(l:3,h:4)        //Initialisation du plateau de largeur 3 et de hauteur 4
//Initialisation des joueurs :  A l'initialisation, les

var action : String
var piece : Piece
var piece_a_capturer : Piece
var tour : Int = 1
var positionFinale : Position
var tour_effectue : Bool
var fin_de_partie : Bool = false
var joueur = Joueur()

//Gestion de la déclaration du nom des joueurs. Si le nom reste vide on attribuera Joueur 1 et Joueur 2
Changer_Noms_Joueurs(plat:plat)

while !fin_de_partie {
    tour_effectue=false
    //Changement du joueur et donc de l'adversaire à chaque tour
    if tour%2==1{
        var joueur:Joueur = plat.Give_Joueur1()
        var adversaire:Joueur = plat.Give_Joueur2()
    }
    else {
        var joueur:Joueur = plat.Give_Joueur1()
        var adversaire:Joueur = plat.Give_Joueur2()
    }
    //Vérification que la partie n'est pas finie, donc les deux joueurs possèdent un roi et qu'il n'est pas sur la dernière ligne.
    if(plat.Fin() != nil){
        tour_effectue=true
        fin_de_partie=true
    }
    //On crée le while pour vérifier que le tour est effectué (créé dans des cas où le joueur veut avoir accès à sa réserve mais qu'elle est vide), on redemandera alors le choix du début
    while(!tour_effectue){
        action=demander_action()

        //Si le joueur veut se déplacer
        if action == "Deplacer" {
            repeat{
                piece = Saisir_Piece_A_Deplacer(main : joueur.Give_Hand())
                positionFinale = Saisir_Position_Finale()
            } while(!plat.Est_Deplacement_Possible(piece:piece,pos:positionFinale))
            //Un deplacement n'est pas possible si la piece sort du plateau, si une piece nous appartenant est à cette place ou si ce deplacement n'est pas autorisé par les caractéristiques de la piece

            if (adversaire.Give_Hand.Avoir_Piece(pos:positionFinale)){
                //capturer une piece
                piece_a_capturer = adversaire.Get_Piece(pos:positionFinale)

                //Suppression dans le jeu adverse
                var tmp2: Hand = adversaire.Give_Hand()
                tmp2.Supprimer_Piece(piece : piece_a_capturer)
                adversaire.Set_Reserve(reserve : tmp2)


                if Est_Kodama_Samourai(piece:piece_a_capturer){

                    piece_a_capturer.Transformer_Kodama()
                }

                //Ajout dans notre Reserve

                var tmp : Reserve = joueur.Give_Reserve()
                tmp.Ajouter_Piece(piece : piece_a_capturer)
                joueur.Set_Reserve(reserve : tmp)
            }



            piece.Deplacer_Piece(posFin:positionFinale)
            if piece.Est_Kodama(){
                if (piece.Est_Au_Fond()){
                    piece.Transformer_Kodama_Samourai()
                }
            }
            tour_effectue=true

        }

        else if action=="Parachuter"{
            if (!joueur.GiveReserve.est_vide()){
                repeat{
                    piece = Saisir_Piece_A_Parachuter(reserve : joueur.Give_Reserve)
                    positionFinale = Saisir_Position_Finale()
                } while(!plat.Est_Case_Vide(pos:positionFinale))
                //Un parachutage est possible uniquement si la case est vide
                //Ajout a notre main
                var tmp3 : Hand = joueur.Give_Hand()
                tmp.Ajouter_Piece(piece : piece_a_capturer)
                joueur.Set_Hand(newHand : tmp3)

                //On enleve de la reserve
                var tmp4 : Reserve = joueur.Give_Reserve()
                tmp.Supprimer_Piece(piece : piece_a_capturer)
                joueur.Set_Reserve(reserve : tmp4)

                tour_effectue = true
            }
        }
    }


    if tour%2==1{
        plat.Set_Joueur1(joueur:joueur)
        plat.Set_Joueur2(joueur:adversaire)
    }
    else {
        plat.Set_Joueur2(joueur:joueur)
        plat.Set_Joueur2(joueur:adversaire)
    }
    tour = tour + 1
}
let joueur_gagnant=plat.fin()
let annonce = "Le joueur" + joueur_gagnant.GiveName() + "a gagné"
print(annonce)
exit()*/
