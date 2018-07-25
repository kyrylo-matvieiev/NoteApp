//
//  NoteTableViewCell.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var noteName: UILabel!
    @IBOutlet private weak var noteDate: UILabel!
    var bindingLifetime = Lifetime.make()
    
    
    var viewModel: NoteCellViewModelType? {
        didSet {
            bindingLifetime = Lifetime.make()
            
            guard let viewModel = viewModel else { return }
            self.noteDate.text = viewModel.noteDate
            self.noteName.text = viewModel.noteName
            viewModel.backgroundColor.take(during: bindingLifetime.lifetime).startWithValues { [weak self] (newColor) in
                self?.backgroundColor = newColor
            }
        }
    }
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        //viewModel?.donePressed()
        viewModel?.doneButtonPressed.send(value: ())
    }
    
}
