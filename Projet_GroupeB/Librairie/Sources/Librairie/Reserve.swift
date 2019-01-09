public class ReserveClass : ReserveProtocol{

  public typealias Position = PositionClass


  public typealias TypePiece = TypePieceClass
  public typealias Piece = PieceClass
  public typealias IteratorPieceProtocol = ItPiece

  private var listePiece : [Piece]?

  // init : -> Vide
  // Creation d'une Reserve, intialisee Vide
  public required init(){ //fait
    listePiece = nil
  }


  @discardableResult
  public func retournerListe()->[Piece]?{
    return self.listePiece
  }

  // Est_Vide: Reserve -> Bool
  // Regarde si la reserve est Vide
  // Post: Si la reserve est vide on retourne Vrai sinon on retourne Faux
  public func Est_Vide()->Bool{ //fait
    if let liste = listePiece{
      if liste.count>=1{
        return false
      }else{
        return true
      }
    }

    return self.listePiece==nil
  }


  // Est_Dans_Reserve: Reserve*Piece -> Bool
  // Regarde si il y a une piece dans la reserve
  // Post: Si la piece est dans la reserve on retourne vrai sinon on retourne faux.
  public func Est_Dans_Reserve(piece:Piece)->Bool{ //fait
    var retour = false
    if let liste = self.listePiece{
      for p in liste{
        if(p === piece){
          retour = true
        }
      }
      return retour
    }else{
      return false
    }
  }

  // Get_Piece: Hand*Position -> (Piece | Vide)
  // Verifie si a un type donne il y a une piece de la reserve qui appartient a ce type et si c'est le cas on ressort la piece ou Vide
  // En cas de plusieurs occurences, on ressortira la premiere
  // Pre: Il faut que ce soit un type existant
  // Post: Retourne vrai si il possede une piece faux sinon
  public func Get_Piece(nom : TypePiece)->Piece?{
    var piece : Piece?
    piece = nil
    var trouver=false
    if let liste = self.listePiece{
      for p in liste{
        if let typ = p.Give_Type(){
          if(typ.Give_Nom() == nom.Give_Nom() && !trouver){
            piece = p
            trouver=true
          }
        }
      }
      return piece
    }
    return piece
  }

  @discardableResult
  public func Ajouter_Piece(piece :Piece)->Self{
    if(piece.Give_Position() != nil){
      var nouvellePiece = piece
      nouvellePiece = nouvellePiece.Set_Position(newPos: nil)
      if var liste = self.listePiece{
        liste.append(nouvellePiece)
        self.listePiece=liste
      } else {
        self.listePiece=[nouvellePiece]
      }
    }
    return self
  }

  // Supprimer_Piece: Reserve*Piece -> Reserve
  // Supprime une Piece de la Reserve
  // Pre: La Piece doit faire partie de la Reserve du joueur
  // Pre: La piece n’a pas de position (est de type TypePiece*Vide)
  // Post: La Piece a ete supprimee de la reserve du joueur. Si jamais elle n’en fait pas partie ou si elle n’est pas de type TypePiece*Vide alors on ne fait rien
  @discardableResult
  public func Supprimer_Piece(piece:Piece)->Self{
    if(!self.Est_Vide()){
      var count = 0
      if var liste = self.listePiece{
        if(piece.Give_Position() != nil){
          for ele in liste{
              if ele === piece{
                liste.remove(at: count)
                self.listePiece=liste
              }
              count = count + 1
          }
        }
      }
    }
    return self
  }

  // makeIteratorTypePiece : Reserve -> IteratorPiece
  // cree un iterateur sur la collection
  public func makeIterator()->ItPiece{
    return ItPiece(self)
  }
}

public struct ItPiece : IteratorProtocol{
  public typealias Piece = PieceClass
  private let reserve : ReserveClass
  private var courant : Int = 0
  private let keys : [Piece]?

  fileprivate init(_ a: ReserveClass){
    self.reserve = a
    self.keys = a.retournerListe()
  }

  public mutating func next() -> Piece?{
    if var ken = keys{
    if(courant == ken.count){return nil}
      let retour = ken[courant]
      courant = courant + 1
      return retour
    }
    return nil
  }

}
