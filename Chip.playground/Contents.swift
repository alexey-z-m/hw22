import Foundation

let storage = ChipStorage()
let gen = Generate(storage: storage)
let work = Work(storage: storage)
gen.makeChip()
work.start()
