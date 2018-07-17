//
//  ViewController.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var dataSource: NoteDataManager = NoteDataManager.sharedInstance
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    
    @IBAction func createNoteButton(_ sender: Any) { /* GO TO CreateNoteViewController */ }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            let selectedCell = sender as! NoteTableViewCell
            let indexPath = self.tableView.indexPath(for: selectedCell) //indexPath
            let destinationViewController = segue.destination as! DetailViewController //destinationViewController
            
            
        }
    }
}

extension NoteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NoteDetail", sender: indexPath.row)
    }
}

extension NoteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.configure(with: self.dataSource.getAllNotes()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.getAllNotes().count
    }
}
