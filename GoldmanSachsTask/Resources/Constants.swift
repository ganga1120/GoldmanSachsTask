//
//  Constants.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//

import Foundation

struct Constants {
    
    struct Cells {
        static let astronomyImagesCell = "AstronomyImagesCell"
    }
    
    struct Titles {
        static let home_screen_title = "HOME"
    }
    
    struct URL {
        
        static let BaseUrl = "https://api.nasa.gov/"
        static let get_astronomy_serviceUrl  = "https://api.nasa.gov/planetary/apod?api_key=NOZnI9T0WRkqREgRdnFOKspyHuNIgaiW6EiN0dQU&start_date=2022-08-01&end_date=2022-08-08"
        static let api_key = "NOZnI9T0WRkqREgRdnFOKspyHuNIgaiW6EiN0dQU"
        
    }
    
    struct Alert {
        static let ok = "Ok"
        static let app = "GoldmanSachsTask"
    }
    
    
    struct LocalStoage_Keys {
        static let local_astronomyImagesArray_array = "AstronomyImagesArray_count"
    }
}
