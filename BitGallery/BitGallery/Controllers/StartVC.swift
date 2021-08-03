//
//  StartVC.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import UIKit

class StartVC: UIViewController {
    @IBOutlet weak var btnStart: RoundedButton!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    var repositoryListViewModel:RepositoryListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stopActivity()
        self.repositoryListViewModel = RepositoryListViewModel(api: UIApplication.appDelegate.api)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.repositoryListViewModel.resetRepositoryList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.ShowRepositoryListSegue.rawValue {
            guard let repoListVC = segue.destination as? RepositoryListVC else {fatalError("RepositoryListVC not found")}
            repoListVC.repositoryListViewModel =  self.repositoryListViewModel
        }
    }
    
    @IBAction func didStartTapped(_ sender: Any) {
        
        //Check if network available
    
        self.startActivity()
        self.repositoryListViewModel.loadRepository { [weak self] (result, error) in
            guard let self = self else { return }
            self.stopActivity()
            if result == ResponseCodes.success{
                self.performSegue(withIdentifier:  SegueIdentifier.ShowRepositoryListSegue.rawValue , sender: nil)
            }else{
                self.alert(title: "Error", message: error!.message!)
            }
        }
    }

}
//MARK:- utility
extension StartVC{
    fileprivate func startActivity(){
        if self.activityView.isAnimating == false {
            self.activityView.startAnimating()
        }
    }
    fileprivate func stopActivity(){
        if self.activityView.isAnimating == true {
            self.activityView.stopAnimating()
        }
    }
}
