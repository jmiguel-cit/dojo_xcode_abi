//
//  FirestoreRepository.swift
//  ABInBev Devices
//
//  Created by Joao Miguel Godoy Faccio on 06/08/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import Firebase

class FirestoreRepository {
    
    static let shared = FirestoreRepository()
    
    private let _db = Firestore.firestore()
    
    private init() {}
    
    func addEntity(entity: Device) {
        
        guard let data = try? JSONEncoder().encode(entity) else {return}
        
        if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            _db.collection("devices").addDocument(data: dictionary!)
        }
        
        
    }
    
    func getAllDevices(_ block: @escaping (_ devices: [Device]) -> Void) {
        var allDevices = [Device]()
        _db.collection("devices").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let jsonDict = document.data() as [String : Any]
                    
                    if JSONSerialization.isValidJSONObject(jsonDict) {
                        if let data = try? JSONSerialization.data(withJSONObject: jsonDict, options: []) {
                            let json = try? JSONSerialization.jsonObject(with: data, options: [])
                            if let dictionary = json as? [String: Any],
                                let codigo = dictionary["codigo"],
                                let fabricante = dictionary["fabricante"],
                                let modelo = dictionary["modelo"],
                                let imei = dictionary["imei"],
                                let observacao = dictionary["observacao"],
                                let patrimonio = dictionary["patrimonio"]{
                                
                                let device = Device(codigo: codigo as! String, fabricante: fabricante as! String, modelo: modelo as! String, imei: imei as! String, observacao: observacao as! String, patrimonio: patrimonio as! String)
                                
                                allDevices.append(device)
                            }
                        }
                    }
                }
                block(allDevices)
            }
        }
    }
    
}

