//
//  TRMExtensions.swift
//
//  Created by Taylor on 2024-08-10.
//

import CoreLocation
import Foundation
import SwiftUI


// MARK: - EXTENSIONS
extension CGSize {
    /// The ratio of the size's width to height.
    var aspectRatio: Double {
        return width / height
    }
}

extension CLLocationCoordinate2D: Codable, @retroactive Hashable, @retroactive Equatable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }

    public enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }

    public init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
    }

    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude
            && lhs.longitude == rhs.longitude
    }
}

extension Date {

    /**
     Adds the provided number of days to the date.

     - parameters:
     - days: The number of days to add to the date.
     - returns: A `Date` instance that adds `days` to the date.
     */
    func adding(days: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: days, to: self)
    }

    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {

        let currentCalendar = Calendar.current

        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }

        return end - start
    }

    /// Returns a date instance that represents the date at the start of the day: 00:00:00.
    var startOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self)
    }
}

extension Locale.Currency {
    /// Returns the current currency based on the user's locale or the default "USD" currency.
    static var currentOrDefault: Locale.Currency {
        return Locale.current.currency ?? Locale.Currency("USD")
    }
}

extension NavigationPath {
    mutating func removeAll() {
        self.removeLast(self.count)
    }
}


// MARK: - ENUMS

enum Icon: String, Identifiable, Codable {
    // housing
    case house = "house"
    case houseFlag
    case landscaping
    case snow
    //    case cleaning  // there is no sfsymbol as of 6.0 to represent cleaning
    case sparkles
    case sparklesAndBubbles
    case laundry


    // traditional
    case water = "water"
    case sewer
    case fire
    case lightbulb = "lightbulb"
    case electricity
    case trash
    case recycling


    // technology
    case world
    case wifi
    case wave
    case phone
    case cellPhone
    case simCard
    case computer
    case laptop
    case tablet
    case printer
    case scanner


    // transportation
    case car
    case gas
    case carElectric
    case evCharger
    case bike
    case walk
    case roll
    case scooter
    case moped
    case motorcycle
    case bus
    case plane
    case lightRail
    case tram
    case cableCar
    case ferry
    case boat
    case truck


    //food
    case food
    case plate
    case coffee
    case basket
    case shoppingCart
    case shoppingBag


    // health
    case medical
    case heart
    case pill
    case syringe
    case inhaler
    case bandage
    case wheelchair
    case gym
    case eye
    case eyeglasses
    case sunglasses


    // work
    case tools
    case gears
    case key
    case pin
    case briefcase
    case court
    case office
    case tray
    case folder
    case paperPlane
    case document
    case tag
    case calendar


    // entertainment
    case tv
    case popcorn
    case book
    case newspaper
    case games
    case gaming
    case cloud
    case music
    case microphonePodcast
    case microphoneMusic
    case radio
    case headphones
    case speaker
    case theatre
    case ticket


    // savings
    case creditCard = "creditCard"
    case umbrella = "umbrella"
    case savings
    case interest
    case security
    case sunny
    case rainy
    case wallet


    // things
    case bell
    case star
    case furniture
    case bed
    case suitcase
    case medal
    case puzzle
    case scissors
    case flag
    case letter
    case leaf
    case flower
    case rainbow
    case beach
    case camping
    case camera
    case crown
    case clothes
    case watch
    case hourglass


    // events
    case gift
    case graduation
    case ballons
    case fireworks


    // family
    case child
    case stroller
    case family2
    case family1
    case pet
    case dog
    case cat
    case fish
    case bird
    case lizard
    case tortoise
    case hare
    case ladybug
    case ant


    // MARK: - ICON PROPERTIES
    /// Represents the stable identity of the Icon.
    var id: Icon {
        return self
    }


