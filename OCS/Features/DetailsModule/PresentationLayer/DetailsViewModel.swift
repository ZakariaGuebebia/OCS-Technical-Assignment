//
//  DetailsViewModel.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Combine

protocol DetailsViewModel {

    var cancellable: CancelBag { get set }
    var detailsState: PassthroughSubject<ViewModelState, Never> { get set }
    var fetchDetailsUseCase: DetailsUseCase { get set }
    var details: Details? {get set}
    var serie: Serie? {get}
    func showDetails()
}

final class OCSDetailsViewModel: DetailsViewModel {
    
    internal init(serie: Serie?) {
        self.serie = serie
    }

    var cancellable = CancelBag()
    var detailsState = PassthroughSubject<ViewModelState, Never>()
    var fetchDetailsUseCase: DetailsUseCase = OCSDetailsUseCase(repository: OCSDetailsRepository(remoteDataSource: RemoteDetailsDataSource()))
    var detailLink: String?
    var details: Details?
    var serie: Serie?
    
    func showDetails() {
        let stateHandler: StateHandler = {result in

            switch result {
                case .finished:
                    self.detailsState.send(.finishedLoading)
                    break
                case .failure(let error):
                    self.detailsState.send(.error(OCSError(message: error.localizedDescription, code: 0)))
                    break
            }
            
        }
        
        let receiveValue: (DetailsDTO, Details) -> Void = { (_, details) in
            self.details = details
        }
        guard let detailLink = serie?.detaillink else { return }
        fetchDetailsUseCase.fetchDetails(detailLink: detailLink).sink(receiveCompletion: stateHandler, receiveValue: receiveValue).store(in: &cancellable)
        
    }
}
