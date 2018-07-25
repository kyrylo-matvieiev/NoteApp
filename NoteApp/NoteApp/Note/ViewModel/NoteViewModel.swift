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
    func selectRowAtIntex(_ index: Int)
    func numbersOfNotesForRows() -> Int?
    func reloadData()
    
    var showDetails: Signal<DetailViewModelType, NoError> { get }
    var onDataUpdate: Signal<Void, NoError> { get }
    
    func searh(searchBarText: String)
}



class NoteViewModel: NoteViewModelType {
 
    let notesRepository: NoteRepository
    private var cellViewModels: [NoteCellViewModel] = []
    
    var onDataUpdate: Signal<Void, NoError>
    private var onDataUpdateObserver: Signal<Void, NoError>.Observer
    
  
    private var showDetailsObserver: Signal<DetailViewModelType, NoError>.Observer
    
    var showDetails: Signal<DetailViewModelType, NoError>
    
    init(notesRepository: NoteRepository) {
        self.notesRepository = notesRepository
        
        (onDataUpdate, onDataUpdateObserver) = Signal<Void, NoError>.pipe()
        (showDetails, showDetailsObserver) = Signal<DetailViewModelType, NoError>.pipe()
    }
    
    func searh(searchBarText: String) {
        if searchBarText.count > 2, searchBarText != "", searchBarText.isEmpty == false {
        cellViewModels = notesRepository
            .getAllNotes()
            .map({ NoteCellViewModel(note: $0) })
            .filter({ (model) -> Bool in
                
            model.noteName.lowercased().contains(searchBarText.lowercased())
        })
            onDataUpdateObserver.send(value: ())
        } else {
            reloadData()
        }
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.cellViewModels = self.notesRepository.getAllNotes().map({ NoteCellViewModel(note: $0) })
            self.onDataUpdateObserver.send(value: ())
        }
        
    }
    
    func numbersOfNotesForRows() -> Int? {
        return self.cellViewModels.count
    }
    
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> NoteCellViewModelType? {
        return self.cellViewModels[indexPath.row]
    }
    
    func selectRowAtIntex(_ index: Int) {
        let cellViewModel = cellViewModels[index]
        let detailViewModel = DetailViewModel(note: cellViewModel)
        showDetailsObserver.send(value: detailViewModel)
    }
    
 
}
