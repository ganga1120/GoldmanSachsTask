//
//  HomeViewModel.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//

import Foundation

class HomeViewModel {
    
    var astronomyImagesArray: [AstronomyImagesListModel] = []
    lazy var networkInterface: NetworkInterfaceProtocol = NetworkInterface()

    func AstronomyImagesListData(serviceUrl: String, completion: @escaping (_ success: Bool, _ error: Error?) -> ()) {
        
        networkInterface.request(serverUrl: serviceUrl) { [weak self] (result: Response<AstronomyImagesListModel>) in
            switch result {
            case .success(let response):
                self?.setAstronomyImagesData(response: response)
                self?.saveAstronomyImagesDataInUserDefaults(response: response)
                completion(true, nil)
            case .failure(let error):
                completion(false, error)
            }
        }
    }
    
    func setAstronomyImagesData(response: [AstronomyImagesListModel]) {
        self.astronomyImagesArray = response
    }
    
    func saveAstronomyImagesDataInUserDefaults(response: [AstronomyImagesListModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(response) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: Constants.LocalStoage_Keys.local_astronomyImagesArray_array)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getAstronomyImagesDataFromUserDefaults() -> [AstronomyImagesListModel]?  {
        if let savedPerson = UserDefaults.standard.object(forKey: Constants.LocalStoage_Keys.local_astronomyImagesArray_array) as? Data {
            let decoder = JSONDecoder()
            if let finalAstronomyImagesArray = try? decoder.decode([AstronomyImagesListModel].self, from: savedPerson) {
                return finalAstronomyImagesArray
            }
        }
        return nil
    }
    
    func getNmberOfAstronomyImagesCount() -> Int {
        return self.astronomyImagesArray.count
    }
    
    func getScreenTitle() -> String? {
        return Constants.Titles.home_screen_title
    }
    
    func getAstronomyTitle(index: Int) -> String? {
        return self.astronomyImagesArray[index].title
    }
}
