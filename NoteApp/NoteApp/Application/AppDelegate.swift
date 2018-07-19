//
//  AppDelegate.swift
//  NoteApp
//
//  Created by Kyrylo Matvieiev on 7/16/18.
//  Copyright © 2018 Kyrylo Matvieiev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let nav = window?.rootViewController as! UINavigationController
        let notesVC = nav.topViewController as! NotesViewController
        notesVC.viewModel = NoteViewModel(notesRepository: NoteDataManager.sharedInstance)
        
        return true
    }
}