    /// Returns a `String` representing the icon's system image name to use in the app.
    var systemImageName: String {
        switch self {
            // housing
        case .house:
            return "house.fill"
        case .houseFlag:
            return "house.and.flag.fill"
        case .landscaping:
            return "tree.fill"
        case .snow:
            return "snowflake"
        case .sparkles:
            return "sparkles"
        case .sparklesAndBubbles:
            return "bubbles.and.sparkles.fill"
        case .laundry:
            return "washer.fill"
            // traditional
        case .water:
            return "drop.fill"
        case .sewer:
            return "toilet.fill"
        case .fire:
            return "flame.fill"
        case .lightbulb:
            return "lightbulb.max.fill"
        case .electricity:
            return "bolt.fill"
        case .trash:
            return "trash.fill"
        case .recycling:
            return "arrow.3.trianglepath"
            // technology
        case .world:
            return "globe"
        case .wifi:
            return "wifi"
        case .wave:
            return "wave.3.up.circle.fill"
        case .phone:
            return "phone.fill"
        case .cellPhone:
            return "iphone.gen3"
        case .simCard:
            return "simcard.fill"
        case .computer:
            return "desktopcomputer"
        case .laptop:
            return "laptopcomputer"
        case .tablet:
            return "ipad.landscape"
        case .printer:
            return "printer.fill"
        case .scanner:
            return "scanner.fill"
            // transportation
        case .car:
            return "car.fill"
        case .carElectric:
            return "bolt.car.fill"
        case .gas:
            return "fuelpump.fill"
        case .evCharger:
            return "ev.charger.fill"
        case .bike:
            return "bicycle"
        case .walk:
            return "figure.walk"
        case .roll:
            return "figure.roll"
        case .scooter:
            return "scooter"
        case .moped:
            return "moped.fill"
        case .motorcycle:
            return "motorcycle.fill"
        case .bus:
            return "bus"
        case .plane:
            return "airplane"
        case .lightRail:
            return "lightrail.fill"
        case .tram:
            return "tram.fill"
        case .cableCar:
            return "cablecar.fill"
        case .ferry:
            return "ferry.fill"
        case .boat:
            return "sailboat.fill"
        case .truck:
            return "truck.box.fill"
            //food
        case .food:
            return "carrot.fill"
        case .plate:
            return "fork.knife.circle.fill"
        case .coffee:
            return "cup.and.saucer.fill"
        case .basket:
            return "basket.fill"
        case .shoppingCart:
            return "cart.fill"
        case .shoppingBag:
            return "bag.fill"
            // health
        case .medical:
            return "cross.case.fill"
        case .heart:
            return "heart.fill"
        case .pill:
            return "pills.fill"
        case .syringe:
            return "syringe.fill"
        case .inhaler:
            return "inhaler.fill"
        case .bandage:
            return "bandage.fill"
        case .wheelchair:
            return "wheelchair"
        case .gym:
            return "dumbbell.fill"
        case .eye:
            return "eye.fill"
        case .eyeglasses:
            return "eyeglasses"
        case .sunglasses:
            return "sunglasses"
            // work
        case .tools:
            return "wrench.and.screwdriver.fill"
        case .gears:
            return "gearshape.2.fill"
        case .key:
            return "key.fill"
        case .pin:
            return "pin.fill"
        case .briefcase:
            return "briefcase.fill"
        case .court:
            return "building.columns.fill"
        case .office:
            return "building.2.fill"
        case .tray:
            return "tray.full.fill"
        case .folder:
            return "folder.fill"
        case .paperPlane:
            return "paperplane.fill"
        case .document:
            return "text.document.fill"
        case .tag:
            return "tag.fill"
        case .calendar:
            return "calendar"
            // entertainment
        case .tv:
            return "tv"
        case .popcorn:
            return "popcorn.fill"
        case .book:
            return "text.book.closed.fill"
        case .newspaper:
            return "newspaper.fill"
        case .games:
            return "dice.fill"
        case .gaming:
            return "gamecontroller.fill"
        case .cloud:
            return "externaldrive.fill.badge.icloud"
        case .music:
            return "music.note"
        case .microphonePodcast:
            return "microphone.fill"
        case .microphoneMusic:
            return "music.microphone"
        case .radio:
            return "radio.fill"
        case .headphones:
            return "headphones"
        case .speaker:
            return "hifispeaker.fill"
        case .theatre:
            return "theatermasks.fill"
        case .ticket:
            return "ticket.fill"
            // savings
        case .creditCard:
            return "creditCard"
        case .umbrella:
            return "umbrella"
        case .savings:
            return "banknote.fill"
        case .interest:
            return "percent"
        case .security:
            return "lock.shield.fill"
        case .sunny:
            return "sun.max.fill"
        case .rainy:
            return "cloud.rain.fill"
        case .wallet:
            return "wallet.bifold.fill"
            // things
        case .bell:
            return "bell.fill"
        case .star:
            return "star.fill"
        case .furniture:
            return "sofa.fill"
        case .bed:
            return "bed.double.fill"
        case .suitcase:
            return "suitcase.fill"
        case .medal:
            return "medal.fill"
        case .puzzle:
            return "puzzlepiece.fill"
        case .scissors:
            return "scissors"
        case .flag:
            return "flag.fill"
        case .letter:
            return "envelope.front.fill"
        case .leaf:
            return "leaf.fill"
        case .flower:
            return "camera.macro"
        case .rainbow:
            return "rainbow"
        case .beach:
            return "beach.umbrella.fill"
        case .camping:
            return "tent.fill"
        case .camera:
            return "camera.fill"
        case .crown:
            return "crown.fill"
        case .clothes:
            return "tshirt.fill"
        case .watch:
            return "watch.analog"
        case .hourglass:
            return "hourglass"
            // events
        case .gift:
            return "gift.fill"
        case .graduation:
            return "graduationcap.fill"
        case .ballons:
            return "balloon.2.fill"
        case .fireworks:
            return "fireworks"
            // family
        case .child:
            return "figure.child"
        case .stroller:
            return "stroller.fill"
        case .family2:
            return "figure.2.and.child.holdinghands"
        case .family1:
            return "figure.and.child.holdinghands"
        case .pet:
            return "pawprint.fill"
        case .dog:
            return "dog.fill"
        case .cat:
            return "cat.fill"
        case .fish:
            return "fish.fill"
        case .bird:
            return "bird.fill"
        case .lizard:
            return "lizard.fill"
        case .tortoise:
            return "tortoise.fill"
        case .hare:
            return "hare.fill"
        case .ladybug:
            return "ladybug.fill"
        case .ant:
            return "ant.fill"
        }
    }

