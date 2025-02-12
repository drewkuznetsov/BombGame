//
//  PunishmentsModel.swift
//  BombGame
//
//  Created by Nick Khachatryan on 12.02.2025.
//

import Foundation


//Список наказаний
enum PunishmentsModel: String, CaseIterable {
    case clapHands = "После каждого ответа хлопай в ладоши!"
    case differentPoses = "Вставай каждый раз в разные позы во время ответа!"
    case woof = "Гавкай после каждого ответа!"
    case pirateAccent = "Отвечай так, будто ты пират! Йо-хо-хо!"
    case inRhyme = "После каждого ответа придумывай рифму к ответу!"
    case spinAround = "Кружись во время ответа!"
    case dance = "Танцуй во время ответа!"
    case slowMotion = "Отвечай так, будто ты в замедленной съемке!"
    case transmitter = "Отвечай так, будто ты общаешься по радио(Пшш... Приём! Ответ - ...)"
    case motorcycle = "Сделай вид, будто ты едешь на невидимом мотоцикле и в это время даешь ответ!"
    case laughLikeVillain = "Каждый раз перед ответом посмейся как злодей!"
}
