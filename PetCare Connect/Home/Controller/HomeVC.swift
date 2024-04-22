//  HomeVC.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var callButton: UIButton!

    private var viewModel: HomeViewModel = HomeViewModel()
    var imageUrl:String?
    private var refreshControl = UIRefreshControl()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadData()
    }
    
    private func setupUI() {
        self.setupButtons()
        self.setupTableView()
    }
    
    private func setupButtons() {
        self.setupChatButton()
        self.setupCallButton()
    }
    
    private func setupChatButton() {
        self.chatButton.layer.cornerRadius = 10
    }
    
    private func setupCallButton() {
        self.callButton.layer.cornerRadius = 10
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib(nibName: "PetsTVCell", bundle: nil), forCellReuseIdentifier: "PetsTVCell")
        self.tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func loadData() {
        
        self.viewModel.getPetsData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
        
        self.viewModel.getConfigData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.enableDisableButtons()
                }
        }
    }
    
    private func enableDisableButtons() {
        self.chatButton.isHidden = !(self.viewModel.configData.settings?.isChatEnabled ?? false)
        self.callButton.isHidden = !(self.viewModel.configData.settings?.isCallEnabled ?? false)
    }
    
    @IBAction func callButtonAction(_ sender: UIButton) {
        if Helper.isWithinOfficeHours() {
            self.showAlert(message: AppConstants.officeHoursMessage)
        } else {
            self.showAlert(message: AppConstants.afterHoursMessage)
        }
    }

    @IBAction func chatButtonAction(_ sender: UIButton) {
        if Helper.isWithinOfficeHours() {
            self.showAlert(message: AppConstants.officeHoursMessage)
        } else {
            self.showAlert(message: AppConstants.afterHoursMessage)
        }
    }

    

}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.petsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "PetsTVCell", for: indexPath) as? PetsTVCell {
            cell.name.text = self.viewModel.petsData[indexPath.row].title ?? ""
            if let imageUrl = self.viewModel.petsData[indexPath.row].imageUrl {
                cell.configure(with: imageUrl )
            }
            cell.backgroundColor = .red
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell {
            header.title.text = "Office Hours : " +  (self.viewModel.configData.settings?.workHours ?? "")
            return header
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let contentUrl = viewModel.petsData[indexPath.row].contentUrl else {
                    print("Content URL is nil")
                    return
                }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                self.pushToViewController(withIdentifier: "PetsDetailVC", urlToLoad: contentUrl)
            }
        }


    }
    
    @objc private func refreshData() {
        
        self.loadData()
        refreshControl.endRefreshing()
    }


}

