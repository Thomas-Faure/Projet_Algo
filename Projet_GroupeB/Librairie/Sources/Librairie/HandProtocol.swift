import Foundation
//Hand est une collection de pieces, elle correspond aux pieces que nous avons sur le plateau
public protocol HandProtocol:Sequence{

    associatedtype Position: PositionProtocol
    associatedtype TypePiece: TypePieceProtocol
    associatedtype Piece: PieceProtocol
    associatedtype IteratorPieceProtocol : IteratorProtocol
        where IteratorPieceProtocol.Element == Piece

    // init : -> Hand
    // Creation d'une main, intialise a Vide
    init()

    // Initialiser_Debut : Hand -> Hand
    // Initialisation de la main avec les 4 pieces du debut
    //Post: La main est maintenant composee des 4 pieces du debut et elles sont a leur position initiale
    func Initialiser_Debut()->Self

    //Est_Dans_Main: Hand*TypePiece -> Bool
    //Regarde si il y a un type de piece dans la main
    //Pre: Ce type existe (kodama, kitsune ...)
    //Post: Si il y a cette piece dans la main on retourne Vrai sinon on retourne Faux
    func Est_Dans_Main(type:TypePiece)->Bool

    //Avoir_Piece: Hand*Position -> Bool
    //Verifie si a un position donnee il y a une piece de la main qui occupe cette position
    //Pre: La position est sur le plateau
    //Post: Retourne vrai si il possede une piece faux sinon
    func Avoir_Piece(pos:Position)->Bool

    //Get_Piece: Hand*Position -> (Piece | Vide)
    //Verifie si a une position donnee il y a une piece de la main qui occupe cette position et si c'est le cas on ressort la piece ou Vide
    //Pre: Il faut que la position soit sur le plateau
    //Post: Retourne vrai si il possede une piece faux sinon
    func Get_Piece(pos:Position) -> Piece?

    //Ajouter_Piece: Hand*Piece*Position -> Hand
    //Ajoute une piece de la main
    //Pre: La position ne doit pas être occupée par une autre piece lorsque on l’ajoute
    //Pre: La piece n’a pas encore de position
    //Pre: La position doit etre sur le plateau
    //Post: La piece a été ajouté dans la main du joueur a la position donnee. Si jamais il y a deja une piece sur cette position ou si la piece a deja une position ou si elle n’est pas sur le plateau on ne fait rien
    @discardableResult
    mutating func Ajouter_Piece(piece:Piece,pos:Position)->Self

    //Supprimer_Piece: Hand*Piece -> Hand
    //Supprime une piece de la main
    //Pre: La piece doit faire partie de la main du joueur
    //Post: La piece a été supprimée de la main du joueur. Si jamais elle n’en fait pas partie on ne fait rien
    @discardableResult
    mutating func Supprimer_Piece(piece:Piece)->Self

    //Deplacer_Piece: Hand*Piece*Position -> Hand
    //Deplace une piece de la main. Elle va d'abord verifier que l'on a la piece, que le deplacement est possible par
    //rapport aux caracteristiques de la piece puis va deplacer la piece.
    //Pre : La piece doit faire partie de la main du joueur, la position doit être une position valable
    //Post : La piece a ete deplacee.
    @discardableResult
    mutating func Deplacer_Piece(piece : Piece,position : Position)->Self


    // makeIteratorPiece : Hand -> IteratorPiece
    // cree un iterateur sur la collection dans l'odre (?Comment on les tries)
    func makeIteratorPiece()->IteratorPieceProtocol

}

public protocol IteratorPieceProtocol: IteratorProtocol{
    associatedtype Piece:PieceProtocol
    func next()->Piece?
}
