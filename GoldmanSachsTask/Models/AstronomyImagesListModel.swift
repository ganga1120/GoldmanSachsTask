//
//  NASAImagesList.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//

import Foundation

struct AstronomyImagesListModel: Codable {
    let date: String?
    let explanation: String?
    let hdurl: String?
    let media_type: String?
    let title: String?
    let url: String?
}

/*
 {
     "date": "2022-08-01",
     "explanation": "It's stars versus dust in the Carina Nebula and the stars are winning. More precisely, the energetic light and winds from massive newly formed stars are evaporating and dispersing the dusty stellar nurseries in which they formed. Located in the Carina Nebula and known informally as Mystic Mountain, these pillar's appearance is dominated by the dark dust even though it is composed mostly of clear hydrogen gas. Dust pillars such as these are actually much thinner than air and only appear as mountains due to relatively small amounts of opaque interstellar dust.  About 7,500 light-years distant, the featured image was taken with the Hubble Space Telescope and highlights an interior region of Carina which spans about three light years. Within a few million years, the stars will likely win out completely and the entire dust mountain will evaporate.",
     "hdurl": "https://apod.nasa.gov/apod/image/2208/MysticCarina_HubbleSerrano_1465.jpg",
     "media_type": "image",
     "service_version": "v1",
     "title": "Mountains of Dust in the Carina Nebula",
     "url": "https://apod.nasa.gov/apod/image/2208/MysticCarina_HubbleSerrano_960.jpg"
   },
 */
