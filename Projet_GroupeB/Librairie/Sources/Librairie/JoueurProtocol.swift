import Foundation
// Un joueur est definie par un nom, sa main et sa reserve
public protocol JoueurProtocol {

    associatedtype Hand: HandProtocol
    associatedtype Reserve: ReserveProtocol

    // init:  String -> Joueur
    // création d'un joueur, un joueur est définie par un nom, une main, une reserve et une orientation. A l'initialisation sa reverve est vide et sa main est composé de 4 pieces.
    // a l'init son nom n'est pas vide, il s'appellera joueur en valeur par defaut
    init(nom:String)

    // Give_Hand: Joueur -> (Hand|Vide)
    // retourne la main qu'un joueur possède (les pieces qu'il a sur la plateau)
    //Post : On a la main du joueur
    func Give_Hand()->Hand?

    // Give_reserve: Joueur -> (Reserve|Vide)
    // retourne la reserve d'un joueur (les pieces qu'il a capturer)
    //Post : On a la reserve du joueur
    func Give_Reserve()->Reserve?

    // Give_Name: Joueur -> String
    // retourne le nom d'un joueur
    //Post : On a le nom du joueur
    func Give_Name()->String

    // Set_Name: Joueur*String -> Joueur
    // Change le nom d'un joueur
    //Pre: Le nom ne doit pas etre vide.
    //Post: On change le nom du joueur. Si le nom est vide on ne fait rien
    @discardableResult
    mutating func Set_Name(nom:String)->Self

    // Set_Hand: Joueur*Hand -> Joueur
    // Change la main d'un joueur
    //Post: La main du joueur est changee
    @discardableResult
    mutating func Set_Hand(newHand:Hand)->Self

    // Set_Reserve: Joueur*(Reserve|Vide) -> Joueur
    // Change la reserve d'un joueur
    //Post: La reserve du joueur est changee
    @discardableResult
    mutating func Set_Reserve(newReserve:Reserve?)->Self
}
