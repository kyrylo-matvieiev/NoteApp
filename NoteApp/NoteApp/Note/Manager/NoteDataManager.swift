//
//  NoteDataManager.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

class NoteDataManager: NoteRepository {
    private var listOfNotes: [Note] = []
    static let sharedInstance = NoteDataManager()
    
    private init() {}
    
    
    func getAllNotes() -> [Note] {
        return self.listOfNotes
    }
    
    func addNewNote(_ note: Note) {
        self.listOfNotes.append(note)
    }
    
    func getNoteById(_ id: String) -> Note? {
        guard let note = self.listOfNotes.first(where: { $0.id == id }) else { return nil }
        return note
    }
    
    func removeById(_ id: String) -> Bool {
        guard let index = self.listOfNotes.index(where: { $0.id == id }) else {  return false }
        self.listOfNotes.remove(at: index)
        return true
    }
    
    func updateNote(_ note: Note) {
        guard let index = self.listOfNotes.index(where: { $0.id == note.id }) else { return }
        self.listOfNotes[index] = note
        
        
//        self.listOfNotes[index].noteBody = note.noteBody
//        self.listOfNotes[index].noteDate = note.noteDate
//        self.listOfNotes[index].noteName = note.noteName
    }
}
