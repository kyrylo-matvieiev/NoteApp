//
//  TableViewCellViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

protocol TableViewCellViewModelType: class {
    var noteName: String { get }
    var noteDate: String { get }
    var backgroundColor: UIColor { get }
    func pressedDoneButton(atIndexPath: IndexPath)
}



class TableViewCellViewModel: TableViewCellViewModelType {
    private var note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var noteName: String {
        return self.note.noteName
    }
    
    var noteDate: String {
        return self.note.noteDate.dateToString()
    }
    
    var backgroundColor: UIColor {
        return self.note.noteState.isDone ? .green : .white
    }
    
    func pressedDoneButton(atIndexPath: IndexPath) {
        note.noteState = note.noteState.isDone ? .inProgress : .done
    }
}
