//
//  ViewController.swift
//  SwiftProtocolFeatures
//
//  Created by WhatsXie on 2017/9/4.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let SBsuperman = KoreanSuperHuman()
        SBsuperman.laser()
        
        class Donkey: SuperAnimal {}
        let ramon = Donkey()
        ramon.canChange()
        
        let btn = UIButton()
        btn.shake()
        
        let myClass = MyClass()
        myClass.delegate = ViewSubclass() //这个编译正常
        //        myClass.delegate = View() //这个编译报错:
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// Human
protocol Human {
    var name:String{
        get set
    }
    var race:String{
        get set
    }
    func sayHi()
}

struct Korean:Human {
    var name:String = "阿西吧先生"
    var race:String = "🇰🇷"
    func sayHi() {
        print("阿西吧阿西吧巴巴~")
    }
}

struct American:Human {
    var name:String = "法克先生"
    var race:String = "🇺🇸"
    func sayHi() {
        print("法克法克法克鱿~")
    }
}

// superHuman -> Human
protocol superHuman:Human {
    var canFly:Bool {
        get set
    }
    func laser()
}

struct SuperClark:superHuman {
    var name = "克拉克先生"
    var race = "👽"
    var canFly = true
    func sayHi() {
        print("我是\(name),我是\(race)人，不要看我的眼睛，你会被激光杀死的")
    }
    func laser() {
        print("激光 biubiubiu~")
    }
}

struct KoreanSuperHuman:Human, superHuman {
    func laser() {
        print("我是\(name),我是\(race)人,让你的文化遗产变成我的 biubiubiu~")
    }
    
    func sayHi() {
        print("阿西吧思密达")
    }
    
    var race: String = "来自✨的👽"
    
    
    var name: String = "思密达先生"
    
    var canFly: Bool = false
    
}

protocol SuperAnimal {
    func canChange()
}

extension SuperAnimal {
    func canChange() {
        print("我是动物系超人，我能变身乌龟人~")
    }
}

// swift 4 新特性：把类（Class）和协议（Protocol）用 & 组合在一起作为一个类型使用
// to UIKit
protocol Shakeable {
    func shake()
}

extension UIButton: Shakeable {
    func shake() {
        print("hello button shake..")
    }
}

extension UISlider: Shakeable {
    func shake() {
        /* ... */
    }
}
// to Class
protocol MyProtocol { }

class View { }

class ViewSubclass: View, MyProtocol { }

class MyClass {
    var delegate: (View & MyProtocol)?
}






