//
//  Font.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation

protocol FontsName {
    var sfProDisplayRegular: String {get}
    var sfProTextBoldFontName: String {get}
}

struct OCSFonts: FontsName {

    var sfProDisplayRegular = R.font.sfProDisplayRegular.fontName
    var sfProTextBoldFontName = R.font.sfProTextBold.fontName

}
