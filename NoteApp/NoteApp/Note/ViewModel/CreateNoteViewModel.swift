//
//  CreateNoteViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

class CreateNoteViewMode: CreateNoteViewModelType {
    func createNote(noteName: String, noteDescription: String) {
        let newNote = Note(noteName: noteName, noteBody: noteDescription)
        NoteDataManager.sharedInstance.addNewNote(newNote)
    }
}
