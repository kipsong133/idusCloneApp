//
//  PageCell.swift
//  sampleTabBar
//
//  Created by 김우성 on 2021/01/06.
//

import UIKit



// 세로방향 셀 생성.
class PageCell: UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource { 
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let insidePageViewController = UINavigationController(rootViewController: InsidePageViewController())
    
    var pageDataList: [PageResult] = []
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = #colorLiteral(red: 0.9489471316, green: 0.9490606189, blue: 0.9489082694, alpha: 1)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        //self.collectionView.backgroundColor = .gray
        //        self.collectionView.register(InPageCollectionViewCell.self, forCellWithReuseIdentifier: "InPageCollectionViewCell")
        
        collectionView.register(UINib(nibName: DetailPageCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: DetailPageCell.reusableIdentifier)
        
        // AdCell
        collectionView.register(UINib(nibName: "AdCell", bundle: nil), forCellWithReuseIdentifier: "AdCell")
        
        PageDataManager().PageDataList(PageCell: self)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageDataList.count + 1 // 1 == 광고배너
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath) as! AdCell
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailPageCell", for: indexPath) as! DetailPageCell
            
            let Index = pageDataList[self.pageDataList.count - indexPath.row]
            cell.productnameLabel.text = Index.productName
            cell.sellernameLabel.text = Index.sellerName
            cell.reviewLabel.text = Index.reviewcontent
            cell.reviewnameLabel.text = Index.reviewerName
            cell.reviewLabel.text = Index.reviewcontent
            
            let profileImageUrl = URL(string:self.pageDataList[self.pageDataList.count - indexPath.row].sellerProfileImageUrl)
            DispatchQueue.main.async {
                let data = try? Data(contentsOf: profileImageUrl!) 
                DispatchQueue.main.async {
                    cell.sellerProfileImageView.image = UIImage(data: data!)
                }
            }
            
            let imageUrl = URL(string:self.pageDataList[self.pageDataList.count - indexPath.row].productImageUrl)
            DispatchQueue.main.async {
                let data = try? Data(contentsOf: imageUrl!) 
                DispatchQueue.main.async {
                    cell.productImageView.image = UIImage(data: data!)
                }
            }
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: 클릭성공.")
        Constant.mainSeletedCellIdx = indexPath.row
        // 이곳에서 화면전환을 하고자합니다.
        guard let topVC = UIApplication.shared.topViewController() else { return }
        topVC.navigationController?.pushViewController(InsidePageViewController(), animated: true)
        
        
        
    }
    
}

extension PageCell {
    func didRetrieveBoxOffice(result: PageResponse) {
        pageDataList = result.result ?? []
        print(pageDataList.count)
        collectionView.reloadData()
        print("DEBUG: 데이터 로딩 성공")
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}



extension PageCell: UICollectionViewDelegateFlowLayout {
    
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width  - 10 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        
        if indexPath.row == 0 {
            return CGSize(width: width + 11, height: 300)
        } else {
            
            let size = CGSize(width: width, height: 300)
            return size
        }
    }
}
