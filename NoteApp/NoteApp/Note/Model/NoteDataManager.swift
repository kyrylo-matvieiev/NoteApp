//
//  NoteDataManager.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation
import RealmSwift

class NoteDataManager: NoteRepository {
    static let sharedInstance = NoteDataManager()
    private var realm: Realm
    
    
    private init() { self.realm = try! Realm() }
    
    func getAllNotes() -> [Note] {
        let listOfNotesResult = self.realm.objects(Note.self)
        return Array(listOfNotesResult)
    }
    
    func addNewNote(_ note: Note) {
        try! realm.write {
            realm.add(note)
        }
    }
    
    func getNoteById(_ id: String) -> Note? {
        return realm.objects(Note.self).filter("id == \(id)").first
    }
    
    func deleteAllNoteFromDb() {
        try! self.realm.write {
            self.realm.deleteAll()
        }
    }
    
    func modifyNote(_ blockTransaction: () -> Void) {
        try! self.realm.write {
            blockTransaction()
        }
    }
    
}
