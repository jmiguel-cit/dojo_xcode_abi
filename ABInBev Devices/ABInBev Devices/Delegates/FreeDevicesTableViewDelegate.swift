//
//  FreeDevicesTableViewDelegate.swift
//  ABInBev Devices
//
//  Created by Fabio Leonardo Barros Martinez on 8/20/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit


class FreeDevicesTableViewDelegate: NSObject, UITableViewDelegate {
    var dataSource = [Any]()
    
    init(dataSource: [Any]){
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.dataSource[indexPath.row] is String{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingTableViewCell", for: indexPath)
            return cell
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FreeDeviceTableViewCell", for: indexPath) as? FreeDeviceTableViewCell {
                if let currentDevice = self.dataSource[indexPath.row] as? Device{
                    cell.cellConfig(device: currentDevice)
                }
                return cell
            }
        }
        
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if self.dataSource[indexPath.row] is String{
            return 44
        }else{
            return 65
        }
    }
    
    func setDataSource(dataSource: [Any]){
        self.dataSource = dataSource
    }
    

}

extension FreeDevicesTableViewDelegate: UITableViewDataSource {
    
    
    
}
