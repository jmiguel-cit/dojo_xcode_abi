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

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func readAllDevicesPressed(_ sender: Any) {
        
        FirestoreRepository.shared.getAllDevices()
        
    }
    @IBAction func InsertFirestorePressed(_ sender: Any) {
        process()
    }
    func process() {
        //Ler o QRCode
        //TODO Substituir pela implementacao que le um QR Code real
        let deviceinfo = FakeQRCodeReader.read()
        
        //Gravar no banco de dados
        FirestoreRepository.shared.addEntity(entity: deviceinfo)
        
    }
}

