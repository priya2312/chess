//
//  BoardViewController.swift
//  chessboard
//
//  Created by Priyadharshini Tamilarasan on 02/08/20.
//  Copyright © 2020 Priyadharshini Tamilarasan. All rights reserved.
//

import UIKit

class BoardCell: UICollectionViewCell {
    @IBOutlet weak var itemButtom: UIButton!
}

class BoardViewController: UIViewController {

    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    var noOfItemsInRow = 8
//    var currentChosenCell = -1
    
    var fromLocation: Int?
    var toLocation: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ChessModel.fenToBoard("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BoardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noOfItemsInRow * noOfItemsInRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = boardCollectionView.dequeueReusableCell(withReuseIdentifier: K.Cells.boardCell, for: indexPath) as! BoardCell
        
        let (row, column) = ChessModel.getRowColumn(squareIdx: indexPath.item)
        
        if (row + column) % 2 == 0 {
            cell.backgroundColor = K.Colors.lightSquare
        }else{
            cell.backgroundColor = K.Colors.darkSquare
        }
        
        cell.itemButtom.tag = indexPath.item
        cell.itemButtom.addTarget(self, action: #selector(itemPressed(_:)), for: .touchUpInside)
        
        // Adding images to the board
        let piece = ChessModel.board[row][column]
        let pieceImage = ChessModel.getPieceImage(piece)
        
        cell.itemButtom.setImage(pieceImage, for: .normal)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let myWidth = boardCollectionView.frame.size.width/CGFloat(noOfItemsInRow)
        let myHeight = boardCollectionView.frame.size.height/CGFloat(noOfItemsInRow)
        
        return CGSize(width: myWidth, height: myHeight)
    }
    
    @objc func itemPressed(_ cellPressed: UIButton){
        print(cellPressed.tag)
        
//        if (cellPressed.tag != currentChosenCell){
//            cellPressed.backgroundColor = K.Colors.selectedSquare
//            currentChosenCell = cellPressed.tag
//        }else{
//            cellPressed.backgroundColor = .clear
//            currentChosenCell = -1
//        }
        
        if fromLocation == nil {
            print("from: \(cellPressed.tag)")
            let (row, col) = ChessModel.getRowColumn(squareIdx: cellPressed.tag)
            print(ChessModel.board[row][col])
            if (ChessModel.board[row][col] != " "){
                fromLocation = cellPressed.tag
            }else{
                fromLocation = nil
            }
        }else{
            toLocation = cellPressed.tag
        }
        
        // Executed when from and to location are not null
        if let fromPos = fromLocation, let toPos = toLocation {
            print("from: \(fromPos)")
            print("to: \(toPos)")
            ChessModel.movePiece(from: fromPos, to: toPos)
            
            boardCollectionView.reloadData()            
            self.fromLocation = nil
            self.toLocation = nil
        }
        
    }
    
}
