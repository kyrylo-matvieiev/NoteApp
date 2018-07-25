//
//  CreateNoteViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

protocol CreateNoteViewModelType {
    func createNote(noteName: String, noteBody: String)
}



class CreateNoteViewModel: CreateNoteViewModelType {

    func createNote(noteName: String, noteBody: String) {
        let newNote = Note()
        newNote.noteName = noteName
        newNote.noteBody = noteBody
        NoteDataManager.sharedInstance.addNewNote(newNote)
    }
    
}
