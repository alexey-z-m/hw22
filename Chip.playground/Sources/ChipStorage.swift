import Foundation

public class ChipStorage {
    private var storage: [Chip] = []
    private let queue = DispatchQueue(label: "storage", qos: .utility, attributes: .concurrent)
    public init() {}
    
    func addChip (_ chip: Chip) {
        queue.async(flags: .barrier) {
            self.storage.append(chip)
            print("\(self.storage.count) \(chip.chipType) \(Date.getCurrenTime())" )
        }
    }
    
    func getChip() -> Chip {
        queue.sync {
            return storage.removeLast()
        }
    }
    
    func count() -> Int {
        return storage.count
    }
}
