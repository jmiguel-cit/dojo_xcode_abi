//
//  ViewController.swift
//  ABInBev Devices
//
//  Created by Joao Miguel Godoy Faccio on 05/08/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //Firebase RealTime
    var dbRealTime: DatabaseReference!
    
    //Firebase FireStore
    var dbFireStore: Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Firebase RealTime
        dbRealTime = Database.database().reference()
        
        //Firebase FireStore
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        dbFireStore = Firestore.firestore()
    }
}

