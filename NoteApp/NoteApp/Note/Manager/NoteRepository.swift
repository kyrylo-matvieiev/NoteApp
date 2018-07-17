//
//  NoteRepository.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/17/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation


protocol NoteRepository {
    func getAllNotes() -> [Note]
    func addNewNote(_ note: Note)
    func getNoteById(_ id: String) -> Note?
    func removeById(_ id: String) -> Bool
    func updateNote(_ note: Note)
 }
