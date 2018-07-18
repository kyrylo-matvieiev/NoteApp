//
//  TableViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

class TableViewModel: TableViewViewModelType {
    private var selectedIndexPath: IndexPath?
    
    func numbersOfRows() -> Int? {
        return NoteDataManager.sharedInstance.getAllNotes().count
    }
    
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> TableViewCellViewModelType? {
        let note = NoteDataManager.sharedInstance.getAllNotes()[indexPath.row]
        return TableViewCellViewModel(note: note)
    }
    
    func viewModelForSelectedRow() -> DetailViewViewModelType? {
        guard let selectedIndexPath = self.selectedIndexPath else { return nil}
        return DetailViewViewModel(note: NoteDataManager.sharedInstance.getAllNotes()[selectedIndexPath.row])
    }
    
    func selecterRowAtIntexPath(_ indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
