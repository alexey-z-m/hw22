import Foundation

public class Generate: Thread {
    private var timer = Timer()
    private var storage: ChipStorage
    private var time = 5.0
    private var interval = 1.0
    
    public init(storage: ChipStorage) {
        self.storage = storage
    }
    
    public func makeChip() {
        timer = Timer(timeInterval: interval, repeats: true, block: { [unowned self] _ in
            storage.addChip(Chip.make())
            time -= interval
            if time <= 0 {
                timer.invalidate()
            }
        })
        RunLoop.current.add(timer, forMode: .common)
        RunLoop.current.run(until: Date.now.addingTimeInterval(time))
    }
}


