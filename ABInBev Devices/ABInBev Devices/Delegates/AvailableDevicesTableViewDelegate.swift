//
//  AvailableDevicesTableViewDelegate.swift
//  ABInBev Devices
//
//  Created by Joao Miguel Godoy Faccio on 24/08/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit

class AvailableDevicesTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    var dataSource = [Any]()
    
    init(dataSource: [Any]) {
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AvailableDeviceTableViewCell", for: indexPath) as? AvailableDeviceTableViewCell {
            if let currentDevice = self.dataSource[indexPath.row] as? DeviceInfo {
                cell.cellConfig(device: currentDevice)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func setDataSource(dataSource: [Any]) {
        self.dataSource = dataSource
    }
    

}
