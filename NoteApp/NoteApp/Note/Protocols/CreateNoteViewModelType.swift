//
//  CreateNoteViewModelType.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

protocol CreateNoteViewModelType {
//    var noteName: String { get set }
//    var noteBody: String { get set }
    func createNote(noteName: String, noteBody: String)
}
