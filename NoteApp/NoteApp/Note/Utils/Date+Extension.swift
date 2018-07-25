//
//  Date+Extension.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/17/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yy"
        return dateformatter.string(from: self)
    }
}

