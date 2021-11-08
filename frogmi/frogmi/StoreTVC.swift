//
//  StoreTVC.swift
//  frogmi
//
//  Created by Christian Meza on 08-11-21.
//

import UIKit

class StoreTVC: UITableViewCell {

    @IBOutlet weak var storeView: UIView!
    
    @IBOutlet weak var lbl_code: UILabel!
    @IBOutlet weak var lbl_store: UILabel!
    
    @IBOutlet weak var lbl_full_address: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
