//
//  Note.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit


class Note {
    var noteName: String
    var noteDate: Date
    var noteBody: String
    
    init(noteName: String, noteDate: Date, noteBody: String) {
        self.noteName = noteName
        self.noteDate = noteDate
        self.noteBody = noteBody
    } 
}
