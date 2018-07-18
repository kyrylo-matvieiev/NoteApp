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
    private var viewModel: TableViewViewModelType?

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = TableViewModel()
        self.tableView.tableFooterView = UIView()
    }
    
}

extension NotesViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            guard let destinationViewController = segue.destination as? DetailViewController else { return }
            destinationViewController.viewModel = viewModel?.viewModelForSelectedRow()
        }
    }
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numbersOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NoteTableViewCell
        
        guard let tableViewCell = cell, let viewModel = self.viewModel else { return NoteTableViewCell() }
        let cellViewModel = viewModel.cellViewModelForIndexPath(indexPath)
        tableViewCell.veiwModel = cellViewModel

        
//  **** TODO: callback ****
        
/*
        tableViewCell.donePressed = { [weak note, weak cell] in
            guard let note = note else { return }
            note.noteState = note.noteState.isDone ? .inProgress : .done
            cell?.backgroundColor = note.noteState.isDone ? .green : .white
        }
 */
        return tableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = self.viewModel else { return }
        viewModel.selecterRowAtIntexPath(indexPath)
    }
}
