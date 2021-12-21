//
//  PlayerViewModel.swift
//  OCS
//
//  Created by Zakaria on 1112/12/2021.
//

import Foundation

protocol VideoPlayerViewModel {
    var url: String { get set }
}

class PlayerViewModel: VideoPlayerViewModel {

    var url: String

    internal init(url: String) {
        self.url = url
    }
}
