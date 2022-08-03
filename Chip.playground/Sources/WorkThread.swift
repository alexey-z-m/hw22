import Foundation

public class Work: Thread {
    private var storage: ChipStorage
    
    public init(storage: ChipStorage) {
        self.storage = storage
    }
    
    public override func main() {
        repeat {
            let chip = storage.getChip()
            chip.sodering()
            print(" Чип \(chip.chipType) припаян \(Date.getCurrenTime()) ")
        } while storage.isEmpty || storage.isAvailable
    }
}
