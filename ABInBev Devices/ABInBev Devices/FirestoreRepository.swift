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
    
    func addEntity(entity: DeviceInfo) {
        
        guard let data = try? JSONEncoder().encode(entity) else {return}
        
        if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            _db.collection("devices").addDocument(data: dictionary!)
        }
        
        
    }
    
    func getAllDevices(completion: @escaping ([DeviceInfo]) -> Void){
        
       var deviceInfoArray = [DeviceInfo]()
         _db.collection("devices").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(deviceInfoArray)
            } else {
                for document in querySnapshot!.documents {
                     let data = try? JSONSerialization.data(withJSONObject: document.data(), options: [])
                     let deviceInfo = try? JSONDecoder().decode(DeviceInfo.self, from: data!)
                    deviceInfoArray.append(deviceInfo!)
                }
                completion(deviceInfoArray)
            }
        }
    }
}

