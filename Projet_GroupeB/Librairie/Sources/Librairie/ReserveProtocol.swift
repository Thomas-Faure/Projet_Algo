import Foundation
//Reserve est une collection de Piece ce sont des pieces qui n'ont pas encore de position car elles ne sont pas sur le plateau
public protocol ReserveProtocol: Sequence{
    associatedtype TypePiece: TypePieceProtocol
    associatedtype Piece: PieceProtocol
    associatedtype IteratorPieceProtocol : IteratorProtocol
        where IteratorPieceProtocol.Element == Piece

    // init : -> Vide
    // Creation d'une Reserve, intialisee Vide
    init?()


    //Est_Vide: Reserve -> Bool
    //Regarde si la reserve est Vide
    //Post: Si la reserve est vide on retourne Vrai sinon on retourne Faux
    func Est_Vide()->Bool

    //Est_Dans_Reserve: Reserve*Piece -> Bool
    //Regarde si il y a une piece dans la reserve
    //Post: Si la piece est dans la reserve on retourne vrai sinon on retourne faux.
    func Est_Dans_Reserve(piece:Piece)->Bool


    //Get_Piece: Hand*Position -> (Piece | Vide)
    //Verifie si a un type donne il y a une piece de la reserve qui appartient a ce type et si c'est le cas on ressort la piece ou Vide
    //En cas de plusieurs occurences, on ressortira la premiere
    //Pre: Il faut que ce soit un type existant
    //Post: Retourne vrai si il possede une piece faux sinon
    func Get_Piece(nom:TypePiece) -> Piece?


    //Ajouter_Piece: Reserve*Piece -> Reserve
    //Ajoute une piece de la reserve et remplace sa position par Vide
    //Pre: La piece a une position
    //Post: La piece a été ajouté dans la reserve du joueur et on a remplace sa position par vide, elle est maintenant de type TypePiece*Vide. Si jamais la piece n’a pas de postion alors on ne fait rien
    @discardableResult
    mutating func Ajouter_Piece(piece:Piece)->Self

    //Supprimer_Piece: Reserve*Piece -> Reserve
    //Supprime une Piece de la Reserve
    //Pre: La Piece doit faire partie de la Reserve du joueur
    //Pre: La piece n’a pas de position (est de type TypePiece*Vide)
    //Post: La Piece a ete supprimee de la reserve du joueur. Si jamais elle n’en fait pas partie ou si elle n’est pas de type TypePiece*Vide alors on ne fait rien
    @discardableResult
    mutating func Supprimer_Piece(piece:Piece)->Self

    // makeIteratorTypePiece : Reserve -> IteratorPiece
    // cree un iterateur sur la collection
    func makeIterator()->IteratorPieceProtocol

}
