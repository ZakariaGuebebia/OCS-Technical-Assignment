//  SerieCollectionViewCell.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

import UIKit

class SerieCollectionViewCell: UICollectionViewCell {

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
        self.posterImageView.setImage(withString: ApiClient.baseURL()+(serie.imageurl ?? ""), placeholderImage: UIImage(named: "ic-placeHolder"))
    }

}
