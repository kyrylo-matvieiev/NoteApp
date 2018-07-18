//
//  Note.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

enum NoteState {
    case done, inProgress
    var isDone: Bool {
        switch self {
            case .done:
                return true
            case .inProgress:
                return false
        }
    }
}

class Note {
    let id = UUID().uuidString
    var noteName: String
    var noteDate: Date
    var noteBody: String
    var noteState: NoteState
    
    init(noteName: String, noteBody: String) {
        self.noteName = noteName
        self.noteDate = Date()
        self.noteBody = noteBody
        self.noteState = .inProgress
    } 
}



