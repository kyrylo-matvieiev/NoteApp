//
//  DetailViewViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

protocol DetailViewViewModelType {
    var  noteBody: String { get }
}



class DetailViewViewModel: DetailViewViewModelType {
    private var note: TableViewCellViewModelType
    
    var noteBody: String {
        return self.note.noteBody
    }
    
    init(note: TableViewCellViewModelType) {
        self.note = note
    }
}
