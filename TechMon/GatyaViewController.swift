//
//  GatyaViewController.swift
//  TechMon
//
//  Created by Neo Takehiro on 2021/07/11.
//

import UIKit

class GatyaViewController: UIViewController {
    //乱数を入れるためのInt型の変数を用意
    var number: Int!
    
    //背景画面とモンスターの画像を表示するためのImageViewを用意
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var monsterImageView: UIImageView!
    let techMonManager = TechMonManager.shared
    let savedate: UserDefaults = UserDefaults.standard
    
    var player: Character!
    var enemy: Character!
    var monsterarray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        monsterarray = savedate.object(forKey: "monster") as! [String]
        player = techMonManager.player
        
        //0~9までのランダムな数（乱数）を表示させる
        number = Int.random(in: 0...99)
        if number == 99 {
            monsterarray.append("monster_9")
            monsterImageView.image = UIImage(named: "monster_9")
            backgroundImageView.image = UIImage(named: "bg_gold")
        }else if number >= 89 && number < 99{
            monsterarray.append("monster_8")
            monsterImageView.image = UIImage(named: "monster_8")
            backgroundImageView.image = UIImage(named: "bg_gold")
        }else if number >= 79 && number < 89{
            monsterarray.append("monster_7")
            monsterImageView.image = UIImage(named: "monster_7")
            backgroundImageView.image = UIImage(named: "bg_gold")
        }else if number >= 69 && number < 79{
            monsterarray.append("monster_6")
            monsterImageView.image = UIImage(named: "monster_6")
            backgroundImageView.image = UIImage(named: "bg_red")
        }else if number >= 59 && number < 69{
            monsterarray.append("monster_5")
            monsterImageView.image = UIImage(named: "monster_5")
            backgroundImageView.image = UIImage(named: "bg_red")
        }else if number >= 49 && number < 59{
            monsterarray.append("monster_4")
            monsterImageView.image = UIImage(named: "monster_4")
            backgroundImageView.image = UIImage(named: "bg_red")
        }else if number >= 39 && number < 49{
            monsterarray.append("monster_3")
            monsterImageView.image = UIImage(named: "monster_3")
            backgroundImageView.image = UIImage(named: "bg_red")
        }else if number >= 29 && number < 39{
            monsterarray.append("monster_2")
            monsterImageView.image = UIImage(named: "monster_2")
            backgroundImageView.image = UIImage(named: "bg_blue")
        }else if number >= 19 && number < 29{
            monsterarray.append("monster_1")
            monsterImageView.image = UIImage(named: "monster_1")
            backgroundImageView.image = UIImage(named: "bg_blue")
        }else if number >= 0 && number < 19{
            monsterarray.append("monster_0")
            monsterImageView.image = UIImage(named: "monster_0")
            backgroundImageView.image = UIImage(named: "bg_blue")
        }
        savedate.set(monsterarray, forKey: "monster")
    }
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    }
    
    
    
    
        
        
        
    
    

    

