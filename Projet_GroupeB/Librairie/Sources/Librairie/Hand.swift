
public class HandClass : HandProtocol{


    public typealias Position = PositionClass
    public typealias TypePiece = TypePieceClass
    public typealias Piece = PieceClass
    public typealias IteratorPieceProtocol = ItPiece2


    public required init(){

    }

    // Initialiser_Debut : Hand -> Hand
    // Initialisation de la main avec les 4 pieces du debut
    //Post: La main est maintenant composee des 4 pieces du debut et elles sont a leur position initiale
    public func Initialiser_Debut()->Self{
      return self
    }

    //Est_Dans_Main: Hand*TypePiece -> Bool
    //Regarde si il y a un type de piece dans la main
    //Pre: Ce type existe (kodama, kitsune ...)
    //Post: Si il y a cette piece dans la main on retourne Vrai sinon on retourne Faux
    public func Est_Dans_Main(type:TypePiece)->Bool{
      return false
    }

    //Avoir_Piece: Hand*Position -> Bool
    //Verifie si a un position donnee il y a une piece de la main qui occupe cette position
    //Pre: La position est sur le plateau
    //Post: Retourne vrai si il possede une piece faux sinon
    public func Avoir_Piece(pos:Position)->Bool{
      return false
    }

    //Get_Piece: Hand*Position -> (Piece | Vide)
    //Verifie si a une position donnee il y a une piece de la main qui occupe cette position et si c'est le cas on ressort la piece ou Vide
    //Pre: Il faut que la position soit sur le plateau
    //Post: Retourne vrai si il possede une piece faux sinon
    public func Get_Piece(pos:Position) -> Piece?{
      return nil
    }

    //Ajouter_Piece: Hand*Piece*Position -> Hand
    //Ajoute une piece de la main
    //Pre: La position ne doit pas être occupée par une autre piece lorsque on l’ajoute
    //Pre: La piece n’a pas encore de position
    //Pre: La position doit etre sur le plateau
    //Post: La piece a été ajouté dans la main du joueur a la position donnee. Si jamais il y a deja une piece sur cette position ou si la piece a deja une position ou si elle n’est pas sur le plateau on ne fait rien
    public func Ajouter_Piece(piece:Piece,pos:Position)->Self{
      return self
    }

    //Supprimer_Piece: Hand*Piece -> Hand
    //Supprime une piece de la main
    //Pre: La piece doit faire partie de la main du joueur
    //Post: La piece a été supprimée de la main du joueur. Si jamais elle n’en fait pas partie on ne fait rien
    public func Supprimer_Piece(piece:Piece)->Self{
      return self
    }

    //Deplacer_Piece: Hand*Piece*Position -> Hand
    //Deplace une piece de la main. Elle va d'abord verifier que l'on a la piece, que le deplacement est possible par
    //rapport aux caracteristiques de la piece puis va deplacer la piece.
    //Pre : La piece doit faire partie de la main du joueur, la position doit être une position valable
    //Post : La piece a ete deplacee.
    public func Deplacer_Piece(piece : Piece,position : Position)->Self{
      return self
    }


    // makeIteratorPiece : Hand -> IteratorPiece
    // cree un iterateur sur la collection dans l'odre (?Comment on les tries)
    public func makeIterator()->ItPiece2{
      return ItPiece2(self)

    }

}

public struct ItPiece2 : IteratorProtocol{
  public typealias Piece = PieceClass
  private let hand : HandClass
     private var courant : Int = 0
     private let keys : [Piece]

     fileprivate init(_ a: HandClass){
        self.hand = a
        let test = Piece()
        self.keys = [test,test]
     }
     public mutating func next() -> Piece?{
       let test = Piece()
       return test

  }

}
