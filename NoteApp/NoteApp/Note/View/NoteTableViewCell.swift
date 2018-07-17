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
    
    func configure(with note: Note) {
        self.noteName.text = note.noteName
        self.noteDate.text = note.noteDate.dateToString()
    }
    
}
