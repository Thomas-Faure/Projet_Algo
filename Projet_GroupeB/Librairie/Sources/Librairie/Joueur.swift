enum MyErrorJoueur: Error {
    case runtimeError(String)
}
public class JoueurClass : JoueurProtocol {


    public typealias Hand = HandClass
    public typealias Reserve = ReserveClass

    public var reserve : Reserve?
    public var hand : Hand?
    public var nom : String = "joueur"

    // init:  String -> Joueur
    // création d'un joueur, un joueur est définie par un nom, une main, une reserve et une orientation. A l'initialisation sa reverve est vide et sa main est composé de 4 pieces.
    // a l'init son nom n'est pas vide, il s'appellera joueur en valeur par defaut


    public required init(){}
    //ajout du groupe A , connaitre le joueur 1 ou le joueur 2
    public required init(nom:String,joueur: Int){
      self.reserve = Reserve()
      let hand = Hand()
      hand.Initialiser_Debut(joueur: joueur)
      self.hand=hand
      self.nom = nom
    }

    // Give_Hand: Joueur -> (Hand|Vide)
    // retourne la main qu'un joueur possède (les pieces qu'il a sur la plateau)
    //Post : On a la main du joueur
    public func Give_Hand()->Hand?{
      return self.hand
    }

    // Give_reserve: Joueur -> (Reserve|Vide)
    // retourne la reserve d'un joueur (les pieces qu'il a capturer)
    //Post : On a la reserve du joueur
    public func Give_Reserve()->Reserve?{
      return self.reserve
    }

    // Give_Name: Joueur -> String
    // retourne le nom d'un joueur
    //Post : On a le nom du joueur
    public func Give_Name()->String{
      return self.nom
    }

    // Set_Name: Joueur*String -> Joueur
    // Change le nom d'un joueur
    //Pre: Le nom ne doit pas etre vide.
    //Post: On change le nom du joueur. Si le nom est vide on ne fait rien
    @discardableResult
    public func Set_Name(nom:String)->Self{
      if(nom.count > 0){
        self.nom = nom
      }else{
      //  throw MyErrorJoueur.runtimeError("le nom est vide")
      }
      return self
    }

    // Set_Hand: Joueur*Hand -> Joueur
    // Change la main d'un joueur
    //Post: La main du joueur est changee
    @discardableResult
    public func Set_Hand(newHand:Hand)->Self{
      self.hand = newHand
      return self
    }

    // Set_Reserve: Joueur*(Reserve|Vide) -> Joueur
    // Change la reserve d'un joueur
    //Post: La reserve du joueur est changee
    @discardableResult
    public func Set_Reserve(newReserve:Reserve?)->Self{
      self.reserve = newReserve
      return self
    }
}
