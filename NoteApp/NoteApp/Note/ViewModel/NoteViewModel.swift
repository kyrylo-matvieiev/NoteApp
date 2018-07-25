//
//  TableViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

protocol NoteViewModelType {
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> NoteCellViewModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selecterRowAtIntexPath(_ indexPath: IndexPath)
    func numbersOfNotesForRows() -> Int?
    func reloadData()
    
    
    var textFromSearchBar: MutableProperty<String> { get set }
    var searchBarCancelButton: Signal<Void, NoError>? { get set }
}



class NoteViewModel: NoteViewModelType {
 
    let notesRepository: NoteRepository
    private var selectedIndexPath: IndexPath?
    private var cellViewModels: [NoteCellViewModel] = []
    
    var textFromSearchBar: MutableProperty<String> = MutableProperty("")
    var searchBarCancelButton: Signal<Void, NoError>?
    
    init(notesRepository: NoteRepository) {
        self.notesRepository = notesRepository
        
        textFromSearchBar.signal.observeValues { [weak self] (searchBarText) in
            guard let strongSelf = self else {return}
            if searchBarText.count > 2, searchBarText != "" {
                strongSelf.cellViewModels =  strongSelf.cellViewModels.filter({ (model) -> Bool in
                    model.noteName.lowercased().contains(searchBarText.lowercased())
                })
            } else {
                strongSelf.reloadData()
            }
        }
        
        searchBarCancelButton?.signal.observeValues {
            print("rrrrrr")
        }
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
