//
//  Device.swift
//  ABI Device
//
//  Created by Joao Miguel Godoy Faccio on 31/07/2018.
//  Copyright © 2018 jmiguel. All rights reserved.
//

import Foundation

struct Device : Codable{
    
//    init(codigo: String, fabricante: String, modelo: String, imei: String, observacao: String, patrimonio: String) {
//        self.codigo = codigo
//        self.fabricante = fabricante
//        self.modelo = modelo
//        self.imei = imei
//        self.observacao = observacao
//        self.patrimonio = patrimonio
//    }
    
    var codigo: String
    var fabricante: String
    var modelo: String
    var imei: String
    var observacao: String
    var patrimonio: String

}
