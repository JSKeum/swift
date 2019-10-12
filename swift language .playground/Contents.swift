//: # enum에 대하여

enum foods{
    case hamburger(patties: Int)
    case fries(salt: Bool)
    case pasta
}

var order1: foods = .hamburger(patties: 3)
print(order1)
var order2 = foods.fries(salt: true)
print(order2)
//var order3 = foods()

func orderCheck(_ order: foods) {
    switch order {
    case .hamburger: print("햄버거 주문이네요")
        break
    case .fries(let salt):
        switch salt {
        case false: print ("소금 안 뿌린 튀김 주문이네요")
        default: print ("소금 뿌린 튀김 주문이네요")
        }
        
    default: print("뭘 시킨거죠. 메뉴를 아직 안정했나요?")
    }
}

orderCheck(order1)
orderCheck(order2)
//orderCheck(order3)

enum Fastfoods{
    case hamburger(patties: Int)
    case fries(salt: Bool)
    case drink(String, ounces: Int)
    case cookie
    
    func isIncludedSpecialOrder(number: Int) -> Bool {
        switch self {
        case .hamburger(let pattyCount): return pattyCount == number
        case .fries, .cookie: return true
        case .drink(_, let ounces): return ounces == 16
        }
    }
}
let newOrder = Fastfoods.hamburger(patties: 4)
print(newOrder.isIncludedSpecialOrder(number: 4))

let newOrder2 = Fastfoods.fries(salt: true)
print(newOrder2.isIncludedSpecialOrder(number: 1))
print(newOrder2)
//: protocol에 대하여

protocol Moveable {
    mutating func carMove(to point: Int)
}

class Car : Moveable {
    func carMove(to point: Int) {
        
    }
}


class Shape : Moveable {
    func carMove(to point: Int) {
        
    }
}

let car = Car()

var arr = [1, 2, 3]
print(arr.count)


struct Test {
    var name: String;
    mutating func nomePlus() {
        name = name + "님"
    }
}

var test = Test(name: "진섭 금")
print(test)
test.nomePlus()
print(test)

extension Test {
    var DuName: String {
        return name + name
    }
}
print(test.DuName)

func greet(person: [ String: String ]) {
    guard let name = person["name"] else {
        print("Hello guy")
        return
    }
    
    print("Hello, \(name)")
}

greet(person: ["firstname": "Bob"])

func chooseOneFunction(condition: Bool) -> (String) -> String {
    func function1(input: String) -> String {
        return input + "\t 좋아요"
    }
    func function2(input: String) -> String {
        return input + "\t 싫어요"
    }
    
    return condition ? function1 : function2
}

let Ilike = "닭고기 카레라이스"
let makeSentence = chooseOneFunction(condition: Ilike.contains("쇠"))
var nopoe = makeSentence(Ilike)
print(nopoe)

var operation: (Double) -> Double
operation = { -$0}
print(operation(10))

let primes = [2.0, 3.0, 5.0, 7.0, 11.0]
let negativePrimes = primes.map({-$0})
let doublePrimes = primes.map({$0 * 2})
print(negativePrimes, doublePrimes)

//var cards = [3, 4, 5]
//for index in cards.indices {
//                print(index)
//                }
//var filteredCards = cards.indices.filter { cards[$0] > 2 }
//print(filteredCards)
//print(filteredCards.first)
