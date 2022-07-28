import Foundation

extension Date {
    public static func getCurrenTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let currentTime = dateFormatter.string(from: date)
        return currentTime
    }
}
