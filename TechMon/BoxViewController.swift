//
//  BoxViewController.swift
//  TechMon
//
//  Created by Neo Takehiro on 2021/08/08.
//

import UIKit

class BoxViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
@IBOutlet private weak var collectionView: UICollectionView!
    // 画像の名前を入れる配列
    var imageName: [String] = []

    let savedate: UserDefaults = UserDefaults.standard
    var monsterarray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
            collectionView.dataSource = self
        monsterarray = savedate.object(forKey: "monster") as! [String]
        // 画像の名前を入れる
        for i in 0..<monsterarray.count {
            imageName.append(monsterarray[i])
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // cellの大きさをstoryboardに合わせて設定
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.estimatedItemSize = .zero
        // cellの個数
        return imageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // CollectionViewCell.swiftと関連付ける
        // withReuseIdentifierはstoryBoard上のcellのidentifierに"Cell"を設定
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell

        // Configure the cell
        // 画像をimageFileに入れてimageViewに表示
        let imageFile = UIImage(named: imageName[indexPath.row] + ".png")
        cell.imageView.image = imageFile
        // 画像名をlabelに表示
        cell.label.text = imageName[indexPath.row]

        return cell
    }
    
  
    
        

 
}
