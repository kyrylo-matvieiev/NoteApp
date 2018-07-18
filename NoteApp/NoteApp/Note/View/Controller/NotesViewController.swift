//
//  ViewController.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    var viewModel: TableViewModelType? // MVVM
    
    private var dataSource: NoteRepository = NoteDataManager.sharedInstance
    private var cellModels: [Note] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cellModels = dataSource.getAllNotes()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    

    @IBAction func createNoteButton(_ sender: Any) { /* GO TO CreateNoteViewController */ }

}

extension NotesViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            guard let destinationViewController = segue.destination as? DetailViewController else { return }
            destinationViewController.detailNoteInfoTmp = cellModels[indexPath!].noteBody
        }
    }
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NoteTableViewCell
        
        guard let tableViewCell = cell, let viewModel = self.viewModel else { return NoteTableViewCell() }
        
        //let note = cellModels[indexPath.row]
        let note = viewModel.notes[indexPath.row]
        
//        cell.configure(with: note)
//        cell.donePressed = { [weak note, weak cell] in
//            guard let note = note else {
//                return
//            }
//            note.noteState = note.noteState.isDone ? .inProgress : .done
//            cell?.backgroundColor = note.noteState.isDone ? .green : .white
//        }
//        return cell
        
        tableViewCell.configure(with: note)
        tableViewCell.donePressed = { [weak note, weak cell] in
            guard let note = note else {
                return
            }
            note.noteState = note.noteState.isDone ? .inProgress : .done
            cell?.backgroundColor = note.noteState.isDone ? .green : .white
        }
        return tableViewCell
        
    }
}
