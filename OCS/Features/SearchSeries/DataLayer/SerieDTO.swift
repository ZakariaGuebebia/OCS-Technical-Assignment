//
//  SerieDTO.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//
import Foundation

import Foundation

// MARK: - SerieDTO
class SerieDTO: DataModel, Codable {

    let title: [Title]?
    let subtitle: String?
    let subtitlefocus: [String]?
    let highlefticon, highrighticon, lowrightinfo, imageurl: String?
    let fullscreenimageurl, id, detaillink, duration: String?
    let playinfoid: Playinfoid?

    init(title: [Title]?, subtitle: String?, subtitlefocus: [String]?, highlefticon: String?, highrighticon: String?, lowrightinfo: String?, imageurl: String?, fullscreenimageurl: String?, id: String?, detaillink: String?, duration: String?, playinfoid: Playinfoid?) {
        self.title = title
        self.subtitle = subtitle
        self.subtitlefocus = subtitlefocus
        self.highlefticon = highlefticon
        self.highrighticon = highrighticon
        self.lowrightinfo = lowrightinfo
        self.imageurl = imageurl
        self.fullscreenimageurl = fullscreenimageurl
        self.id = id
        self.detaillink = detaillink
        self.duration = duration
        self.playinfoid = playinfoid
    }

    override func toDomain() -> Serie? {
        // Map Data to Domain
        return Serie(title: title?.first?.value, subtitle: subtitle, imageurl: imageurl, fullscreenimageurl: fullscreenimageurl, id: id, detaillink: detaillink)
    }
}
