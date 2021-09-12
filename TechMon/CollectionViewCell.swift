//
//  CollectionViewCell.swift
//  TechMon
//
//  Created by Neo Takehiro on 2021/08/08.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // cellに表示させたいものを宣言(今回はimageViewとlabel)
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // cellの設定
        // cellの枠の太さ
        self.layer.borderWidth = 1.0
        // cellの枠の色
        self.layer.borderColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        // cellを丸くする
        self.layer.cornerRadius = 8.0
    }
}
