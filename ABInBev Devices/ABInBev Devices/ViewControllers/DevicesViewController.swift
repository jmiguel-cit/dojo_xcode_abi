//
//  DevicesViewController.swift
//  ABInBev Devices
//
//  Created by Andre Luis Forner on 21/08/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit

class DevicesViewController: UIViewController {

    @IBOutlet weak var availableDevicesTableView: UITableView!
    @IBOutlet weak var reservedDevicesTableView: UITableView!
    var devices = [DeviceInfo]()
    var availableDevicesTableDelegate : AvailableDevicesTableViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        getAllDevices()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func getAllDevices() {
        FirestoreRepository.shared.getAllDevices() {deviceInfoArray in
            self.devices = deviceInfoArray
            self.availableDevicesTableDelegate?.setDataSource(dataSource: deviceInfoArray)
            self.availableDevicesTableView.reloadData()
            
        }
    }
    
    func configTableView() {
        self.availableDevicesTableView.register(UINib.init(nibName: "AvailableDeviceTableViewCell", bundle: nil), forCellReuseIdentifier: "AvailableDeviceTableViewCell")
        self.availableDevicesTableDelegate = AvailableDevicesTableViewDelegate.init(dataSource: devices)
        self.availableDevicesTableView.delegate = self.availableDevicesTableDelegate
        self.availableDevicesTableView.dataSource = self.availableDevicesTableDelegate
    }
}
