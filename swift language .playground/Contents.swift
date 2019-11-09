//////: # enum에 대하여
////
////enum foods{
////    case hamburger(patties: Int)
////    case fries(salt: Bool)
////    case pasta
////}
////
////var order1: foods = .hamburger(patties: 3)
////print(order1)
////var order2 = foods.fries(salt: true)
////print(order2)
//////var order3 = foods()
////
////func orderCheck(_ order: foods) {
////    switch order {
////    case .hamburger: print("햄버거 주문이네요")
////        break
////    case .fries(let salt):
////        switch salt {
////        case false: print ("소금 안 뿌린 튀김 주문이네요")
////        default: print ("소금 뿌린 튀김 주문이네요")
////        }
////
////    default: print("뭘 시킨거죠. 메뉴를 아직 안정했나요?")
////    }
////}
////
////orderCheck(order1)
////orderCheck(order2)
//////orderCheck(order3)
////
////enum Fastfoods{
////    case hamburger(patties: Int)
////    case fries(salt: Bool)
////    case drink(String, ounces: Int)
////    case cookie
////
////    func isIncludedSpecialOrder(number: Int) -> Bool {
////        switch self {
////        case .hamburger(let pattyCount): return pattyCount == number
////        case .fries, .cookie: return true
////        case .drink(_, let ounces): return ounces == 16
////        }
////    }
////}
////let newOrder = Fastfoods.hamburger(patties: 4)
////print(newOrder.isIncludedSpecialOrder(number: 4))
////
////let newOrder2 = Fastfoods.fries(salt: true)
////print(newOrder2.isIncludedSpecialOrder(number: 1))
////print(newOrder2)
//////: protocol에 대하여
////
////protocol Moveable {
////    mutating func carMove(to point: Int)
////}
////
////class Car : Moveable {
////    func carMove(to point: Int) {
////
////    }
////}
////
////
////class Shape : Moveable {
////    func carMove(to point: Int) {
////
////    }
////}
////
////let car = Car()
////
////var arr = [1, 2, 3]
////print(arr.count)
////
////
////struct Test {
////    var name: String;
////    mutating func nomePlus() {
////        name = name + "님"
////    }
////}
////
////var test = Test(name: "진섭 금")
////print(test)
////test.nomePlus()
////print(test)
////
////extension Test {
////    var DuName: String {
////        return name + name
////    }
////}
////print(test.DuName)
////
////func greet(person: [ String: String ]) {
////    guard let name = person["name"] else {
////        print("Hello guy")
////        return
////    }
////
////    print("Hello, \(name)")
////}
////
////greet(person: ["firstname": "Bob"])
////
////func chooseOneFunction(condition: Bool) -> (String) -> String {
////    func function1(input: String) -> String {
////        return input + "\t 좋아요"
////    }
////    func function2(input: String) -> String {
////        return input + "\t 싫어요"
////    }
////
////    return condition ? function1 : function2
////}
////
////let Ilike = "닭고기 카레라이스"
////let makeSentence = chooseOneFunction(condition: Ilike.contains("쇠"))
////var nopoe = makeSentence(Ilike)
////print(nopoe)
////
//var operation: (Double) -> Double
//operation = { -$0 }
//print(operation(10))
//
var primes = [2.0, 3.0, 5.0, 7.0, 11.0]
let negativePrimes = primes.map {-$0}

