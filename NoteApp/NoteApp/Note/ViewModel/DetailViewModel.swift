//
//  DetailViewViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

protocol DetailViewModelType {
    var  noteBody: String { get }
}



class DetailViewModel: DetailViewModelType {
    private var note: NoteCellViewModelType
    
    var noteBody: String {
        return self.note.noteBody
    }
    
    init(note: NoteCellViewModelType) {
        self.note = note
    }
}
