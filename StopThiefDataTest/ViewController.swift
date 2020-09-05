//
//  ViewController.swift
//  StopThiefDataTest
//
//  Created by Stephen Kennedy on 2020-07-16.
//  Copyright © 2020 Stephen Kennedy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let nib = UINib(nibName: "ClueTableViewCell", bundle: nil)
    @IBOutlet var tableView: UITableView!
    @IBOutlet var clueButton: UIButton!

    var firstClue = true
    var clues: [Location] = []
    var gameState = GameState()
    
    
    @IBAction func getClue(sender: UIButton){
        if firstClue{
            clues.append(gameState.gameBoard[gameState.getFirstClue()]!)
            firstClue=false
        }
        else{
                   clues.append(gameState.gameBoard[gameState.getClue()]!)
        }
       // self.tableView.performBatchUpdates({
            //self.tableView.insertRows(at: [IndexPath(row: self.data.count - 1,
                     //                                section: 0)],
                 //                     with: .automatic)
      //  }, completion: nil)
            tableView.reloadData()
        //
       // tableView.beginUpdates()
      //  tableView.insertRows(at: [NSIndexPath(clues.count-1)], with: .automatic)
     //   tableView.inserRowsAtIndexPaths([NSIndexPath(forRow:clues.count-1, inSection:0)], withRowAnimation:.Automatic)
        //tableView.endUpdates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //clues.append(gameState.gameBoard[123]!)
          //  clues.append(gameState.gameBoard[333]!)
        tableView.register(nib, forCellReuseIdentifier: "ClueTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClueTableViewCell", for: indexPath) as! ClueTableViewCell
        cell.locationNumber.text = String(clues[indexPath.row].locationNumber)
        cell.locationType.text = String(describing: clues[indexPath.row].locationType)
        return cell
    }
    //insert code
    //array.append(new clue)
    //
    //table.beginUpdates()
    //table.inserRowsAtIndexPaths([NSIndexPath(forRow:array.count-1, inSection:0)], withRowAnimation:.Automatic)
    //table.endUpdates()
}