let doublePrimes = primes.map({$0 * 2})
print(negativePrimes, doublePrimes)
////
//////var cards = [3, 4, 5]
//////for index in cards.indices {
//////                print(index)
//////                }
//////var filteredCards = cards.indices.filter { cards[$0] > 2 }
//////print(filteredCards)
//////print(filteredCards.first)
////
////    //// remove에 대하여
////var removed = primes.remove(at: primes.count-1 )
////print(removed)
////print(primes)
////
////struct A {
////    var va: Int
//////    var vava = [String]()
////
////    mutating func changing(_ param: Int) {
////        va = param
////    }
////}
////
//////let a1 = A(va: 3)
////var a2 = A(va: 5)
////
//////a1.changing(7) = 9
////a2.va = 9
////
////struct B {
////    var name: String
////    var vava = [String]()
////
////    init(_ name: String) {
////        self.name = name
////    }
////
////
////    mutating func change(param: String) {
////        vava.append(param)
////    }
////}
////
////let class1 = B("Jinsup")
////let class2 = class1
////var class3 = class2
////
////class3.name = "Bob"
////print(class1.name, class2.name, class3.name)
//////
//////  Card.swift
//////  Concentration
//////
//////  Created by JSKeum on 03/10/2019.
//////  Copyright © 2019 JSKeum. All rights reserved.
//////
////
////import Foundation
////
////struct Card : Hashable
////    // hashable 질문.. 어찌합니까 ...
////{
////    //    var hashValue: Int { return identifier }
////    //    func hash(into hasher: inout Hasher) {
////    //        var hashValue: Int { return identifier }
////    //
////    //    static func ==(lhs: Card, rhs: Card) -> Bool {
////    //        return lhs.identifier == rhs.identifer
////    //    }
////
////    var isFaceUp = false
////    var isMatched = false
////    var identifier: Int
////
////    private static var identifierFactory = 0
////
////    private static func getUniqueIdentifier() -> Int{
////        identifierFactory += 1
////        return identifierFactory
////    }
////
////    init() {
////        self.identifier = Card.getUniqueIdentifier()
////    }
////
////}
////
////let card1 = Card()
////let card2 = Card()
////let card3 = card1
////let card4 = card2
////
////print(card1.identifier, card2.identifier, card3.identifier, card4.identifier)
////var array = [Card: String]()
////for _ in 0...4 {
////    array[card1] = "123"
////    array[card2] = "123"
////    array[card3] = "123"
////    array[card4] = "123"
////}
////
////print(array)
////
//
//class Class {
//    var name: String
//
//    init(name na: String) {
//        self.name = na
//    }
//
//    func print() -> String {
//        return "나는 \(self.name) 입니다."
//    }
//}
//
//class SubClass : Class {
//
//    var notation: String
//
//    init(name na: String, notation no: String) {
//        self.notation = no
//        super.init(name: na)
//    }
//
//    override func print() -> String {
//        return super.print() + " 직업은 \(notation)입니다"
//    }
//}
//
////extension SubClass {
////    convenience init(
////}
//
//let newClass = SubClass(name: "금진섭", notation: "학생")
//print(newClass.print())
//
//protocol toggle {
//    mutating func toggle()
//}
//
//extension toggle {
//
//}
//
//enum onOffSwitch {
//    case on, off
////    mutating func toggle() {
////        switch self {
////        case .on : self = .off
////        case .off : self = .on
////        }
////    }
//}
//
//extension onOffSwitch : toggle {
//    mutating func toggle() {
//        switch self {
//        case .on : self = .off
//        case .off : self = .on
//        }
//    }
//
//}
//
//var switc = onOffSwitch.on
//switc.toggle()
//
//protocol Init {
//    init(name: String, notation: String)
////    var hello: String { get }
//}
//
////extension init {
////    var hello = "Hello"
////}
//
//struct Student: Init {
//    var name: String
//    var notation: String
//
//    init(name na: String, notation no: String) {
//        name = na
//        notation = no
//    }
//}
//
//class Person2 {
//    var name: String
//    var notation: String
//
//    // 메모리에 떠다닌지 않도록 약하게 만든다!!
//    var friend: Person2?
//
//
//
//    init(name na: String, notation no: String) {
//        self.name = na
//        self.notation = no
//    }
//
//    // deinit은 reference count가 0이 될 때 실행되는 녀석
//    deinit {
//        print("reference count가 0이 되었습니다")
//    }
//}
//
//var new1: Person2? = Person2(name: "진섲", notation: "대학생")
////new1 = nil
//var friend = new1?.friend
//print(friend ?? "friend의 값은 닐이다")
//new1 = nil



