enum foods{
    case hamburger(patties: Int)
    case fries(salt: Bool)
    case pasta
}

var order1: foods = .hamburger(patties: 3)
print(order1)
var order2 = foods.fries(salt: true)
print(order2)
//var order3 : foods?


func orderCheck(_ order: foods) {
    switch order {
    case .hamburger: print("햄버거 주문이네요")
        break
    case .fries: print ("튀김 주문이네요")
    default: print("뭘 시킨거죠. 메뉴를 아직 안정했나요?")
    }
}

orderCheck(order1)
orderCheck(order2)
//orderCheck(order3)
