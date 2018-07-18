//
//  DetailViewViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

class DetailViewViewModel: DetailViewViewModelType {
    private var note: Note
    
    var noteBody: String {
        return self.note.noteBody
    }
    
    init(note: Note) {
        self.note = note
    }
}
