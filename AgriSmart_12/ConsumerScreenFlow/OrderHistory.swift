import Foundation

struct OrderHistory: Codable {
    let orderId: String
    let items: [CartItem]
    let totalPrice: Double
    let shippingCost: Double
    let orderDate: Date
}
