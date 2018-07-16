//
//  NoteTableViewCell.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteName: UILabel!
    @IBOutlet weak var noteDate: UILabel!
    
    func configure(with note: Note) {
        self.noteName.text = note.noteName
        self.noteDate.text = note.noteDate.dateToString()
    }
    
}


extension Date {
    func dateToString() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yy"
        return dateformatter.string(from: self)
    }
}
