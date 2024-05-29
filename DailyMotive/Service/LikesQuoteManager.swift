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
    private let appGroupIdentifier = "group.kr.gwanson.DailyMotive" // 앱 그룹 식별자
    
    private var sharedContainerURL: URL {
        return fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier)!
    }
    
//    private var documentDirectoryURL: URL {
//        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//    }
    private var likesQuoteFolderURL: URL {
        return sharedContainerURL.appendingPathComponent("LikesQuoteFolder")
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
                print("LikesQuoteFolder created at path: \(likesQuoteFolderURL.path)")
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
            print("Loading quotes from file: \(likesQuoteFileURL.path)")
            if fileManager.fileExists(atPath: likesQuoteFileURL.path) {
                let data = try Data(contentsOf: likesQuoteFileURL)
                let likesQuoteList = try JSONDecoder().decode([Quotes].self, from: data)
                print("Quotes loaded successfully.")
                return likesQuoteList
            } else {
                print("File does not exist at path: \(likesQuoteFileURL.path)")
                return []
            }
//            let data = try Data(contentsOf: likesQuoteFileURL)
//            let likesQuoteList = try JSONDecoder().decode([Quotes].self, from: data)
//            return likesQuoteList
        } catch {
            print("Failed load LikesQuoteList: \(error.localizedDescription)")
            return []
        }
    }
}
