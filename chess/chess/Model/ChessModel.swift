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
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
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
        
        for idx in (1...8).reversed() {
            if idx == 1 {
                fen = fen.replacingOccurrences(of: "\(idx)", with: " ")
            }else{
                fen = fen.replacingOccurrences(of: "\(idx)", with: " \(idx-1)")
            }
        }
        
        let fenArray = fen.split(separator: "/")
        
        for (fenRow, row) in zip(fenArray, 0..<8) {
            for (fenColumn, column) in zip(fenRow, 0..<8) {
                board[row][column] = String(fenColumn)
            }
        }
        
        print(fenArray)
        
    }
    
    static func movePiece(from fromLocation: Int, to toLocation: Int){
        
        print("Moving piece")
        
        let (fromRow, fromCol) = getRowColumn(squareIdx: fromLocation)
        let (toRow, toCol) = getRowColumn(squareIdx: toLocation)
        
        print("\(fromRow), \(fromCol) to \(toRow), \(toCol)")
        
        board[toRow][toCol] = board[fromRow][fromCol]
        board[fromRow][fromCol] = " "
        
    }
    
    static func getRowColumn(squareIdx: Int) -> (Int, Int) {
        
        let noOfItemsInRow = 8
        
        let row: Int = squareIdx / noOfItemsInRow
        let column: Int = squareIdx % noOfItemsInRow
        
        return (row, column)
        
    }
    
}
