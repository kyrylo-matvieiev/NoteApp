//
//  CreateNoteViewController.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController {
    @IBOutlet private weak var enterNoteName: UITextField!
    @IBOutlet private weak var enterNoteDescription: UITextField!
    
    private var viewModel: CreateNoteViewModelType?
    
    override func viewDidLoad() {
        self.enterNoteDescription.delegate = self
        self.enterNoteName.delegate = self
        
        self.viewModel = CreateNoteViewModel()
    }
        
    @IBAction func saveNewNoteButton(_ sender: Any) {
        guard self.enterNoteName.text?.isEmpty == false, self.enterNoteDescription.text?.isEmpty == false  else { return }
        
        guard let viewModel = self.viewModel else { return }
        viewModel.createNote(noteName: self.enterNoteName.text!, noteBody: self.enterNoteDescription.text!)

        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension CreateNoteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
