//
//  SearchViewControllerExtensions.swift
//  OCS
//
//  Created by Zakaria on 21/12/2021.
//

import Foundation
import Combine

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
