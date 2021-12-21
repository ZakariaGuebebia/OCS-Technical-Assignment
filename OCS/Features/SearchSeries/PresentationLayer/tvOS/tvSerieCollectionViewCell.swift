//
//  tvSerieCollectionViewCell.swift
//  OCS_TV
//
//  Created by Zakaria on 20/12/2021.
//

import UIKit

class tvSerieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
            // Initialization code
    }

    func configureCell(serie: Serie) {
        self.titleLabel.setAttributedText(text: serie.title ?? "", lineSpace: 0, font: OCSFonts().sfProTextBoldFontName, size: 12, forgroundColor: R.color.primaryTextColor())
        self.subtitleLabel.setAttributedText(text: serie.subtitle ?? "", lineSpace: 0, font: OCSFonts().sfProDisplayRegular, size: 10, forgroundColor: R.color.primaryTextColor())
            // image base url is unknown i always get 404 error when trying to fetch the image using the "https://api.ocs.fr/apps/v2" + imageurl
        self.posterImageView.setImage(withString: ApiClient.imagesBaseURL()+(serie.imageurl ?? ""), placeholderImage: UIImage(named: "ic-placeHolder"))
    }

}
