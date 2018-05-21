//
//  PlayerTableViewCell.swift
//  CustomCellDemo
//
//  Created by Varun on 15/05/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblTeamName: UILabel!
    @IBOutlet weak var lblPlayerAge: UILabel!
    @IBOutlet weak var btnPlayer: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(player: Player) {
        
        lblPlayerName.text = player.name
        lblTeamName.text = player.team
        lblPlayerAge.text = String(player.age)
        playerImageView.image = UIImage(named: player.imageName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
}
