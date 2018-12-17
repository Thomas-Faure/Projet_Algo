//Un plateau est une collection de positions +2 joueurs
public protocol PlateauProtocol:Sequence{
    associatedtype Joueur : JoueurProtocol
    associatedtype Piece : PieceProtocol
    associatedtype Position : PositionProtocol
    associatedtype IteratorPositionProtocol : IteratorProtocol
        where IteratorPositionProtocol.Element == Position

    //init: Int*Int->Plateau
    //Initialisation d'un plateau de longeur de longeur l et de hauteur h et de deux joueurs
    //Pre: l>0 & h>0
    //Sinon la creation du plateau echoue
    init?(l:Int,h:Int)

    //Give_Joueur1: Plateau -> Joueur
    //retourne le joueur 1 du plateau
    //Post: On a le Joueur1
    func Give_Joueur1()->Joueur

    //Give_Joueur1: Plateau -> Joueur
    //retourne le joueur 2 du plateau
    //Post: On a le Joueur2
    func Give_Joueur2()->Joueur

    //Set_Joueur1: Plateau -> Joueur
    //modifie le joueur1 du plateau
    //Post: Le joueur1 du plateau est modifie
    mutating func Set_Joueur1(joueur:Joueur)->Self

    //Set_Joueur2: Plateau -> Joueur
    //modifie le joueur2 du plateau
    //Post: Le joueur2 du plateau est modifie
    mutating func Set_Joueur2(joueur:Joueur)->Self

    //Est_Case_Vide: Plateau*Position -> Bool
    //Verifie si une position est vide ou pas
    //Pre: Position est dans le plateau (ne depasse pas la hauteur ou la largeur)
    //Post: Retourne Vrai si il n'y a pas de piece a cette position, faux si la case est occupee. Si jamais la position entree en parametre n'est pas sur le plateau on retourne une erreur.
    func Est_Case_Vide(pos:Position)->Bool

    //Est_Deplacement_Possible: Plateau*Piece*Position
    //Verifie si un piece peut se deplacer a un position donnee
    //Pre:La position est sur la plateau
    //Pre:La position n'est pas occupe par une piece du meme joueur
    //Pre:Le deplacement est permi par le type de la piece
    //Post:Si le deplacement est permis on retourne vrai sinon on retourne faux
    func Est_Deplacement_Possible(piece:Piece,pos:Position)->Bool

    //Piece_Position: Plateau*Position->(Piece|Vide)
    //Ressort un piece a partir d'une position du plateau
    //Pre:Il y a une piece sur cette position
    //Pre:La position est dans le plateau
    //Post: Retourne la piece. Si jamais la position n'est pas sur la plateau ou si il n'y a pas de piece a cette position on retourne Vide.
    func Piece_Position(pos:Position)->Piece?

    //Fin: Plateau -> (Joueur | Vide)
    //Regarde si la partie est finie.
    //Post: Il faut que l'un des deux joueurs n'ai plus son roi ou que le roi d'un des deux joueurs soit sur la derniere case pour retourner un joueur gagnant. Sinon on retourne Vide
    func Fin()->Joueur?
}

public protocol IteratorPositionProtocol: IteratorProtocol{
    associatedtype Position:PositionProtocol
    func next()->Position?
}
