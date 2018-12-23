enum MyErrorHand: Error {
    case runtimeError(String)
}
public class HandClass : HandProtocol{


    public typealias Position = PositionClass
    public typealias TypePiece = TypePieceClass
    public typealias Piece = PieceClass
    public typealias IteratorPieceProtocol = ItPiece2
    public var liste : [Piece]?

    public required init(){
      self.liste = nil
    }

    // Initialiser_Debut : Hand -> Hand
    // Initialisation de la main avec les 4 pieces du debut
    //Post: La main est maintenant composee des 4 pieces du debut et elles sont a leur position initiale

    //modification par le groupe A, ajout d'un paramètre indiquant le joueur cible pour pouvoir bien placer les cartes.
    @discardableResult
    public func Initialiser_Debut(joueur : Int)->Self{
      if(joueur == 1){
        var position = Position(x: 1, y: 0)
        let typePiece = TypePiece()
        let orientation = OrientationClass()
        orientation.Change_Orientation(orientfin : Orientation.N)
        typePiece.Set_Nom(nom: "koropokkuru")
        let koropokkuru = Piece()
        koropokkuru.Set_Position(newPos : position)
        koropokkuru.Set_Type(newType : typePiece)
        koropokkuru.Set_Orientation(newOrient : orientation)

        position = Position(x: 0, y: 0)
        typePiece.Set_Nom(nom: "kitsune")
        let kitsune = Piece()
        kitsune.Set_Position(newPos : position)
        kitsune.Set_Type(newType : typePiece)
        kitsune.Set_Orientation(newOrient : orientation)

        position = Position(x: 2, y: 0)
        typePiece.Set_Nom(nom: "tanuki")
        let tanuki = Piece()
        tanuki.Set_Position(newPos : position)
        tanuki.Set_Type(newType : typePiece)
        tanuki.Set_Orientation(newOrient : orientation)

        position = Position(x: 1, y: 1)
        typePiece.Set_Nom(nom: "kodama")
        let kodama = Piece()
        kodama.set_Kodama()
        kodama.Set_Position(newPos : position)
        kodama.Set_Type(newType : typePiece)
        kodama.Set_Orientation(newOrient : orientation)
        self.liste = [koropokkuru,kitsune,tanuki,kodama]
      }else{
        var position = Position(x: 1, y: 3)
        let typePiece = TypePiece()
        let orientation = OrientationClass()
        orientation.Change_Orientation(orientfin : Orientation.S)
        typePiece.Set_Nom(nom: "koropokkuru")
        let koropokkuru = Piece()
        koropokkuru.Set_Position(newPos : position)
        koropokkuru.Set_Type(newType : typePiece)
        koropokkuru.Set_Orientation(newOrient : orientation)

        position = Position(x: 2, y: 3)
        typePiece.Set_Nom(nom: "kitsune")
        let kitsune = Piece()
        kitsune.Set_Position(newPos : position)
        kitsune.Set_Type(newType : typePiece)
        kitsune.Set_Orientation(newOrient : orientation)

        position = Position(x: 0, y: 3)
        typePiece.Set_Nom(nom: "tanuki")
        let tanuki = Piece()
        tanuki.Set_Position(newPos : position)
        tanuki.Set_Type(newType : typePiece)
        tanuki.Set_Orientation(newOrient : orientation)

        position = Position(x: 1, y: 2)
        typePiece.Set_Nom(nom: "kodama")
        let kodama = Piece()
        kodama.set_Kodama()
        kodama.Set_Position(newPos : position)
        kodama.Set_Type(newType : typePiece)
        kodama.Set_Orientation(newOrient : orientation)
        self.liste = [koropokkuru,kitsune,tanuki,kodama]

      }

      return self
    }

    //Est_Dans_Main: Hand*TypePiece -> Bool
    //Regarde si il y a un type de piece dans la main
    //Pre: Ce type existe (kodama, kitsune ...)
    //Post: Si il y a cette piece dans la main on retourne Vrai sinon on retourne Faux
    public func Est_Dans_Main(type:TypePiece)->Bool{
      var present = false
      if let liste = self.liste{
        for element in liste{
            if(element.Give_Type() === type){
              present = true
            }
        }
      }
      return present
    }

