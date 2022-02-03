import Foundation
//deinit. it used in class only not in struct because it is Value type and class is refrance type
class DeInit {
    
    var friend: DeInit? //Strong refrance. refrance will not be nil when object get nil
    
    init() {
        print("DeInit Get Initialized")
    }
    
    deinit {
        print("DeInit Get Deinitialized")
    }
    
}

var deInit: DeInit? = DeInit() //refrance count = 1
var deInit1 = deInit //because class is refrance type deInit refrance allocate to deInit1 and refrance count = 2
deInit?.friend = deInit1 // refrance count = 3 beacuse deInit Friend property get Refrance of deInit1
deInit?.friend = nil //refrance count = 2
deInit = nil //DeInt class deinit not called because till it have refrance count = 1 after deInit = nil
deInit1 = nil //DeInt class deinit will call because refrance count = 0

class WeakKeyword {
    
    weak var friend: WeakKeyword? //Weak refrance. refrance will be nil when object get nil
    
    init() {
        print("WeakKeyword Get Initialized")
    }
    
    deinit {
        print("WeakKeyword Get Deinitialized")
    }
    
}

var weakKeyword: WeakKeyword? = WeakKeyword() //refrance count = 1
var weakKeyword1: WeakKeyword? = WeakKeyword()
weakKeyword?.friend = weakKeyword1 // refrance count = 1 it will not increase beacues it is week variable
weakKeyword1?.friend = weakKeyword
weakKeyword = nil //refrance count = 0 and run deinit method
weakKeyword1 = nil

//Self Weak
class SelfWeak {
    
    var name: String
    
    init(name: String) {
        self.name = name
        print("SelfWeak Get Initialized")
    }

    //DispatchQueue.main.asyncAfter(deadline: .now() + 10) used for excuting this closure after 10 second
    //using [weak self] self will weak and self didt get another refrance that why refrance count will not increase
    //if we not use [weak self] then refrance count will increment by 1 when we use self. after excuting it will decrement by 1
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            print("Hello \(self?.name ?? " ")") // after object get nil it will be executed if it is in execute.
        }
    }
    
    deinit {
        print("SelfWeak Get Deinitialized")
    }
    
}
var selfWeak: SelfWeak? = SelfWeak(name: "Brijesh")
selfWeak?.fetchData()
selfWeak = nil
