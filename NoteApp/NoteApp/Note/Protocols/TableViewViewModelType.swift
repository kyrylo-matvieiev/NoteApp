//
//  TableViewModelType.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation


protocol TableViewViewModelType {
    func numbersOfRows() -> Int?
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> TableViewCellViewModelType?
    func viewModelForSelectedRow() -> DetailViewViewModelType?
    func selecterRowAtIntexPath(_ indexPath: IndexPath) 
}
