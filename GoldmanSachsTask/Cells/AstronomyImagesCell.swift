//
//  AstronomyImagesCell.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//

import UIKit
import SDWebImage

class AstronomyImagesCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailDesLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    var selectedAstronomyImageModel: AstronomyImagesListModel? {
        didSet {
            titleLable.text = selectedAstronomyImageModel?.title
            detailDesLable.text = selectedAstronomyImageModel?.explanation
            dateLabel.text = selectedAstronomyImageModel?.date
            
            if let urlString = selectedAstronomyImageModel?.url {
                imgView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "PlaceHolder.png"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
