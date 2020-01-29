// Enum
enum Rank: Int {
  case ace = 1
  case two, three, four
  case jack

  func simpleDescription() -> String {
    switch self {
      case .ace:
        return "acer"
      case .jack:
        return "jacker"
      default:
        return String(self.rawValue)
    }
  }
}
print(Rank.ace)
print(Rank.ace.rawValue)
print(Rank.ace.simpleDescription())

// Use initializer
if let convertedRank = Rank(rawValue: 5) {
  print(convertedRank.simpleDescription())
}
