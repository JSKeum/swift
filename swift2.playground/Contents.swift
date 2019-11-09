
class Media {
    var name: String
    var director: String
    init(name: String, director: String) {
        self.name = name
        self.director = director
    }
}

class Movie: Media {
    var actor: String
    init(name: String, director: String, actor: String) {
        self.actor = actor
        super.init(name: name, director: director)
        
    }
}

class Book: Media {
    override init(name: String, director: String) {
        super.init(name: name, director: director)
    }
}

var library = [
    Movie(name: "봄날은 간다", director: "이정진", actor: "이정재"), Book(name: "사람아 아 사람아", director: "다이허우잉")
    ]

for media in library {
    if media is Book {
        print("책 제목 : \(media.name)")
    } else if media is Movie {
        print("영화 제목: \(media.name)")
    }
}

protocol types {
    var km: Double { get }
    var mm: Double { get }
    var m: Double { get }
}


extension Double: types {
    var km: Double { return self * 1_000 }
    var m: Double { return self }
    var mm: Double { return self / 1_000}
}
print(42.km + 195.m)

protocol Equal {
    func allEqual() -> Bool
    
}
extension Array: Equal where Element: Equatable {
    func allEqual() -> Bool {
        for value in self {
            if (value != self.first) {
                return false
            }
        }
        return true
    }
    
}
protocol StackProtocol {
    mutating func pop()
    //mutating func push()
}
struct Stack<Element> : StackProtocol {
    var items = [Element]()
    mutating func push(_ item: Element) {
        
    }
    mutating func pop() {
        
    }
    
}


struct PlayingCard
{
    var suit: Suit
    var rank: Rank
    
    enum Suit: String {
        
        case spades = "♠︎"
        case hearts = "❤️"
        case diamonds = "🔷"
        case clubs = "☘️"
        
        static var all = [Suit.spades, hearts, diamonds, clubs]
        
    }
    enum Rank {
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
            default: return 0
            }
        }
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
        
    }
    
}
print(PlayingCard.Rank.all)