struct Card : Hashable
    // hashable 질문..
{
//    var hashValue: Int { return identifier }
//    func hash(into hasher: inout Hasher) {
//        var hashValue: Int { return identifier }
//
//    static func ==(lhs: Card, rhs: Card) -> Bool {
//        return lhs.identifier == rhs.identifer
//    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int = 0
    
    private static var identifierFactory = 0
    private var identifierFactory2 = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    mutating func getUniqueIdentifier2() -> Int {
        identifierFactory2 += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

var card = Card()
Card.getUniqueIdentifier()

var duo: Card = Card();
duo.getUniqueIdentifier2()
var duo2: Card = Card();
duo2.getUniqueIdentifier2()
var duo3: Card = Card();
duo3.getUniqueIdentifier2()
print(duo, duo2, duo3)

typealias smallNumber = UInt16
var number = UInt.max
print(type(of: number))

let httpError = (404, "Nout Found")
let (errorNumber, _) = httpError
print(errorNumber)

let firstnumber = "123"
//assert(Int(firstnumber)! < 100, "firstnumber가 100보다 크군요")
let secondnumber = "234"
if let firstnumber = Int(firstnumber), let secondnumber = Int(secondnumber), secondnumber > firstnumber {
    print("\(firstnumber) < \(secondnumber)")
}

let names = ["하하", "노홍철", "유재석" ,"길"]
for name in names[2...] {
    print(name)
}

names.contains("하하")

let greeting = "Bonjour, Hello"
var first = greeting.firstIndex(of: ",") ?? greeting.endIndex
var firstGreeting = greeting[..<first]
print(firstGreeting)
let courses = [
    "Act 1 : dfsfsfsfsfss",
    "Act 1 : asdadasdad",
    "Act 1 : ggg"
   
]
var act1Count = 0
for course in courses {
    if course.hasPrefix("Act 1") {
    act1Count += 1
    }
}
print(act1Count)


let dic: [Int:String] = [1 : "first", 2 : "second", 3 : "third"]
print(dic)
var dicKeys = [Int](dic.keys).sorted()

print(dicKeys)


var board = [Int](repeating: 1, count: 5)
print(board)

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[0..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let ggg = minMax(array : [1, 2, 3, 4, 5, 100]) {
print(ggg)
}
if let (_, ago) = minMax(array : [1, 2, 3, 4, 5, 100]) {
print(ago)
}

func arithmaticMean(_ numbers:Double...) -> Double {
    var total: Double = 0
    for num in numbers {
        total += num
    }
    return total / Double(numbers.count)
}

arithmaticMean(1, 234, 10, 3204, 280, 502)


func step(current: Bool) -> (Int) -> Int {
    func forwardStep(input: Int) -> Int { return input + 1 }
    func backwardStep(input: Int) -> Int { return input - 1 }
    return current ? backwardStep : forwardStep
}

var currentValue = 5
let toZero = step(current: currentValue > 0)
while currentValue != -2  {
    print(currentValue)
    currentValue = toZero(currentValue)
}
var titles = ["asd", "sdf", "qwe"]
let sortedName = names.sorted { $1 > $0 }
print(sortedName)

enum Compass: CaseIterable {
    case west, east, north, south
}

var orientation = Compass.west
orientation = .south

switch orientation {
case .west : print("방향이 west")
case .east : print("방향이 east")
    case .north : print("방향이 north")
default: print("방향 없음")
}
print(Compass.allCases)
for compass in Compass.allCases {
    print(compass)
}

enum Barcode {
    case urc(Int, Int, Int, Int)
    case qrCode(String)
}

var product = Barcode.urc(123,34,4536,12)
product = .qrCode("asdqweasd")
//print(product)

switch product {
case let .urc(num1, num2, num3, num4)
    : print("urc : \(num1), \(num2), \(num3), \(num4)")
case let .qrCode(qrcode)
    : print("QRCode : \(qrcode)")
}

enum Planet: Int {
    case mercury = 0, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var rr = Planet(rawValue: 10)

if let planet = rr {
    print(planet)
} else {
    print("out of range")
}

enum CompassPoint {
    case west, east, south, north
    
    mutating func turnNorth() {
        self = .north
    }
}

var cc = CompassPoint.east
cc.turnNorth()
print(cc)


struct Taa {
    var name = "금진섭" {
        didSet {
        print("Intro가 시작되었습니다")
    }
    }
    var job = "대학생"
    var intro: String {
        get { return name + job }
    }
    
}
var Keum = Taa()

Keum.intro

protocol triState {
//    var off : String { get }
//    var law : String { get }
//    var high : String{ get }
    mutating func next()
}

enum triStateSwitch : triState {
    case off, low, high
    
    mutating func next() {
        switch self {
        case .off :
            self = .low
        case .low :
            self = .high
        case .high :
            self = .off
        }
    }
}
var State = triStateSwitch.off
State.next()

class Vehicle {
    var currentSpeed = 0.0
    var message: String {
        return "당신의 현재 속도는 \(currentSpeed) 입니다"
    }
    func makeNoise() {
        
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

var bycycle = Bicycle()
bycycle.hasBasket = true
bycycle.currentSpeed = 20

class Tandem: Bicycle {
    final var currentNumberOfPassengers = 0
    
    override func makeNoise() {
        print("부릉부릉부우릉")
    }
}
var tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 10
tandem.currentNumberOfPassengers = 2
tandem.makeNoise()

class Car: Vehicle {
    var gear = 1
    
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
    
    override var message: String {
        return super.message + " 나는 자동차"
    }
}
var car = Car()
car.currentSpeed = 50
print(car.gear)

struct Celsius {
    var temperatureInCeslsius: Double
    
    init(fromFar: Double) {
        self.temperatureInCeslsius = (fromFar - 32.0) * 1.8
    }
    init(fromKelvin: Double) {
        self.temperatureInCeslsius = fromKelvin - 273.15    }
}
var tem = Celsius(fromFar: 100)

struct Survey {
    var text: String
    var reply: String?
    init(text: String) {
        self.text = text
    }
    func ask() -> String{
        return self.text
    }
}
var survey = Survey(text: "1번 질문입니다")
survey.ask()

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}
class Rect {
    var origin: Point
    var size: Size
    init() {
        origin = Point()
        size = Size()
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    convenience init?(center: Point, size: Size) {
        if center.x < 0 || size.width < 0 { return nil }
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

var rect1 = Rect()
print(rect1.origin)
var point2 = Point(x: 30, y: 50)
var size2 = Size(width: 15, height: 20)
var rect2 = Rect(center: point2, size: size2 )
if let rect = rect2 {
print(rect.origin.x)
}

    ////  enum을 활용한 error 처리
//enum VendingMachineError: Error {
//    case invalidSelection
//    case outOfStock
//    case insufficientFunds(coinsNeeded: Int)
//}
//
//struct Item {
//    var price: Int
//    var count: Int
//}
//
//struct VendingMachine {
//    var inventory = [
//        "Juice" : Item(price: 100, count: 10),
//        "Cookie" : Item(price: 50, count: 5),
//        "Icecream" : Item(price: 60, count: 8)
//    ]
//
//    var coins = 0
//
//    mutating func vend(Item name: String) throws {
//        guard let item = inventory[name] else {
//            throw VendingMachineError.invalidSelection
//        }
//        guard item.count > 0 else {
//            throw VendingMachineError.outOfStock
//        }
//        guard coins >= item.price else {
//            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price)
//        }
//
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//    }
//}
    ////


