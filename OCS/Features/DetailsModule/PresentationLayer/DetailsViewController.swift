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

        // MARK: - IBOutlet
    @IBOutlet weak var fullScreenImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var playVideoButton: UIButton!

        // MARK: - Properties
    var coordinator: MainCoordinator?
    var viewModel: DetailsViewModel?
    private var cancellable = CancelBag()
        // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        titleLabel.setAttributedText(text: viewModel?.serie?.title ?? "",
                                     lineSpace: 0, font: OCSFonts().sfProTextBoldFontName,
                                     size: 20, forgroundColor: R.color.primaryTextColor())
        subtitleLabel.setAttributedText(text: viewModel?.serie?.subtitle ?? "",
                                        lineSpace: 0, font: OCSFonts().sfProTextBoldFontName,
                                        size: 18, forgroundColor: R.color.primaryTextColor())
        fullScreenImageView.setImage(withString: viewModel?.serie?.fullscreenimageurl ?? "",
                                     placeholderImage: UIImage(named: "ic-OCS_logo"))
        showActivityIndicator()
        viewModel?.showDetails()
    }
        // MARK: - IBAction

    @IBAction func playVideo(_ sender: Any) {
        coordinator?.presentVideoPlayer()
    }
}
    // MARK: - DetailsViewControllerExtensions

extension DetailsViewController {

    fileprivate func updateUI() {
        pitchLabel.setAttributedText(text: viewModel?.details?.pitch ?? "",
                                     lineSpace: 0, font: OCSFonts().sfProDisplayRegular,
                                     size: 16, forgroundColor: R.color.primaryTextColor())
    }

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
                    updateUI()
                    break
                case .idle:
                    break
            }
        })
            .store(in: &cancellable)
    }
}
