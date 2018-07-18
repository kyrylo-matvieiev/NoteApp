//
//  TableViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

class TableViewModel: TableViewModelType {
    var numberOfRows: Int {
        return NoteDataManager.sharedInstance.getAllNotes().count
    }
    
    var notes: [Note] {
        return NoteDataManager.sharedInstance.getAllNotes()
    }
    
}
