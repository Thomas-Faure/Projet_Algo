//Un plateau est une collection de positions +2 joueurs
public class PlateauClass : PlateauProtocol{
    public typealias Joueur = JoueurClass
    public typealias Piece = PieceClass
    public typealias Position = PositionClass
    public typealias IteratorPositionProtocol = ItPosition

    var l : Int
    var h : Int
    var joueur1 : Joueur?
    var joueur2 : Joueur?
    //init: Int*Int->Plateau
    //Initialisation d'un plateau de longeur de longeur l et de hauteur h et de deux joueurs
    //Pre: l>0 & h>0
    //Sinon la creation du plateau echoue

    public required init?(l:Int,h:Int){
      self.l = l
      self.h = h
      self.joueur1 = nil
      self.joueur2 = nil
    }

    //Give_Joueur1: Plateau -> Joueur
    //retourne le joueur 1 du plateau
    //Post: On a le Joueur1
    public func Give_Joueur1()->Joueur?{
      return self.joueur1
    }

    //Give_Joueur1: Plateau -> Joueur
    //retourne le joueur 2 du plateau
    //Post: On a le Joueur2
    public func Give_Joueur2()->Joueur?{
      return self.joueur2
    }

    //Set_Joueur1: Plateau -> Joueur
    //modifie le joueur1 du plateau
    //Post: Le joueur1 du plateau est modifie
    public func Set_Joueur1(joueur:Joueur)->Self{
      self.joueur1 = joueur
      return self
    }

    //Set_Joueur2: Plateau -> Joueur
    //modifie le joueur2 du plateau
    //Post: Le joueur2 du plateau est modifie
    public func Set_Joueur2(joueur:Joueur)->Self{
      self.joueur2 = joueur
      return self
    }

    //Est_Case_Vide: Plateau*Position -> Bool
    //Verifie si une position est vide ou pas
    //Pre: Position est dans le plateau (ne depasse pas la hauteur ou la largeur)
    //Post: Retourne Vrai si il n'y a pas de piece a cette position, faux si la case est occupee. Si jamais la position entree en parametre n'est pas sur le plateau on retourne une erreur.
    public func Est_Case_Vide(pos:Position)->Bool{
      return false

    }

    //Est_Deplacement_Possible: Plateau*Piece*Position
    //Verifie si un piece peut se deplacer a un position donnee
    //Pre:La position est sur la plateau
    //Pre:La position n'est pas occupe par une piece du meme joueur
    //Pre:Le deplacement est permi par le type de la piece
    //Post:Si le deplacement est permis on retourne vrai sinon on retourne faux
    public func Est_Deplacement_Possible(piece:Piece,pos:Position)->Bool{
      return false
    }

    //Piece_Position: Plateau*Position->(Piece|Vide)
    //Ressort un piece a partir d'une position du plateau
    //Pre:Il y a une piece sur cette position
    //Pre:La position est dans le plateau
    //Post: Retourne la piece. Si jamais la position n'est pas sur la plateau ou si il n'y a pas de piece a cette position on retourne Vide.
    public func Piece_Position(pos:Position)->Piece?{
      return nil
    }

    //Fin: Plateau -> (Joueur | Vide)
    //Regarde si la partie est finie.
    //Post: Il faut que l'un des deux joueurs n'ai plus son roi ou que le roi d'un des deux joueurs soit sur la derniere case pour retourner un joueur gagnant. Sinon on retourne Vide
    public func Fin()->Joueur?{
      return nil
    }
    public func makeIterator()->ItPosition{
      return ItPosition(self)
    }
}

public struct ItPosition: IteratorProtocol{
  public typealias Position = PositionClass
  private let plateau : PlateauClass
     private var courant : Int = 0
     private let keys : [Position]

     fileprivate init(_ a: PlateauClass){
        self.plateau = a
        let test = Position(x:0,y:0)
        self.keys = [test,test]
     }
     public mutating func next() -> Position?{
       let test = Position(x:0,y:0)
       return test

  }
}