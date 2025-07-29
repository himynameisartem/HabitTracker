//
//  Frequency.swift
//  HabitTracker
//
//  Created by Артем Кудрявцев on 25.06.2025.
//

import Foundation

enum Frequency: Equatable {
    case daily
    case weekly(days: [Weekday])
    case custom(daysInterval: Int)
}

//extension Frequency {
//    var intervalInDays: Int {
//        switch self {
//        case .daily:
//            return 1
//        case .weekly(let days):
//            guard days.count > 1 else { return 7 }
//            let sortedDays = days.sorted(by: { $0.rawValue < $1.rawValue })
//            var minInterval = 7
//            for i in 0..<sortedDays.count {
//                let current = sortedDays[i].rawValue
//                let next = sortedDays[(i + 1) % sortedDays.count].rawValue
//                let diff = (next > current) ? (next - current) : (7 - current + next)
//                if diff < minInterval {
//                    minInterval = diff
//                }
//            }
//            return minInterval
//        case .custom(let daysInterval):
//            return daysInterval
//        }
//    }
//}
