//
//  QuotesWidget.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/27/24.
//

import WidgetKit
import SwiftUI

struct QuotesWidget: Identifiable, Decodable {
    var id: String {
        return quote
    }
    let quote: String
    let author: String
}