    static var allIcons: [Icon] {
        return [
            // housing
            .house,
            .houseFlag,
            .landscaping,
            .snow,
            .sparkles,
            .sparklesAndBubbles,
            .laundry,
            // traditional
            .water,
            .sewer,
            .fire,
            .lightbulb,
            .electricity,
            .trash,
            .recycling,
            // technology
            .world,
            .wifi,
            .wave,
            .phone,
            .cellPhone,
            .simCard,
            .computer,
            .laptop,
            .tablet,
            .printer,
            .scanner,
            // transportation
            .car,
            .gas,
            .carElectric,
            .evCharger,
            .bike,
            .walk,
            .roll,
            .scooter,
            .moped,
            .motorcycle,
            .bus,
            .plane,
            .lightRail,
            .tram,
            .cableCar,
            .ferry,
            .boat,
            .truck,
            //food
            .food,
            .plate,
            .coffee,
            .basket,
            .shoppingCart,
            .shoppingBag,
            // health
            .medical,
            .heart,
            .pill,
            .syringe,
            .inhaler,
            .bandage,
            .wheelchair,
            .gym,
            .eye,
            .eyeglasses,
            .sunglasses,
            // work
            .tools,
            .gears,
            .key,
            .pin,
            .briefcase,
            .court,
            .office,
            .tray,
            .folder,
            .paperPlane,
            .document,
            .tag,
            .calendar,
            // entertainment
            .tv,
            .popcorn,
            .book,
            .newspaper,
            .games,
            .gaming,
            .cloud,
            .music,
            .microphonePodcast,
            .microphoneMusic,
            .radio,
            .headphones,
            .speaker,
            .theatre,
            .ticket,
            // savings
            .creditCard,
            .umbrella,
            .savings,
            .interest,
            .security,
            .sunny,
            .rainy,
            .wallet,
            // things
            .bell,
            .star,
            .furniture,
            .bed,
            .suitcase,
            .medal,
            .puzzle,
            .scissors,
            .flag,
            .letter,
            .leaf,
            .flower,
            .rainbow,
            .beach,
            .camping,
            .camera,
            .crown,
            .clothes,
            .watch,
            .hourglass,
            // events
            .gift,
            .graduation,
            .ballons,
            .fireworks,
            // family
            .child,
            .stroller,
            .family2,
            .family1,
            .pet,
            .dog,
            .cat,
            .fish,
            .bird,
            .lizard,
            .tortoise,
            .hare,
            .ladybug,
            .ant,
        ]
    }


    static var homeGroup: [Icon] {
        return [
            .house,
            .houseFlag,
            .landscaping,
            .snow,
            .sparkles,
            .sparklesAndBubbles,
            .laundry,
        ]
    }

    static var traditionalGroup: [Icon] {
        return [
            .water,
            .sewer,
            .fire,
            .lightbulb,
            .electricity,
            .trash,
            .recycling,
        ]
    }

