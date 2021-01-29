//
//  RealTimeCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import UIKit

class RealTimeCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var realTimeDataList: [RealTimeResult] = []
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.9489471316, green: 0.9490606189, blue: 0.9489082694, alpha: 1)
        collectionView.register(UINib(nibName: "DetailRealTimeCell", bundle: nil), forCellWithReuseIdentifier: "DetailRealTimeCell")
        RealTimeDataManager().RealTimeDataList(RealTimeCell: self)

    }
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.realTimeDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailRealTimeCell", for: indexPath) as! DetailRealTimeCell
        
        cell.productName.text = self.realTimeDataList[indexPath.row].productName
        let imageUrl = URL(string:self.realTimeDataList[indexPath.row].productImageUrl)
        DispatchQueue.main.async {
            let data = try? Data(contentsOf: imageUrl!) 
            DispatchQueue.main.async {
                cell.productImageView.image = UIImage(data: data!)
            }
        }
        cell.review01.text = self.realTimeDataList[indexPath.row].review.first?.ReviewContent
        cell.review02.text = self.realTimeDataList[indexPath.row].review.last?.ReviewContent
        cell.reviewername01.text = self.realTimeDataList[indexPath.row].review.first?.reviewerName
        cell.reviewer02.text = self.realTimeDataList[indexPath.row].review.last?.reviewerName
        
        cell.sellerName.text = self.realTimeDataList[indexPath.row].sellerName

        
        return cell
    }
}


extension RealTimeCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(2), left: CGFloat(3), bottom: CGFloat(2), right: CGFloat(3))
    }
    
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.7
    }
    
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        let size = CGSize(width: collectionView.frame.width/2 - 4, height: 290)
        return size
    }
}


extension RealTimeCell {
    func didRetrieveRealTime(result: [RealTimeResult]) {
//        RealTimeDataList = result.result ?? []
        self.realTimeDataList = result
//        print(pageDataList.count)
        collectionView.reloadData()
        print("DEBUG: 데이터 로딩 성공")
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
