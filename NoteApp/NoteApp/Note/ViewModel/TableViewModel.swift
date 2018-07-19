//
//  TableViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    func numbersOfNotesForRows() -> Int?
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> TableViewCellViewModelType?
    func viewModelForSelectedRow() -> DetailViewViewModelType?
    func selecterRowAtIntexPath(_ indexPath: IndexPath)
    
    func reloadData()
}



class TableViewModel: TableViewViewModelType {
    
    let notesRepository: NoteRepository
    
    private var selectedIndexPath: IndexPath?
    private var cellViewModels: [TableViewCellViewModel] = []
    
    init(notesRepository: NoteRepository) {
        self.notesRepository = notesRepository
    }
    
    func reloadData() {
        cellViewModels = notesRepository.getAllNotes().map({ TableViewCellViewModel(note: $0) })
    }
    
    func numbersOfNotesForRows() -> Int? {
        return self.cellViewModels.count
    }
    
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> TableViewCellViewModelType? {
        return self.cellViewModels[indexPath.row]
    }
    
    func viewModelForSelectedRow() -> DetailViewViewModelType? {
        guard let selectedIndexPath = self.selectedIndexPath else { return nil}
        return DetailViewViewModel(note: self.cellViewModels[selectedIndexPath.row])
    }
    
    func selecterRowAtIntexPath(_ indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
 
}
