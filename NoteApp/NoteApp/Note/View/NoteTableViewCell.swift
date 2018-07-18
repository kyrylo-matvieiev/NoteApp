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
    
    
    weak var veiwModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            self.noteDate.text = viewModel.noteDate
            self.noteName.text = viewModel.noteName
            self.backgroundColor = viewModel.backgroundColor
        }
    }
    
    
//    var donePressed: (() -> Void)?
//
//    func configure(with note: Note) {
//        self.noteName.text = note.noteName
//        self.noteDate.text = note.noteDate.dateToString()
//        self.backgroundColor = note.noteState.isDone ? .green : .white
//
//    }
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
//        self.backgroundColor = UIColor.green
//        donePressed?()
    }
    
}
