//
//  BoxCollectionViewController.swift
//  TechMon
//
//  Created by Neo Takehiro on 2021/07/25.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    // 画像の名前を入れる配列
    var imageName: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画像の名前を入れる
        for i in 0..<15 {
            imageName.append("monster_\(i)")
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // カテゴリで分けたい時に指定するカテゴリ数
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        // cellの大きさをstoryboardに合わせて設定
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.estimatedItemSize = .zero
        // cellの個数
        return imageName.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
