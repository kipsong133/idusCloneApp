//
//  PopularSellerCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import UIKit

class PopularSellerCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

   
    var popularSellerDataList: [PopularSellerResult] = []
    
    //MARK: - Outlet
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.9489471316, green: 0.9490606189, blue: 0.9489082694, alpha: 1)
        collectionView.register(UINib(nibName: "DetailPopularSellerCell", bundle: nil), forCellWithReuseIdentifier: "DetailPopularSellerCell")
        PopularSellerDataManager().PopularSellerDataList(PopularSellerCell: self)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularSellerDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailPopularSellerCell", for: indexPath) as! DetailPopularSellerCell
        
        cell.productname.text = self.popularSellerDataList[indexPath.row].sellerName
        cell.productInfo.text = self.popularSellerDataList[indexPath.row].bio
        
        let mainImageUrl = URL(string: self.popularSellerDataList[indexPath.row].sellerBackgroundImageUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: mainImageUrl!) 
            DispatchQueue.main.async {
                guard let imgData = data else {return}
                cell.mainImageView.image = UIImage(data: imgData)
            }
        }
        
        
        let profileImageUrl = URL(string: self.popularSellerDataList[indexPath.row].sellerProfileImageUrl)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: profileImageUrl!) 
            DispatchQueue.main.async {
                guard let imgData = data else {return}
                cell.sellerProfileImageView.image = UIImage(data: imgData)
            }
        }
        
        
        return cell
    }
    
}

extension PopularSellerCell: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(0), left: CGFloat(0), bottom: CGFloat(0), right: CGFloat(0))
    }
    
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let size = CGSize(width: collectionView.frame.width, height: 290)
        return size
        
        
    }
}


extension PopularSellerCell {
    func didRetrievePopularSeller(result: [PopularSellerResult]) {
//        RealTimeDataList = result.result ?? []
        self.popularSellerDataList = result
//        print(pageDataList.count)
        collectionView.reloadData()
        print("DEBUG: 데이터 로딩 성공")
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
