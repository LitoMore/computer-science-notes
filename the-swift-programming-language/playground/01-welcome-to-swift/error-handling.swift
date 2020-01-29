// Adopt the `Error` protocol
enum PrinterError: Error {
  case outOfPaper
  case noToner
  case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
  if printerName == "Never Has Toner" {
    throw PrinterError.onFire
  }
  return "Job sent"
}
do {
  let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
  print(printerResponse)
} catch PrinterError.onFire {
  print("I'll git add, commit and push my code.")
} catch {
  print(error)
}

// Use `try?` to convert the result to an optional
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthalter")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// Defer
var fridgeIsOpen = false
var fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
  fridgeIsOpen = true
  defer {
    fridgeIsOpen = false
  }
  print(fridgeIsOpen)

  let result = fridgeContent.contains(food)
  return result
}
print(fridgeContains("banana"))
print(fridgeIsOpen)