    //Avoir_Piece: Hand*Position -> Bool
    //Verifie si a un position donnee il y a une piece de la main qui occupe cette position
    //Pre: La position est sur le plateau
    //Post: Retourne vrai si il possede une piece faux sinon
    public func Avoir_Piece(pos:Position)->Bool{
      var avoirPiece = false
      if let liste = self.liste{
        for element in liste{
          if let givePos = element.Give_Position(){

            if(givePos.position.0 == pos.position.0 && givePos.position.1 == pos.position.1){
              avoirPiece = true
            }
          }

        }
      }
      return avoirPiece
    }

    //Get_Piece: Hand*Position -> (Piece | Vide)
    //Verifie si a une position donnee il y a une piece de la main qui occupe cette position et si c'est le cas on ressort la piece ou Vide
    //Pre: Il faut que la position soit sur le plateau
    //Post: Retourne vrai si il possede une piece faux sinon
    public func Get_Piece(pos:Position) -> Piece?{
      var piece : Piece?
      print("chercher")
      if(self.Avoir_Piece(pos: pos)){
        if let liste = self.liste{
          for element in liste{
            if let givePos = element.Give_Position(){
              if(givePos.position.0 == pos.position.0 && givePos.position.1 == pos.position.1){
                print("find")
                piece = element
              }else{

              }
            }

          }
        }
      }else{
        print("aucune piece")
        piece = nil
      }
      return piece

    }

    //Ajouter_Piece: Hand*Piece*Position -> Hand
    //Ajoute une piece de la main
    //Pre: La position ne doit pas être occupée par une autre piece lorsque on l’ajoute
    //Pre: La piece n’a pas encore de position
    //Pre: La position doit etre sur le plateau
    //Post: La piece a été ajouté dans la main du joueur a la position donnee. Si jamais il y a deja une piece sur cette position ou si la piece a deja une position ou si elle n’est pas sur le plateau on ne fait rien
    public func Ajouter_Piece(piece:Piece,pos:Position)throws->Self{
      if(piece.Give_Position() == nil){
          if(!self.Avoir_Piece(pos:pos)){
            if(pos.position.0 >= 0 && pos.position.0 <= 3 && pos.position.1 >= 0 && pos.position.1 <= 3){
                let nouvellePiece = piece
                piece.Set_Position(newPos : pos)
                if var liste = self.liste{
                  liste.append(nouvellePiece)
                  self.liste = liste
                }
            }else{
              throw MyErrorHand.runtimeError("depasse le plateau")
            }

          }else{
            throw MyErrorHand.runtimeError("la piece a deja une position")
          }

      }else{
          throw MyErrorHand.runtimeError("la piece a deja une position")
      }
      return self
    }

    //Supprimer_Piece: Hand*Piece -> Hand
    //Supprime une piece de la main
    //Pre: La piece doit faire partie de la main du joueur
    //Post: La piece a été supprimée de la main du joueur. Si jamais elle n’en fait pas partie on ne fait rien
    public func Supprimer_Piece(piece:Piece)throws->Self{
      var supprimer=false
      var count = 0
      if var liste = self.liste{
        if(piece.Give_Position() != nil){
          for ele in liste{
              if ele === piece{
                supprimer = true
                liste.remove(at: count)
                self.liste=liste
              }
              count = count + 1
          }
          if(supprimer==false){
            throw MyErrorHand.runtimeError("la piece n'est pas dans la main")
          }
        }
      }
      return self
    }

    //Deplacer_Piece: Hand*Piece*Position -> Hand
    //Deplace une piece de la main. Elle va d'abord verifier que l'on a la piece, que le deplacement est possible par
    //rapport aux caracteristiques de la piece puis va deplacer la piece.
    //Pre : La piece doit faire partie de la main du joueur, la position doit être une position valable
    //Post : La piece a ete deplacee.
    public func Deplacer_Piece(piece : Piece,position : Position)throws->Self{
      //verification possession de la piece2
      var possede = false
      if let liste = self.liste{
        for element in liste{
            if(element === piece){
              possede = true
            }
        }
        //on possède la carte donc on continue, on va maintenant regardé si le déplacement est possible
        if(possede){
          piece.Deplacer_Piece(PosFin: position)
        }else{
          throw MyErrorHand.runtimeError("la piece n'est pas dans la main")
        }
      }

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
     private let keys : [Piece]?

     fileprivate init(_ a: HandClass){
        self.hand = a

        self.keys = a.liste
     }
     public mutating func next() -> Piece?{
       if let liste = keys{
         if(courant == liste.count){return nil}
         let retour = liste[courant]
         courant = courant + 1
         return retour

       }else{
         return nil
       }


  }

}
