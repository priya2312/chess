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
    var currentChosenCell = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        let row = indexPath.item/noOfItemsInRow
        let column = indexPath.item % noOfItemsInRow
        
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
        
        if (cellPressed.tag != currentChosenCell){
            cellPressed.backgroundColor = .gray
            currentChosenCell = cellPressed.tag
        }else{
            cellPressed.backgroundColor = .clear
            currentChosenCell = -1
        }
        
    }
    
}
