//
//  AppVersion.swift
//  DailyMotive
//
//  Created by 심관혁 on 5/9/24.
//

import Foundation

public class AppVersion {
    internal static func getAppVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
}
