//
    //  ViewController.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

import UIKit

class SearchViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var OCSLogoImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var placeHolderImageView: UIImageView!
    @IBOutlet weak var seriesCollectionView: UICollectionView!

    var searchViewModel: SearchSeriesViewModel = OCSSearchSeriesViewModel()
    var cancellable = CancelBag()

    var coordinator: MainCoordinator?

    // We keep track of the pending work item as a property
    private var pendingRequestWorkItem: DispatchWorkItem?
    private var searchThrusHold: Int = 500 // ms
    private var fadeAnimationDuration: Double = 2.0

    fileprivate func fadeInView(view: UIView) {
        view.alpha = 0.0
            // fade in
        UIView.animate(withDuration: fadeAnimationDuration, animations: {
            view.alpha = 1.0
        })
    }
    fileprivate func initSearchBar() {
        searchBar.placeholder = R.string.ocS.comOcsZakSearch()
        searchBar.delegate = self
            // remove borders
        searchBar.searchBarStyle = .minimal
    }
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: searchViewModel)
        initSearchBar()
        fadeInView(view: OCSLogoImageView)
        fadeInView(view: placeHolderImageView)
        searchBar.delegate = self
        seriesCollectionView.registerCellNib(SerieCollectionViewCell.self)
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tap.delegate = self
            // shouldReceiveTouch on UITableViewCellContentView
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
            // Do any additional setup after loading the view.
    }

}
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchViewModel.series.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SerieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.serieCollectionViewCell,
                                                                               for: indexPath) as! SerieCollectionViewCell
        let serie = searchViewModel.series[indexPath.row]
        cell.configureCell(serie: serie)
        return cell
    }
}
extension SearchViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getFormattedSize(150), height: 200)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // Cancel the currently pending item
        pendingRequestWorkItem?.cancel()

            // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.searchSerie(searchText)
        }

            // Save the new work item and execute it after 500 ms
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500),
                                      execute: requestWorkItem)

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            //        searchSerie(searchBar.text)
        searchBar.resignFirstResponder()
    }
    fileprivate func showPlaceHolderImage() {
        placeHolderImageView.isHidden = false
        seriesCollectionView.isHidden = true
    }

    func searchSerie(_ searchInput: String) {
            //        guard let searchInput = searchInput else { return }
        if !searchInput.isEmpty {
            hideActivityIndicator()
            showActivityIndicator()
            searchViewModel.getSeriesByName(name: searchInput)
        } else {
            showPlaceHolderImage()
        }
    }
}

extension SearchViewController {

    fileprivate func showSearchResult() {
        placeHolderImageView.isHidden = true
        seriesCollectionView.isHidden = false
        seriesCollectionView.reloadData()
    }

    func bind(to viewModel: SearchSeriesViewModel) {
        viewModel.searchState.print("searchState").sink(receiveValue: { [self] (state) in
            hideActivityIndicator()
            switch state {
                case .error:
                    showPlaceHolderImage()
                    break
                case .finishedLoading:

                    if searchViewModel.series.isEmpty {
                        showPlaceHolderImage()
                    } else {
                        showSearchResult()
                    }

                    break
                case .idle:
                    break
            }
        })
            .store(in: &cancellable)
    }
}
