import Foundation

public class Work: Thread {
    private var storage: ChipStorage
    
    public init(storage: ChipStorage) {
        self.storage = storage
    }
    
    public override func start() {
        repeat {
            print("Start soldering at \(Date.getCurrenTime())")
            let chip = storage.getChip()
            chip.sodering()
            print("--\(chip.chipType) chip soldered \(Date.getCurrenTime()) ")
        } while storage.count() != 0
        
        print("\nall chips are soldered")
    }
    
}
