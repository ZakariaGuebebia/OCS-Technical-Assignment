//
    //  SearchSeriesViewModel.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

import Foundation
import Combine

typealias StateHandler = ((Subscribers.Completion<Error>) -> Void)
typealias CancelBag = Set<AnyCancellable>

enum ViewModelState {
    case idle
    case finishedLoading
    case error(OCSError)
}

protocol SearchSeriesViewModel {

    var cancellable: CancelBag { get set }
    var searchState: PassthroughSubject<ViewModelState, Never> { get set }
    var searchSeriesUseCase: SearchSeriesUseCase { get set }
    var series: [Serie] { get set }
    func getSeriesByName(name: String)

}

final class OCSSearchSeriesViewModel: SearchSeriesViewModel {
    
    init(cancellable: CancelBag = CancelBag(), searchState: PassthroughSubject<ViewModelState, Never> = PassthroughSubject<ViewModelState, Never>(), searchSeriesUseCase: SearchSeriesUseCase = OCSSearchSeriesUseCase(repository: OCSSearchSeriesRepository(remoteDataSource: RemoteSearchSeriesDataSource())), series: [Serie] = []) {
        self.cancellable = cancellable
        self.searchState = searchState
        self.searchSeriesUseCase = searchSeriesUseCase
        self.series = series
    }

    var cancellable = CancelBag()
    var searchState = PassthroughSubject<ViewModelState, Never>()
    var searchSeriesUseCase: SearchSeriesUseCase = OCSSearchSeriesUseCase(repository: OCSSearchSeriesRepository(remoteDataSource: RemoteSearchSeriesDataSource()))
    var series: [Serie] = []
    func getSeriesByName(name: String) {
        let stateHandler: StateHandler = {result in
            
            switch result {
            case .finished:
                self.searchState.send(.finishedLoading)
                break
            case .failure(let error):
                    self.searchState.send(.error(OCSError(message: error.localizedDescription, code: 0)))
                break
            }
            
        }
        
        let receiveValue: ([SerieDTO], [Serie]) -> Void = { (_, series) in
            self.series = series
        }

        searchSeriesUseCase.getSeriesByName(name: name).sink(receiveCompletion: stateHandler, receiveValue: receiveValue).store(in: &cancellable)

    }
}
