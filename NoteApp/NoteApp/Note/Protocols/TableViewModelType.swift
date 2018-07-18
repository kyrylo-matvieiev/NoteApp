//
//  TableViewModelType.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation


protocol TableViewModelType {
    var numberOfRows: Int { get }
    var notes: [Note] { get }
}
