import Foundation
import UIKit

struct Parking {
    
    var vehicles = Set<Vehicles>()
    var limitVehicles = 8 //O certo é 20 mas deixei 8 para efeito de teste
    var vehiclesQuantity : Int = 0
    var earnings : Int = 0
    
    mutating func insertVehicles(vehicle : Vehicles){
        guard vehicles.count < limitVehicles else{
            print("❌ The vehicle limit of \(limitVehicles) has been exceeded!")
            return
        }
        guard vehicles.insert(vehicle).inserted else{
            print("❌ This plate is already inside the Parking!")
            return
        }
        print("✅ Welcome to AlkeParking \(vehicle.plate)")
    }
    
    mutating func checkOut(_ plate1: String){
        if let vehicleGettingOut = vehicles.filter({$0.plate == plate1}).first {
            vehicles.remove(vehicleGettingOut)
            vehiclesQuantity += 1
            let subtotal = calculateSubtotal(vehicle: vehicleGettingOut)
            let total = calculateDiscount(vehicleGettingOut, subtotal)
            earnings += total
            print ("🧾 Your fee is $\(total). Come back soon!")
        }else{
            print("❌ Sorry, this plate it's not inside the Parking!")
        }
    }
    
    func calculateSubtotal(vehicle : Vehicles) -> Int{
        var vehicle1 = vehicle
        let minutes = vehicle1.parkedTime
        var subtotal : Int = vehicle.vehicleType.startingFee
        if minutes <= 120 {
            return subtotal
        }else{
            //se o tempo menos 120 segundos divido por 15 sobrar alguma coisa esse valor multiplicar por 5
            if (minutes - 120) % 15 != 0 {
                //ele tem sobra
                subtotal += 5
                subtotal += ((minutes - 120) / 15) * 5
                return subtotal
            }else{
                subtotal += ((minutes - 120) / 15) * 5
                return subtotal
            }
        }
    }
    
    func calculateDiscount(_ vehicle: Vehicles, _ subtotal : Int) -> Int{
        var totalValue : Int = 0
        if vehicle.discountCoupon != nil  {
            totalValue = Int(Double(subtotal) - (Double(subtotal) * 0.15))
            return totalValue
        }else{
            totalValue = subtotal
            return totalValue
        }
    }
    
    func listVehicles(){
        print("\nList of plates")
        for i in vehicles{
            print("\(i.plate)")
        }
    }
    
    func listEarnings(){
        print("\n\(vehiclesQuantity) vehicles have checked out and have earnings of $\(earnings) \n")
    }
}

//Declaração dos tipos de veiculos permitidos exer2
enum VehicleType  {
    case car, motorcycle, bus, minibus
    var startingFee : Int {
        switch self{
        case .car:
            return 20
        case .motorcycle:
            return 15
        case .minibus:
            return 25
        case .bus:
            return 30
        }
    }
}

//Declarando protocolo parkable de carros com plate e tipo, hora e cupomdedesconto
protocol Parkable {
    
    var plate : String {get }
    var vehicleType : VehicleType { get }
    var checkInTime : Date {get }
    var discountCoupon : String? {get set}
    
}

struct Vehicles : Parkable , Hashable{
    
   
    var plate: String
    var vehicleType: VehicleType
    var checkInTime: Date
    var discountCoupon: String?
    lazy var parkedTime : Int = {
        let mins = Calendar.current.dateComponents([.minute], from: checkInTime, to: Date()).minute ?? 0
        return mins + 198 //Esse 198 é para atrasar o relógio e conseguir mostrar valr difrentes, já que a execução da de ParkedTime - checkInTime = 0
        
    }()
    
    //fazer com que plate seja uma chave unica tipo: CPF, RG, INDEX, codigo
    static func == (lhs: Vehicles, rhs: Vehicles) -> Bool {
        return lhs.plate == rhs.plate
        
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
}

var alkeParking = Parking()

let vehicle1 = Vehicles(plate: "AA111AA", vehicleType:VehicleType.car, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_001")
let vehicle2 = Vehicles(plate: "B222BBB", vehicleType:VehicleType.motorcycle, checkInTime: Date(), discountCoupon: nil)
let vehicle3 = Vehicles(plate: "CC333CC", vehicleType:VehicleType.minibus, checkInTime: Date(), discountCoupon:nil)
let vehicle4 = Vehicles(plate: "DD444DD", vehicleType:VehicleType.bus, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_002")
let vehicle5 = Vehicles(plate: "AA111BB", vehicleType:VehicleType.car, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_003")
let vehicle6 = Vehicles(plate: "B222CCC", vehicleType:VehicleType.motorcycle, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_004")
let vehicle7 = Vehicles(plate: "CC333CC", vehicleType:VehicleType.minibus, checkInTime: Date(), discountCoupon: nil)
let vehicle8 = Vehicles(plate: "DD444EE", vehicleType:VehicleType.bus, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_005")
let vehicle9 = Vehicles(plate: "AA111CC", vehicleType:VehicleType.car, checkInTime: Date(), discountCoupon: nil)
let vehicle10 = Vehicles(plate: "B222DDD", vehicleType:VehicleType.motorcycle, checkInTime: Date(), discountCoupon: nil)
let vehicle11 = Vehicles(plate: "CC333EE", vehicleType:VehicleType.minibus, checkInTime: Date(), discountCoupon:nil)
let vehicle12 = Vehicles(plate: "DD444GG", vehicleType:VehicleType.bus, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_006")
let vehicle13 = Vehicles(plate: "AA111DD", vehicleType:VehicleType.car, checkInTime: Date(), discountCoupon:"DISCOUNT_CARD_007")
let vehicle14 = Vehicles(plate: "B222EEE", vehicleType:VehicleType.motorcycle, checkInTime: Date(), discountCoupon: nil)
let vehicle15 = Vehicles(plate: "CC333FF", vehicleType:VehicleType.minibus, checkInTime: Date(), discountCoupon:nil)

let vehiclesToInteract = [vehicle1,vehicle2,vehicle3,vehicle4,vehicle5,vehicle6,vehicle7,vehicle8,vehicle9,vehicle10,vehicle11,vehicle12,vehicle13,vehicle14,vehicle15]

for i in vehiclesToInteract {
    alkeParking.insertVehicles(vehicle: i)
}
alkeParking.listVehicles()

//atrasa o inicio da funcao em tanto tempo
//DispatchQueue.main.asyncAfter(deadline: .now() + 100) {
//print("------😍--------")
alkeParking.checkOut("AA111AA")
alkeParking.checkOut("DD444EE")
alkeParking.checkOut("B222BBC")
alkeParking.listVehicles()

alkeParking.listEarnings()

alkeParking.insertVehicles(vehicle: vehicle10)

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
    let r = Double(sqrt(pow(cart.x,2)+pow(cart.y,2)))
    let phi = atan2(cart.y,cart.x)
    return (r,phi)
}

let coordinate = (x: -78.70524308742053, y: -39.243573777212724)
cartesianToPolar(coordinate)
