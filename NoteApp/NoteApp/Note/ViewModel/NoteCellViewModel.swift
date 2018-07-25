//
//  TableViewCellViewModel.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/18/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

protocol NoteCellViewModelType {
//    var backgroundUpdated: ((UIColor) -> Void)? { get set }
//    var backgroundColor: UIColor { get }
//    var noteName: SignalProducer<String, NoError> { get }
//    func donePressed()
    
    var backgroundColor: SignalProducer<UIColor, NoError> { get }
    var doneButtonPressed: Signal<Void, NoError>.Observer { get }
    var noteName: String { get }
    var noteDate: String { get }
    var noteBody: String { get }
}



class NoteCellViewModel: NoteCellViewModelType {
    private var note: Note
    private let backgroundColorProp: MutableProperty<UIColor> = MutableProperty(.white)
    private let donePressedSignal: Signal<Void, NoError>
    let doneButtonPressed: Signal<Void, NoError>.Observer
    
    private let lifeTime = Lifetime.make()
    
    var backgroundColor: SignalProducer<UIColor, NoError> {
        return backgroundColorProp.producer
    }
    
    init(note: Note) {
        self.note = note
        
        backgroundColorProp.value = self.note.noteState.isDone ? .green : .white
        
        (donePressedSignal, doneButtonPressed) = Signal<Void, NoError>.pipe()
        
        donePressedSignal.take(during: lifeTime.lifetime).observeValues { [weak self] in
            guard let strongSelf = self else { return }
                strongSelf.note.noteState = strongSelf.note.noteState.isDone ? .inProgress : .done
                strongSelf.backgroundColorProp.value = strongSelf.note.noteState.isDone ? .green : .white
        }
    }
    
    var noteName: String {
        return self.note.noteName
    }
    
    var noteBody: String {
        return self.note.noteBody 
    }
    
    var noteDate: String {
        return self.note.noteDate.dateToString()
    }
    
//    func donePressed() {
//        backgroundColorProp.value = self.note.noteState.isDone ? .green : .white
//        self.note.noteState = self.note.noteState.isDone ? .inProgress : .done
//    }
    
}
