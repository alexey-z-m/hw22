import Foundation

public class ChipStorage {
    private var storage: [Chip] = []
    private let condition = NSCondition()
    public var isAvailable = false
    private var count = 0
    public var isEmpty: Bool {
        return storage.isEmpty
    }
    public init() {}
    
    func addChip (_ chip: Chip) {
        condition.lock()
        storage.append(chip)
        count += 1
        print("\(count) добавлен \(chip.chipType) чип \(Date.getCurrenTime())" )
        isAvailable = true
        condition.unlock()
        condition.signal()
    }
    
    func getChip() -> Chip {
        while (!isAvailable) {
            condition.wait()
        }
        let chip = storage.removeLast()
        condition.signal()
        condition.unlock()
        if isEmpty {
            isAvailable = false
        }
        return chip
    }
}
