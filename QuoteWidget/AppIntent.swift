//
//  AppIntent.swift
//  QuoteWidget
//
//  Created by 심관혁 on 5/29/24.
//

import WidgetKit
import AppIntents


struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
//    @Parameter(title: "BackgroundColor", default: "😃")
//    var favoriteEmoji: String
    
}
