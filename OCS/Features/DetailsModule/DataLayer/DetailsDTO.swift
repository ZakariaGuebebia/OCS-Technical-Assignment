//
//  DetailsDTO.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//
import Foundation

    // MARK: - DetailDTO
class DetailsDTO: DataModel, Codable {

    let title: [Title]?
    let id: String?
    let isbookmarkable: Bool?
    let detaillink: String?
    let seasons: [Season]?
    let pitch: String?

    init(title: [Title]?, id: String?, isbookmarkable: Bool?, detaillink: String?, seasons: [Season]?, pitch: String?) {
        self.title = title
        self.id = id
        self.isbookmarkable = isbookmarkable
        self.detaillink = detaillink
        self.seasons = seasons
        self.pitch = pitch
    }

    override func toDomain() -> Details? {
        // Map Data to Domain
        return Details(title: title?.first?.value, id: id, isbookmarkable: isbookmarkable, detaillink: detaillink, pitch: pitch ?? seasons?.first?.pitch)
    }
}

// MARK: - Season
class Season: Codable {
    let subtitle: String?
    let number: Int?
    let id, pitch, imageurl: String?
    let isbookmarkable: Bool?

    init(subtitle: String?, number: Int?, id: String?, pitch: String?, imageurl: String?, isbookmarkable: Bool?) {
        self.subtitle = subtitle
        self.number = number
        self.id = id
        self.pitch = pitch
        self.imageurl = imageurl
        self.isbookmarkable = isbookmarkable
    }
}
