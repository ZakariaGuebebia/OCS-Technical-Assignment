//
//  SearchViewController.swift
//  OCS
//
//  Created by Zakaria on 21/12/2021.
//

import UIKit

class SearchViewController: UIViewController, UIGestureRecognizerDelegate {
        // MARK: - IBOutlet
    @IBOutlet weak var OCSLogoImageView: UIImageView!
    @IBOutlet weak var placeHolderImageView: UIImageView!
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    @IBOutlet weak var tvSearchTextField: UITextField!
        // MARK: - Properties
    var searchViewModel: SearchSeriesViewModel = OCSSearchSeriesViewModel()
    var cancellable = CancelBag()
    var coordinator: MainCoordinator?
    // We keep track of the pending work item as a property
    private var pendingRequestWorkItem: DispatchWorkItem?
    private var searchThrusHold: Int = 500 // ms
    private var fadeAnimationDuration: Double = 2.0
    private var focusAnimationDuration: Double = 0.5
    private var currentSelectedItem: Int = 0

        // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: searchViewModel)
        initTextField()
        initseriesCollectionView()
        fadeInView(view: OCSLogoImageView)
        fadeInView(view: placeHolderImageView)
        assDismisssKeyboardTapGesture()
    }

        // MARK: - FilePrivate
    fileprivate func fadeInView(view: UIView) {
        view.alpha = 0.0
            // fade in
        UIView.animate(withDuration: fadeAnimationDuration, animations: {
            view.alpha = 1.0
        })
    }
    fileprivate func initTextField() {
        tvSearchTextField.placeholder = R.string.ocS.comOcsZakSearch()
    }
    
    func showPlaceHolderImage() {
        placeHolderImageView.isHidden = false
        seriesCollectionView.isHidden = true
    }

    fileprivate func searchSerie(_ searchInput: String) {
        if !searchInput.isEmpty {
            searchViewModel.getSeriesByName(name: searchInput)
        } else {
            showPlaceHolderImage()
        }
    }
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }

    fileprivate func initseriesCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 50
        layout.itemSize = CGSize(width: 550, height: 700)
        seriesCollectionView.setCollectionViewLayout(layout, animated: true)
        seriesCollectionView.registerCellNib(tvSerieCollectionViewCell.self)
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
    }

    fileprivate func assDismisssKeyboardTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyBoard))
        tap.delegate = self
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }

    @IBAction func doneAction(_ sender: Any) {
        searchSerie(tvSearchTextField.text ?? "")
    }
}
    // MARK: - SearchViewControllerExtensions

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        searchViewModel.series.count
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {

    }
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {

        if let previousIndexPath = context.previouslyFocusedIndexPath, let cell = collectionView.cellForItem(at: previousIndexPath) {
            UIView.animate(withDuration: focusAnimationDuration, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }

        if let indexPAth = context.nextFocusedIndexPath, let cell = collectionView.cellForItem(at: indexPAth) {
            currentSelectedItem = indexPAth.item
            UIView.animate(withDuration: focusAnimationDuration, animations: {
                cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: tvSerieCollectionViewCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "tvSerieCollectionViewCell",
                                 for: indexPath) as! tvSerieCollectionViewCell
        let serie = searchViewModel.series[indexPath.row]
        cell.configureCell(serie: serie)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let serie = searchViewModel.series[indexPath.row]
        self.coordinator?.showDetails(serie: serie)
    }

}
