import Foundation

let storage = ChipStorage()
let work = Work(storage: storage)
let gen = Generate(storage: storage)
gen.start()
work.start()
