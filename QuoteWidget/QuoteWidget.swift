//
//  QuoteWidget.swift
//  QuoteWidget
//
//  Created by 심관혁 on 5/27/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    
    let likesQuoteManger = LikesQuoteManager.shared
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), quotes: Quotes(author: "인물", quote: "명언", category: 0))
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), quotes: Quotes(author: "인물", quote: "명언", category: 0))
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let likeQuotes = LikesQuoteManager.shared.loadLikesQuote()
        
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let randomQuote = likeQuotes.randomElement() ?? Quotes(author: "인물", quote: "명언", category: 0)
            let entry = SimpleEntry(date: entryDate, quotes: randomQuote)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
    
    
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let quotes: Quotes
}

struct QuoteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            
            Text(entry.quotes.quote)
                .font(.body)
                .bold()
                .minimumScaleFactor(0.5)
                .lineLimit(nil)
                .padding(.bottom, 5)
            
            Text(entry.quotes.author)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
        }
        .padding()
    }
}

struct QuoteWidget: Widget {
    let kind: String = "QuoteWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            QuoteWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium,.systemLarge])
    }
}


#Preview(as: .systemSmall) {
    QuoteWidget()
} timeline: {
    SimpleEntry(date: .now, quotes: Quotes.list[0])
    SimpleEntry(date: .now, quotes: Quotes.list[1])
}
