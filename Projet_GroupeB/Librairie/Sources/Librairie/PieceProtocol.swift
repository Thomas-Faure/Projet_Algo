// Une piece est definie par un TypePiece, une position et une Orientation
public protocol PieceProtocol{

    associatedtype TypePieceA: TypePieceProtocol
    associatedtype PositionA: PositionProtocol
    associatedtype OrientationA: OrientationProtocol

    //init: -> Piece
    //creation d'une piece definie par son type, sa position et son orientation. On initialise cette piece a Vide.
    init()

    //Set_Nom: Piece*TypePiece -> Piece
    //Modifie le nom (Type) d'une piece
    //Pre: type est un Type existant
    //Post: On change le type de la piece, si le type n'existe pas on ne fait rien
    @discardableResult
    mutating func Set_Type(newType : TypePieceA?)->Self

    //Set_Position: Piece*(Position|Vide) -> Piece
    //Modifie la position d'une piece
    //Pre: newPOS doit être sur le plateau
    //Post: Si la position est sur le plateau on modifie sa position sinon on ne fait rien
    @discardableResult
    mutating func Set_Position(newPos : PositionA?)->Self

    //Set_Orientation: Piece*(Orientation|Vide) -> Piece
    //Modifie l'orientation d'une piece
    //Pre: newOrient doit etre une orientation existante (N/S)
    //Post: L'orientation est changee. Si newOrient n'existe pas on ne fait rien
    @discardableResult
    mutating func Set_Orientation(newOrient : OrientationA?)->Self

    //Give_Nom: Piece -> TypePiece
    //Retourne le nom (Type) d'une piece
    //Post: On a le TypePiece
    func Give_Type()->TypePieceA?

    //Give_Position: Piece -> (Position|Vide)
    //Retourne la position d'une piece
    //Pre: La piece doit etre sur le plateau
    //Post: Si la piece est sur le plateau on retourne sa position sinon on retourne Vide(Si la piece est dans la reserve par exemple)
    func Give_Position()->PositionA?

    //Give_Orientation: Piece -> Orientation
    //Retourne l'orientation d'une piece
    //Post: On a l'Orientation de la piece
    func Give_Orientation()->OrientationA?

    //Piece_Au_Fond: Piece -> Bool
    //Regarde si la piece est au fond
    //Post: Retourne vrai si la piece est au fond, faux sinon
    func Piece_Au_Fond()->Bool

    //Est_Kodama: Piece -> Bool
    //Regarde si la piece est un Kodama
    //Post: Retourne vrai si la piece est un Kodama faux sinon
    func Est_Kodama()->Bool

    //Est_Kodama_Samurai: Piece -> Bool
    //Regarde si la piece est un Kodama samurai
    //Post: Retourne vrai si la piece est un Kodama samurai faux sinon
    func Est_Kodama_Samurai()->Bool

    //Est_Roi: Piece -> Bool
    //Regarde si la piece est un Roi
    //Post: Retourne vrai si la piece est un Koropokkuru faux sinon
    func Est_Roi()->Bool

    //Transformer_Kodama_Samurai: Piece -> Piece
    //On transforme le kodama en kodama samurai
    //Pre: La piece doit etre un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
    //Post: On transforme le kodama en kodama samourai Si les preconditions ne sont pas remplies on ne fait rien.
    @discardableResult
    mutating func Transformer_Kodama_Samurai()->Self

    //Transformer_Kodama: Piece -> Piece
    //On transforme le kodama samurai・en kodama
    //Pre: La piece doit etre un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
    //Post: On transforme le kodama samourai en kodama. Si les preconditions ne sont pas remplies on ne fait rien.
    @discardableResult
    mutating func Transformer_Kodama()->Self

    //Deplacer_Piece: Piece*Position -> Piece
    //On deplace une piece jusqu'a une position finale.
    //Pre: La Position finale correspond ・une position sur laquelle la piece peut se deplacer
    //Post: La piece est deplacee. Si la piece ne peut pas se deplacer sur la position finale alors rien n'est fait
    @discardableResult
    mutating func Deplacer_Piece(PosFin : PositionA)->Self

}