    static var technologyGroup: [Icon] {
        return [
            .world,
            .wifi,
            .wave,
            .phone,
            .cellPhone,
            .simCard,
            .computer,
            .laptop,
            .tablet,
            .printer,
            .scanner,
        ]
    }

    static var transportationGroup: [Icon] {
        return [
            .car,
            .gas,
            .carElectric,
            .evCharger,
            .bike,
            .walk,
            .roll,
            .scooter,
            .moped,
            .motorcycle,
            .bus,
            .plane,
            .lightRail,
            .tram,
            .cableCar,
            .ferry,
            .boat,
            .truck,
        ]
    }

    static var foodGroup: [Icon] {
        return [
            .food,
            .plate,
            .coffee,
            .basket,
            .shoppingCart,
            .shoppingBag,
        ]
    }

    static var healthGroup: [Icon] {
        return [
            .medical,
            .heart,
            .pill,
            .syringe,
            .inhaler,
            .bandage,
            .wheelchair,
            .gym,
            .eye,
            .eyeglasses,
            .sunglasses,
        ]
    }

    static var workGroup: [Icon] {
        return [
            .tools,
            .gears,
            .key,
            .pin,
            .briefcase,
            .court,
            .office,
            .tray,
            .folder,
            .paperPlane,
            .document,
            .tag,
            .calendar,
        ]
    }

    static var entertainmentGroup: [Icon] {
        return [
            .tv,
            .popcorn,
            .book,
            .newspaper,
            .games,
            .gaming,
            .cloud,
            .music,
            .microphonePodcast,
            .microphoneMusic,
            .radio,
            .headphones,
            .speaker,
            .theatre,
            .ticket,
        ]
    }

    static var savingsGroup: [Icon] {
        return [
            .creditCard,
            .umbrella,
            .savings,
            .interest,
            .security,
            .sunny,
            .rainy,
            .wallet,
        ]
    }

    static var thingsGroup: [Icon] {
        return [
            .bell,
            .star,
            .furniture,
            .bed,
            .suitcase,
            .medal,
            .puzzle,
            .scissors,
            .flag,
            .letter,
            .leaf,
            .flower,
            .rainbow,
            .beach,
            .camping,
            .camera,
            .crown,
            .clothes,
            .watch,
            .hourglass,
        ]
    }

    static var eventsGroup: [Icon] {
        return [
            .gift,
            .graduation,
            .ballons,
            .fireworks,
        ]
    }

    static var familyGroup: [Icon] {
        return [
            .child,
            .stroller,
            .family2,
            .family1,
            .pet,
            .dog,
            .cat,
            .fish,
            .bird,
            .lizard,
            .tortoise,
            .hare,
            .ladybug,
            .ant,
        ]
    }
}


enum TRMColor: String, Identifiable, Codable, CaseIterable {
    // BASIC COLORS
    case red = "red"
    case orange = "orange"
    case yellow = "yellow"
    case green = "green"
    case blue = "blue"
    case purple = "purple"
    case pink = "pink"
    case gray = "gray"
    case primary = "primary"
    // OTHER COLORS
    case primaryInvert = "primaryInvert"
    case darkText = "darkText"
    case lightText = "lightText"


    var id: TRMColor {
        return self
    }

    var color: Color {
        switch self {
            // BASIC COLORS
        case .blue:
            return Color.blue
        case .gray:
            return Color.gray
        case .green:
            return Color.green
        case .orange:
            return Color.orange
        case .pink:
            return Color.pink
        case .primary:
            return Color.primary
        case .purple:
            return Color.purple
        case .red:
            return Color.red
        case .yellow:
            return Color.yellow
            // OTHER COLORS
        case .primaryInvert:
            return Color(UIColor.systemBackground)
        case .darkText:
            return Color(UIColor.darkText)
        case .lightText:
            return Color.white
        }
    }

    var displayName: String {
        switch self {
            // BASIC COLORS
        case .blue:
            return "Blue"
        case .gray:
            return "Gray"
        case .green:
            return "Green"
        case .orange:
            return "Orange"
        case .pink:
            return "Pink"
        case .primary:
            return "Primary"
        case .purple:
            return "Purple"
        case .red:
            return "Red"
        case .yellow:
            return "Yellow"
            // OTHER COLORS
        case .primaryInvert:
            return "Invert"
        case .darkText:
            return "Dark Text"
        case .lightText:
            return "Light Text"
        }
    }

    static var basicColors: [TRMColor] {
        return [
            .pink,
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .purple,
            .gray,
            .primary,
        ]
    }
}
