//
//  PopularPageCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import UIKit

class PopularProductCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
 
    
    var popularProductDataList: [PopularProductResult] = []
   
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.9489471316, green: 0.9490606189, blue: 0.9489082694, alpha: 1)
        collectionView.register(UINib(nibName: "PopularCell", bundle: nil), forCellWithReuseIdentifier: "PopularCell")
        PopularProductDataManager().PopularProductDataList(PopularProductCell: self)
        print("DEBUG: \(self.popularProductDataList.count)")

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.popularProductDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
        cell.productName.text = self.popularProductDataList[indexPath.row].productInfo.first?.productName
        cell.reviewerName.text = self.popularProductDataList[indexPath.row].productInfo.first?.reviewerName
        cell.reviewContents.text = self.popularProductDataList[indexPath.row].productInfo.first?.reviewContent
        
        
        
        let imageUrl = URL(string: self.popularProductDataList[indexPath.row].productInfo.first?.productImageUrl ?? "")
        DispatchQueue.main.async {
            let data = try? Data(contentsOf: imageUrl!) 
            DispatchQueue.main.async {
                cell.mainImageView.image = UIImage(data: data!)
            }
        }
        return cell
    }

}

extension PopularProductCell: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: CGFloat(40), left: CGFloat(2), bottom: CGFloat(2), right: CGFloat(2))

        }
        
        return UIEdgeInsets(top: CGFloat(5), left: CGFloat(2), bottom: CGFloat(2), right: CGFloat(2))
    }
    
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
            let size = CGSize(width: collectionView.frame.width - 10, height: 290)
            return size
                
            } else {
                let size = CGSize(width: collectionView.frame.width/2 - 5, height: 290)
                return size
            }

        } else {
            
        let size = CGSize(width: collectionView.frame.width/2 - 10, height: 290)
        return size
            
        }
    }
}

extension PopularProductCell {
    func didRetrievePopularProduct(result: [PopularProductResult]) {
//        RealTimeDataList = result.result ?? []
        self.popularProductDataList = result
//        print(pageDataList.count)
        collectionView.reloadData()
        print("DEBUG: 데이터 로딩 성공")
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}

