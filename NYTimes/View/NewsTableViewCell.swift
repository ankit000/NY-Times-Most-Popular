//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgNews: UIImageView!
    
    @IBOutlet weak var lblNewsTitle: UILabel!
    
    @IBOutlet weak var lblReporterNames: UILabel!
    
    @IBOutlet weak var lblReportDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWithItem(item: Results) {
        
        lblNewsTitle?.text = item.title
        lblReporterNames?.text = item.byline
        lblReportDate?.text = item.published_date
    }
    
}
