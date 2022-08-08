//
//  HomeViewController.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//


import UIKit
import Reachability

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var tableView :UITableView!
    
    let homeViewModel = HomeViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle()
        self.setUI()
        self.setUpTableView()
    }
    
    
    private func setNavigationTitle() {
        self.title = homeViewModel.getScreenTitle()
    }
    
    private func setUI() {
        self.startDatePicker.preferredDatePickerStyle = .compact
        self.startDatePicker.maximumDate = Date()
        self.endDatePicker.maximumDate = Date()
    }
    
    
    private func setUpTableView() {
        tableView.register(UINib(nibName: Constants.Cells.astronomyImagesCell, bundle: nil), forCellReuseIdentifier: Constants.Cells.astronomyImagesCell)
        tableView.tableFooterView = UIView()
    
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        
        let startDateString = DateFormatter.sharedDateFormatter.string(from: self.startDatePicker.date)
        let endDateString = DateFormatter.sharedDateFormatter.string(from: self.endDatePicker.date)
        
        if ConnectionManager.shared.hasConnectivity() {
            let url = "\(Constants.URL.BaseUrl)planetary/apod?api_key=\(Constants.URL.api_key)&start_date=\(startDateString)&end_date=\(endDateString)"
            
            self.startLoading()
            homeViewModel.AstronomyImagesListData(serviceUrl: url ) { success, error in
                DispatchQueue.main.async { [weak self] in
                    self?.stopLoading()
                    if success {
                        self?.reloadTableView()
                    } else {
                        self?.showAlert(title:nil, message: error?.localizedDescription ?? "")
                    }
                }
            }
        }else {
            if UserDefaults.standard.value(forKey: Constants.LocalStoage_Keys.local_astronomyImagesArray_array) != nil {
                if let data = homeViewModel.getAstronomyImagesDataFromUserDefaults() {
                    homeViewModel.setAstronomyImagesData(response: data)
                    self.reloadTableView()
                }
            }
        }
       
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.delegate = self
            self?.tableView.reloadData()
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
}

// MARK: - UITableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.getNmberOfAstronomyImagesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.astronomyImagesCell, for: indexPath) as? AstronomyImagesCell else {
            return  UITableViewCell()
        }
        
        cell.selectedAstronomyImageModel = homeViewModel.astronomyImagesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView .deselectRow(at: indexPath, animated: true)
    }
    
}



