import Foundation
struct SampleData {
    // Sample data for 5 farmers
    static let farmers: [User] = [
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "John Farmer",
                username: "john123",
                email: "john@example.com",
                contactNumber: "9876543210",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date().addingTimeInterval(-2 * 365 * 24 * 60 * 60),
                profileImageUrl: nil,
                defaultAddress: Address(
                    fullName: "John Farmer",
                    addressLine1: "123 Greenfield Lane",
                    addressLine2: nil,
                    city: "Mumbai",
                    state: "Maharashtra",
                    zipCode: "400001",
                    contactNumber: "9876543210"
                ),
                savedAddresses: []
            ),
            settings: UserSettings(pushNotificationsEnabled: true, darkModeEnabled: false, emailNotificationsEnabled: true),
            status: .online,
            metrics: UserMetrics(postCount: 5, commentCount: 3, isTopContributor: false, rating: 4.5, reviewCount: 10)
        ),
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Alice Grower",
                username: "alice_grower",
                email: "alice@example.com",
                contactNumber: "9876543211",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date().addingTimeInterval(-1 * 365 * 24 * 60 * 60),
                profileImageUrl: nil,
                defaultAddress: Address(
                    fullName: "Alice Grower",
                    addressLine1: "456 Orchard Drive",
                    addressLine2: "Near Green Park",
                    city: "Delhi",
                    state: "Delhi",
                    zipCode: "110001",
                    contactNumber: "9876543211"
                ),
                savedAddresses: []
            ),
            settings: UserSettings(pushNotificationsEnabled: true, darkModeEnabled: true, emailNotificationsEnabled: false),
            status: .offline,
            metrics: UserMetrics(postCount: 8, commentCount: 6, isTopContributor: true, rating: 4.7, reviewCount: 15)
        ),
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Raj Patel",
                username: "raj_patel",
                email: "raj@example.com",
                contactNumber: "9876543212",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date().addingTimeInterval(-3 * 365 * 24 * 60 * 60),
                profileImageUrl: nil,
                defaultAddress: Address(
                    fullName: "Raj Patel",
                    addressLine1: "789 Riverbend Road",
                    addressLine2: nil,
                    city: "Ahmedabad",
                    state: "Gujarat",
                    zipCode: "380001",
                    contactNumber: "9876543212"
                ),
                savedAddresses: []
            ),
            settings: UserSettings(pushNotificationsEnabled: false, darkModeEnabled: true, emailNotificationsEnabled: true),
            status: .lastSeen(Date().addingTimeInterval(-1 * 24 * 60 * 60)),
            metrics: UserMetrics(postCount: 12, commentCount: 9, isTopContributor: false, rating: 4.2, reviewCount: 20)
        ),
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Meera Shah",
                username: "meera_shah",
                email: "meera@example.com",
                contactNumber: "9876543213",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date().addingTimeInterval(-4 * 365 * 24 * 60 * 60),
                profileImageUrl: nil,
                defaultAddress: Address(
                    fullName: "Meera Shah",
                    addressLine1: "101 Harvest Hills",
                    addressLine2: "Apartment 203",
                    city: "Chennai",
                    state: "Tamil Nadu",
                    zipCode: "600001",
                    contactNumber: "9876543213"
                ),
                savedAddresses: []
            ),
            settings: UserSettings(pushNotificationsEnabled: true, darkModeEnabled: false, emailNotificationsEnabled: true),
            status: .online,
            metrics: UserMetrics(postCount: 15, commentCount: 12, isTopContributor: true, rating: 4.9, reviewCount: 30)
        ),
        User(
            id: UUID(),
            role: .farmer,
            profile: Profile(
                name: "Amit Verma",
                username: "amit_verma",
                email: "amit@example.com",
                contactNumber: "9876543214",
                dateOfBirth: Date(),
                countryRegion: "India",
                joinedDate: Date().addingTimeInterval(-5 * 365 * 24 * 60 * 60),
                profileImageUrl: nil,
                defaultAddress: Address(
                    fullName: "Amit Verma",
                    addressLine1: "222 Countryside View",
                    addressLine2: nil,
                    city: "Lucknow",
                    state: "Uttar Pradesh",
                    zipCode: "226001",
                    contactNumber: "9876543214"
                ),
                savedAddresses: []
            ),
            settings: UserSettings(pushNotificationsEnabled: false, darkModeEnabled: true, emailNotificationsEnabled: false),
            status: .lastSeen(Date().addingTimeInterval(-7 * 24 * 60 * 60)),
            metrics: UserMetrics(postCount: 10, commentCount: 8, isTopContributor: false, rating: 4.0, reviewCount: 12)
        )
    ]
    
    
    // Sample products for farmers
    static let products: [Product] = [
        Product(
            id: UUID(),
            name: "Tomatoes",
            category: .vegetables, // Updated category
            pricePerKg: 50,
            quantityAvailable: 100,
            originalQuantity: 100,
            description: "Fresh organic tomatoes.",
            imageNames: ["tomato"], // Updated to use imageNames
            imageUrls: [], // Not used anymore
            status: .available,
            expiryDate: Date().addingTimeInterval(7 * 24 * 60 * 60),
            farmerId: farmers[0].id,
            rating: 4.5,
            reviewsCount: 20,
            reviews: ["Very fresh and juicy", "Excellent taste"]
        ),
        Product(
            id: UUID(),
            name: "Mangoes",
            category: .fruits,
            pricePerKg: 120,
            quantityAvailable: 50,
            originalQuantity: 50,
            description: "Juicy Alphonso mangoes.",
            imageNames: ["mango"], // Updated to use imageNames
            imageUrls: [],
            status: .available,
            expiryDate: Date().addingTimeInterval(10 * 24 * 60 * 60),
            farmerId: farmers[1].id,
            rating: 4.8,
            reviewsCount: 30,
            reviews: ["Sweet and tangy", "Best mangoes I've ever had"]
        ),
        Product(
            id: UUID(),
            name: "Wheat",
            category: .grains,
            pricePerKg: 30,
            quantityAvailable: 500,
            originalQuantity: 500,
            description: "High-quality wheat grains.",
            imageNames: ["wheat"], // Updated to use imageNames
            imageUrls: [],
            status: .available,
            expiryDate: Date().addingTimeInterval(15 * 24 * 60 * 60),
            farmerId: farmers[2].id,
            rating: 4.4,
            reviewsCount: 25,
            reviews: ["Fine grains", "Very good quality wheat"]
        ),
        Product(
            id: UUID(),
            name: "Milk",
            category: .dairy,
            pricePerKg: 60,
            quantityAvailable: 200,
            originalQuantity: 200,
            description: "Fresh cow's milk.",
            imageNames: ["milk"], // Updated to use imageNames
            imageUrls: [],
            status: .available,
            expiryDate: Date().addingTimeInterval(3 * 24 * 60 * 60),
            farmerId: farmers[3].id,
            rating: 4.9,
            reviewsCount: 40,
            reviews: ["Fresh and creamy", "Best milk in town"]
        ),
        Product(
            id: UUID(),
            name: "Chilies",
            category: .spices,
            pricePerKg: 90,
            quantityAvailable: 20,
            originalQuantity: 20,
            description: "Spicy red chilies.",
            imageNames: ["chili"], // Updated to use imageNames
            imageUrls: [],
            status: .available,
            expiryDate: Date().addingTimeInterval(5 * 24 * 60 * 60),
            farmerId: farmers[4].id,
            rating: 4.3,
            reviewsCount: 15,
            reviews: ["Spicy and fresh", "Adds great flavor to dishes"]
        )
    ]
}
