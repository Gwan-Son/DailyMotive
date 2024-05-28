//
//  QuoteWidgetBundle.swift
//  QuoteWidget
//
//  Created by 심관혁 on 5/27/24.
//

import WidgetKit
import SwiftUI

@main
struct QuoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        QuoteWidget()
        QuoteWidgetLiveActivity()
    }
}
