//
//  ViewController.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

class NotesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    var viewModel: NoteViewModelType?
    var lifeTime = Lifetime.make()
    
    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .black
        controller.searchBar.barTintColor = .black
        controller.searchBar.barTintColor = .clear
        controller.searchBar.placeholder = "Search note"
        return controller
    })()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.reloadData()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.tableHeaderView = searchController.searchBar
        

        searchController.searchBar.reactive.cancelButtonClicked.observeValues { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.reloadData()
            self?.tableView.reloadData()
        }
        
        
        searchController.searchBar.reactive.continuousTextValues.observeValues { [weak self] (values) in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.searh(searchBarText: values!)
            strongSelf.tableView.reloadData()
        }
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
        return viewModel?.numbersOfNotesForRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NoteTableViewCell
        guard let tableViewCell = cell, let viewModel = self.viewModel else { return NoteTableViewCell() }
        let cellViewModel = viewModel.cellViewModelForIndexPath(indexPath)
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let viewModel = self.viewModel else { return indexPath }
        viewModel.selecterRowAtIntexPath(indexPath)
        return indexPath
    }
    
}
