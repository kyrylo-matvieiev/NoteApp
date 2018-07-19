//
//  TableViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

protocol NoteViewModelType {
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> NoteCellViewModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selecterRowAtIntexPath(_ indexPath: IndexPath)
    func numbersOfNotesForRows() -> Int?
    func reloadData()
}



class NoteViewModel: NoteViewModelType {
    
    let notesRepository: NoteRepository
    
    private var selectedIndexPath: IndexPath?
    private var cellViewModels: [NoteCellViewModel] = []
    
    init(notesRepository: NoteRepository) {
        self.notesRepository = notesRepository
    }
    
    func reloadData() {
        cellViewModels = notesRepository.getAllNotes().map({ NoteCellViewModel(note: $0) })
    }
    
    func numbersOfNotesForRows() -> Int? {
        return self.cellViewModels.count
    }
    
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> NoteCellViewModelType? {
        return self.cellViewModels[indexPath.row]
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = self.selectedIndexPath else { return nil}
        return DetailViewModel(note: self.cellViewModels[selectedIndexPath.row])
    }
    
    func selecterRowAtIntexPath(_ indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
 
}
