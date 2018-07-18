//
//  TableViewCellViewModelType.swift
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
}
