//
//  RepositoryListVC.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import UIKit

class RepositoryListVC: UIViewController {

    var repositoryListViewModel:RepositoryListViewModel!
    
    @IBOutlet weak var respositoryTable: UITableView!
    
    private var datasource : TableViewDatasource<GeneralCell,RepositoryViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDatasource()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden  = false
        
    }
    deinit {
        self.repositoryListViewModel = nil
        self.datasource = nil
    }
}

//MARK:- Private Methods
extension RepositoryListVC{
    fileprivate func setupDatasource(){
        self.datasource = TableViewDatasource(cellIdentifier: Identifier.GeneralCellIdentifier.rawValue,items: self.repositoryListViewModel.repositoryList!){(cell,viewModel) in
            cell.configure(viewModel)
        }
        self.respositoryTable.dataSource = self.datasource
        self.respositoryTable.delegate = self
    }
}

//MARK:- UITableViewDelegate
extension RepositoryListVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.repositoryListViewModel.repositoryList![indexPath.row])
    }
}
