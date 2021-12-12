//
//  Details.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation

class Details: DomainModel, Codable {

    let title: String?
    let id: String?
    let isbookmarkable: Bool?
    let detaillink: String?
    let pitch: String?

    internal init(title: String?, id: String?, isbookmarkable: Bool?, detaillink: String?, pitch: String?) {
        self.title = title
        self.id = id
        self.isbookmarkable = isbookmarkable
        self.detaillink = detaillink
        self.pitch = pitch
    }
}
