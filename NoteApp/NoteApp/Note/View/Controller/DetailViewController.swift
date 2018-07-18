//
//  DetailViewController.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailNoteInfo: UILabel!
    var viewModel: DetailViewViewModelType?

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = self.viewModel else { return }
        self.detailNoteInfo.text = viewModel.noteBody
    }
}
