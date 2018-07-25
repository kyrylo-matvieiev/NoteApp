//
//  Note.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation
import RealmSwift

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

class Note: Object {
    @objc dynamic var noteName: String = ""
    @objc dynamic var noteBody: String = ""
    @objc dynamic var noteDate: Date = Date()
    @objc dynamic var id: String = UUID().uuidString
    
    var noteState: NoteState {
        get {
            return rawState ? .done : .inProgress
        }
        set {
            try! realm?.write {
                rawState = newValue == .done
            }
        }
    }
    @objc private dynamic var rawState: Bool = false
    
    //    convenience init(noteName: String, noteBody: String) {
    //        self.init()
    //        self.noteName = noteName
    //        self.noteBody = noteBody
    //    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
