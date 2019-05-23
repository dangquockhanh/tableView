//
//  TableViewCell.swift
//  demoTableView1
//
//  Created by Đặng Khánh  on 5/22/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

//delete1
protocol DeleteIndexPath {
    func delete(at indexPAth: IndexPath)
}
class TableViewCell: UITableViewCell {
    var deleGate: DeleteIndexPath? //delete2
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelage: UILabel!
    var indexPath: IndexPath?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnDelete(_ sender: Any) {
        deleGate?.delete(at: indexPath!) // delete3
    }

}
