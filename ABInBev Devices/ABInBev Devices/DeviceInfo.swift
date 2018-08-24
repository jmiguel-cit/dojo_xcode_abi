//
//  DeviceInfo.swift
//  ABInBev Devices
//
//  Created by Joao Miguel Godoy Faccio on 06/08/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
struct  DeviceInfo: Codable {
    var codigo: String
    var fabricante: String
    var modelo: String
    var imei: String
    var observacao: String
    var patrimonio: String
}
