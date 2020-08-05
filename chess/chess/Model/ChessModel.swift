//
//  ChessModel.swift
//  chessboard
//
//  Created by Priyadharshini Tamilarasan on 05/08/20.
//  Copyright © 2020 Priyadharshini Tamilarasan. All rights reserved.
//

import Foundation
import UIKit

class ChessModel {
    
    static var board = [
        [K.Board.r, K.Board.n, K.Board.b, K.Board.q, K.Board.k, K.Board.b, K.Board.n, K.Board.r],
        [K.Board.p, K.Board.p, K.Board.p, K.Board.p, K.Board.p, K.Board.p, K.Board.p, K.Board.p],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        [K.Board.P, K.Board.P, K.Board.P, K.Board.P, K.Board.P, K.Board.P, K.Board.P, K.Board.P],
        [K.Board.R, K.Board.N, K.Board.B, K.Board.Q, K.Board.K, K.Board.B, K.Board.N, K.Board.R]
    ]
    
    // Return an image
    static func getPieceImage(_ piece: String) -> UIImage{
        return K.Board.boardPieceImages[piece] ?? UIImage()
    }
    
    // Convert FEN to 2D array
//    rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR
    static func fenToBoard(_ fenString: String){
        
        var fen = fenString
        
        fen = fen.replacingOccurrences(of: "1", with: " ")
        fen = fen.replacingOccurrences(of: "2", with: "  ")
        fen = fen.replacingOccurrences(of: "3", with: "   ")
        fen = fen.replacingOccurrences(of: "4", with: "    ")
        fen = fen.replacingOccurrences(of: "5", with: "     ")
        fen = fen.replacingOccurrences(of: "6", with: "      ")
        fen = fen.replacingOccurrences(of: "7", with: "       ")
        fen = fen.replacingOccurrences(of: "8", with: "        ")

        let fenArray = fen.split(separator: "/")
        
        for (fenRow, row) in zip(fenArray, 0..<8) {
            for (fenColumn, column) in zip(fenRow, 0..<8) {
                board[row][column] = String(fenColumn)
            }
        }
        
        print(fenArray)
        
    }
    
}
