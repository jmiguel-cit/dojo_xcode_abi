//
//  DevicesViewController.swift
//  ABInBev Devices
//
//  Created by Fabio Leonardo Barros Martinez on 8/20/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit


class DevicesViewController: UIViewController {

    @IBOutlet weak var tableUnavailables: UITableView!
    @IBOutlet weak var tableAvailables: UITableView!
    
    var devices = [Device]()
    var freeTableViewDelegate: FreeDevicesTableViewDelegate?
    var selectedDevices = [Device]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freeTableViewDelegate = FreeDevicesTableViewDelegate(dataSource: ["LoadingTableViewCell"])
        
        tableUnavailables.register(UITableViewCell.self, forCellReuseIdentifier: "LoadingTableViewCell")
        
        tableAvailables.register(UINib.init(nibName: "FreeDeviceTableViewCell", bundle: nil), forCellReuseIdentifier: "FreeDeviceTableViewCell")
        tableAvailables.register(UINib.init(nibName: "LoadingTableViewCell", bundle: nil), forCellReuseIdentifier: "LoadingTableViewCell")
        
        tableAvailables.delegate = freeTableViewDelegate
        tableAvailables.dataSource = freeTableViewDelegate
        
        getAllDevices()

    }
    

    func getAllDevices(){
        FirestoreRepository.shared.getAllDevices({ (devices) in
            print(devices)
            self.devices = devices
            self.freeTableViewDelegate?.setDataSource(dataSource: devices)
            self.tableAvailables.reloadData()
            
        })
    }


}
