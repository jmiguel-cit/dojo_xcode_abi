//
//  FreeDeviceTableViewCell.swift
//  ABInBev Devices
//
//  Created by Fabio Leonardo Barros Martinez on 8/20/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit
import M13Checkbox

//protocol FreeDeviceTableViewCellProtocol {
//    func checkBoxStateChange(device: Device, checkBoxState: M13Checkbox.CheckState)
//}

class FreeDeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView?
    @IBOutlet weak var lblModel: UILabel?
    @IBOutlet weak var lblPatrimony: UILabel?
    @IBOutlet weak var checkbox: M13Checkbox?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfig(device: Device){
        self.lblModel?.text = device.modelo
        self.lblPatrimony?.text = device.patrimonio
        var imgName = "img"
        
        if(device.modelo == "Cabos USB" ){
            imgName = String(format: "%@%@", imgName, "Cable")
        }else{
            imgName = String(format: "%@%@", imgName, "Device")
        }
        
        if(device.fabricante == "Apple" ){
            imgName = String(format: "%@%@", imgName, "IOS")
        }else{
            imgName = String(format: "%@%@", imgName, "Android")
        }
        
        self.imgCell?.image = UIImage.init(imageLiteralResourceName: imgName)
        
        self.checkbox?.stateChangeAnimation = .bounce(.fill)
        self.checkbox?.setCheckState(.unchecked, animated: false)
        self.checkbox?.setMarkType(markType: .checkmark, animated: false)

    }
    
    //----------------------------
    // MARK: - Actions
    //----------------------------

    @IBAction func btnCheckBoxAction(_ sender: Any) {
        switch self.checkbox!.checkState {
        case .unchecked:
            self.checkbox!.setCheckState(.checked, animated: true)
            break
        case .checked:
            self.checkbox!.setCheckState(.unchecked, animated: true)
            break
        case .mixed:
            print("mixed")
        }
        
    }
}
