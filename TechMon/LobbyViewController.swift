//
//  LobbyViewController.swift
//  TechMon
//
//  Created by Neo Takehiro on 2021/05/16.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaLabel: UILabel!
        
        let techMonManager = TechMonManager.shared
        
        var stamina: Int = 100
        var staminaTimer: Timer!
        
        //アプリが起動したとき一度だけ呼ばれる
        override func viewDidLoad() {
            super.viewDidLoad()

            //UIの設定
            nameLabel.text = "勇者"
            staminaLabel.text = "\(stamina)/ 100"
        
        //タイマーの設定
            staminaTimer = Timer.scheduledTimer(
                timeInterval: 3,
                target: self,
                selector: #selector(updateStaminaValue),
                userInfo: nil,
                repeats: true)
            staminaTimer.fire()
        }
        
        //ロビー画面が見えるようになるときに呼ばれる
        override func viewWillAppear(_ animated: Bool) {
            
            super.viewWillAppear(animated)
            techMonManager.playBGM(fileName: "lobby")
        }
        
        //ロビーが見えなくなるときに呼ばれる
        override func viewWillDisappear(_ animated: Bool) {
        
            super.viewWillDisappear(animated)
            techMonManager.stopBGM()
        }
        
        @IBAction func toBattle() {
        
        //スタミナが50以上であればスタミナを消費して戦闘画面へ
            if stamina >= 50 {
        
        stamina -= 50
                staminaLabel.text = " \(stamina) / 100"
                performSegue(withIdentifier: "toBattele", sender: nil)
            } else {
                
                let alert = UIAlertController(
                    title: "バトルに行けません",
                    message: "スタミナを貯めてください",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
                
        //スタミナの回復
        @objc func updateStaminaValue() {
            if stamina < 100 {
        stamina += 1
                staminaLabel.text = " \(stamina)/100"
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


