//
//  AvailableDeviceTableViewCell.swift
//  ABInBev Devices
//
//  Created by Joao Miguel Godoy Faccio on 24/08/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit
import M13Checkbox

class AvailableDeviceTableViewCell: UITableViewCell {
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelPatrimony: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var checkboxDevice: M13Checkbox!
    
    @IBAction func btnCheckboxAction(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfig(device: DeviceInfo) {
        self.labelModel.text = device.modelo
        self.labelPatrimony.text = device.patrimonio
        
        var imgName = "img"
        if (device.modelo == "Cabos USB") {
            imgName = String(format: "%@%@", imgName, "Cable")
        } else {
            imgName = String(format: "%@%@", imgName, "Device")
        }
        
        if (device.fabricante == "Android") {
            imgName = String(format: "%@%@", imgName, "Android")
        } else {
            imgName = String(format: "%@%@", imgName, "IOS")
        }
        
        self.imgCell.image = UIImage.init(imageLiteralResourceName: imgName)
        
        self.checkboxDevice.stateChangeAnimation = .bounce(.fill)
        self.checkboxDevice.setCheckState(.unchecked, animated: false)
        self.checkboxDevice.setMarkType(markType: .checkmark, animated: false)

    }

}
