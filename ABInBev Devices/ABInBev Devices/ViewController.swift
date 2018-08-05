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

    func AddRealTime(){
        let device1 = ["codigo": "1",
                       "fabricante": "Apple",
                       "modelo": "iPhone 5S",
                       "imei": "352047061506932",
                       "observacao": "observa",
                       "patrimonio": "99999"]
        
        let device2 = ["codigo": "2",
                       "fabricante": "Apple",
                       "modelo": "iPhone 6S",
                       "imei": "353288073041133",
                       "observacao": "",
                       "patrimonio": "17994"]
        
        let device3 = ["codigo": "4",
                       "fabricante": "Apple",
                       "modelo": "iPhone 7",
                       "imei": "355327086523493",
                       "observacao": "",
                       "patrimonio": "19408"]
        
        var key = dbRealTime.childByAutoId().key
        dbRealTime.child("devices").child(device1["codigo"]!).setValue(device1)
        
        key = dbRealTime.childByAutoId().key
        dbRealTime.child("devices").child(key).setValue(device2)
        
        key = dbRealTime.childByAutoId().key
        dbRealTime.child("devices").child(key).setValue(device3)
    }

    func AddFireStore(){
        let device2 = ["codigo": "2",
                       "fabricante": "Apple",
                       "modelo": "iPhone 6S",
                       "imei": "353288073041133",
                       "observacao": "",
                       "patrimonio": "17994"]
        
        let device3 = ["codigo": "4",
                       "fabricante": "Apple",
                       "modelo": "iPhone 7",
                       "imei": "355327086523493",
                       "observacao": "",
                       "patrimonio": "19408"]
        
        var ref: DocumentReference? = nil
        ref = dbFireStore.collection("devices").addDocument(data: [
            "codigo": "1",
            "fabricante": "Apple",
            "modelo": "iPhone 5S",
            "imei": "352047061506932",
            "observacao": "observa",
            "patrimonio": "99999"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        ref = dbFireStore.collection("devices").addDocument(data: device2)
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        ref = dbFireStore.collection("devices").addDocument(data: device3)
    }
        
}

