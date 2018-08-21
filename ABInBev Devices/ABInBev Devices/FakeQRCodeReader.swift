//
//  FakeQRCodeReader.swift
//  ABInBev Devices
//
//  Created by Joao Miguel Godoy Faccio on 06/08/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

final class FakeQRCodeReader {
    
    static func read() -> Device {
        
        let fakeDevices: [Device] = [
            Device(codigo: "1", fabricante: "Apple", modelo: "iPhone 5S", imei: "352047061506932", observacao: "obs 1", patrimonio: "111"),
            Device(codigo: "2", fabricante: "Apple", modelo: "iPhone 6S", imei: "353288073041133", observacao: "obs 2", patrimonio: "222"),
            Device(codigo: "3", fabricante: "Apple", modelo: "iPhone 7", imei: "355327086523493", observacao: "obs 3", patrimonio: "333")
            
        ]
        let i = Int.random(in: 0..<fakeDevices.count)
        
        let randomDevice = fakeDevices[i]
        
        return randomDevice
    }
    
}
