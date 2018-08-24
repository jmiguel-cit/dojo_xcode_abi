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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
}
