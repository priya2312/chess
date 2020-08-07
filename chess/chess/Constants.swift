//
//  Constants.swift
//  chessboard
//
//  Created by Priyadharshini Tamilarasan on 05/08/20.
//  Copyright © 2020 Priyadharshini Tamilarasan. All rights reserved.
//

import Foundation
import UIKit

struct K {
    
    struct Board {
        static let r = "r"
        static let n = "n"
        static let b = "b"
        static let q = "q"
        static let k = "k"
        static let p = "p"
        static let R = "R"
        static let N = "N"
        static let B = "B"
        static let Q = "Q"
        static let K = "K"
        static let P = "P"
        
        static let boardPieceImages: [String: UIImage] = [
            "r": #imageLiteral(resourceName: "BlackRook"),
            "R": #imageLiteral(resourceName: "WhiteRook"),
            "n": #imageLiteral(resourceName: "BlackKnight"),
            "N": #imageLiteral(resourceName: "WhiteKnight"),
            "b": #imageLiteral(resourceName: "BlackBishop"),
            "B": #imageLiteral(resourceName: "WhiteBishop"),
            "q": #imageLiteral(resourceName: "BlackQueen"),
            "Q": #imageLiteral(resourceName: "WhiteQueen"),
            "k": #imageLiteral(resourceName: "BlackKing"),
            "K": #imageLiteral(resourceName: "WhiteKing"),
            "p": #imageLiteral(resourceName: "BlackPawn"),
            "P": #imageLiteral(resourceName: "WhitePawn"),
        ]
    }
    
    struct Colors {
        static let lightSquare = UIColor(named: "LightSquare")
        static let darkSquare = UIColor(named: "DarkSquare")
        static let selectedSquare = UIColor(named: "SelectedSquare")
    }
    
    struct Cells {
        static let boardCell = "BoardCell"
    }
    
}
