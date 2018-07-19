//
//  TableViewCellViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

protocol NoteCellViewModelType: class {
    var backgroundUpdated: ((UIColor) -> Void)? { get set }
    var backgroundColor: UIColor { get }
    var noteName: String { get }
    var noteDate: String { get }
    var noteBody: String { get }
    
    func donePressed()
}



class NoteCellViewModel: NoteCellViewModelType {
    private var note: Note
    
    var backgroundUpdated: ((UIColor) -> Void)?
    
    init(note: Note) {
        self.note = note
    }
    
    var noteName: String {
        return self.note.noteName
    }
    
    var noteBody: String {
        return self.note.noteBody 
    }
    
    var noteDate: String {
        return self.note.noteDate.dateToString()
    }
    
    var backgroundColor: UIColor {
        return self.note.noteState.isDone ? .green : .white
    }
    
    func donePressed() {
        self.note.noteState = self.note.noteState.isDone ? .inProgress : .done
        backgroundUpdated?(backgroundColor)
    }
    
}
