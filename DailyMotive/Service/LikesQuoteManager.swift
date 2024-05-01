//
//  LikesQuoteManager.swift
//  DailyMotive
//
//  Created by 심관혁 on 4/30/24.
//

import Foundation

class LikesQuoteManager {
    static let shared = LikesQuoteManager()
    private let fileManager = FileManager.default
    private var documentDirectoryURL: URL {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    private var likesQuoteFolderURL: URL {
        return documentDirectoryURL.appendingPathComponent("LikesQuoteFolder")
    }
    private var likesQuoteFileURL: URL {
        return likesQuoteFolderURL.appendingPathComponent("LikesQuote.json")
    }
    private init() {
        createLikesQuoteFolderIfNeeded()
    }
    
    private func createLikesQuoteFolderIfNeeded() {
        do {
            if !fileManager.fileExists(atPath: likesQuoteFolderURL.path) {
                try fileManager.createDirectory(at: likesQuoteFolderURL, withIntermediateDirectories: true, attributes: nil)
            }
        } catch {
            print("Failed to create LikesQuoteFolder: \(error.localizedDescription)")
        }
    }
    
    func saveLikesQuote(_ quotes: [Quotes]) {
        do {
            let data = try JSONEncoder().encode(quotes)
            try data.write(to: likesQuoteFileURL)
        } catch {
            print("Failed save LikesQuoteList: \(error.localizedDescription)")
        }
    }
    
    func loadLikesQuote() -> [Quotes] {
        do {
            let data = try Data(contentsOf: likesQuoteFileURL)
            let likesQuoteList = try JSONDecoder().decode([Quotes].self, from: data)
            print("Loading Data: \(likesQuoteList)")
            return likesQuoteList
        } catch {
            print("Failed load LikesQuoteList: \(error.localizedDescription)")
            return []
        }
    }
}
