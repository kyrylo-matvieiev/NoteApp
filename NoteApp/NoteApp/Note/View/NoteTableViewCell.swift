//
//  NoteTableViewCell.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var noteName: UILabel!
    @IBOutlet private weak var noteDate: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var donePressed: (() -> Void)?
    
    func configure(with note: Note) {
        self.noteName.text = note.noteName
        self.noteDate.text = note.noteDate.dateToString()
        self.backgroundColor = note.noteState.isDone ? .green : .white
        
    }
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        self.backgroundColor = UIColor.green
        donePressed?()
    }
    
}
