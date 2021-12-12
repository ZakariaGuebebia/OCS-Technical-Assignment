//
//  DetailsViewController.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import UIKit
import AVFoundation
import AVKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var fullScreenImageView: UIImageView!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var playButtonView: UIView!

    var coordinator: MainCoordinator?
    var viewModel: DetailsViewModel?
    var cancellable = CancelBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        showActivityIndicator()
        viewModel?.showDetails()
        // Do any additional setup after loading the view.
    }

    @IBAction func playVideo(_ sender: Any) {
        coordinator?.presentVideoPlayer()
    }
}
extension DetailsViewController {

    func bind(to viewModel: DetailsViewModel?) {
        viewModel?.detailsState.print("detailsState").sink(receiveValue: { [self] (state) in
                 hideActivityIndicator()
            switch state {
                case .error:
                    coordinator?.showAlertWith(message: R.string.ocS.comOcsZakErrorUnexpected(),
                                               title: R.string.ocS.comOcsZakAlertError(),
                                               validateTitle: R.string.ocS.comOcsZakOk())
                    break
                case .finishedLoading:
                    playButtonView.isHidden = false
                    pitchLabel.setAttributedText(text: viewModel?.details?.pitch ?? "",
                                                 lineSpace: 0, font: OCSFonts().sfProDisplayRegular,
                                                 size: 16, forgroundColor: R.color.primaryTextColor())
                    fullScreenImageView.setImage(withString: viewModel?.serie?.fullscreenimageurl ?? "",
                                                 placeholderImage: UIImage(named: "ic-OCS_logo"))
                    break
                case .idle:
                    break
            }
        })
            .store(in: &cancellable)
    }
}
