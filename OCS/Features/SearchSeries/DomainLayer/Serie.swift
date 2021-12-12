//
    //  Serie.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

import Foundation

    // MARK: - Playinfoid
class Serie: DomainModel, Codable {

    let title: String?
    let subtitle: String?
    let imageurl: String?
    let fullscreenimageurl, id, detaillink: String?

    init(title: String?, subtitle: String?, imageurl: String?, fullscreenimageurl: String?, id: String?, detaillink: String?) {
        self.title = title
        self.subtitle = subtitle
        self.imageurl = imageurl
        self.fullscreenimageurl = fullscreenimageurl
        self.id = id
        self.detaillink = detaillink
    }

}
    // MARK: - Playinfoid
class Playinfoid: DomainModel, Codable {
    let hd, sd, uhd: String?

    init(hd: String?, sd: String?, uhd: String?) {
        self.hd = hd
        self.sd = sd
        self.uhd =  uhd
    }
}

    // MARK: - Title
class Title: DomainModel, Codable {

    let color, type, value: String?

    init(color: String?, type: String?, value: String?) {
        self.color = color
        self.type = type
        self.value = value
    }
}
