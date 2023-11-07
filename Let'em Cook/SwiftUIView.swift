import SwiftUI
import MapKit



struct UserMapView: View {
    
    @State private var position: MapCameraPosition = .automatic
    @State private var searchResults: [MKMapItem] = []
    @State private var selectedResult: MKMapItem?
    @State private var route: MKRoute?
    
    var body: some View {
        
        let searchRadius = CLLocationDistance(500.0)
        
        var travelTime: String? {
            guard let route else { return nil }
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .abbreviated
            formatter.allowedUnits = [.hour, .minute]
            return formatter.string(from: route.expectedTravelTime)
        }
        
        VStack{ // entire page stacked vertically
            HStack { // menu at the top
                Button {
                    search(for: "Grocery Store")
                } label: {
                    Label("Grocery Store", systemImage: "storefront")
                }.labelStyle(.iconOnly)
            }
            
            Map(selection: $selectedResult) { // Map section
                
                // User Location and Range Circle, green
                Annotation(
                    "",
                    coordinate: .campus,
                    anchor: .center
                ){
                    Image(systemName: "figure.wave")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(Color.green)
                        .cornerRadius(4.0)
                    
                }
                MapCircle(center: .campus, radius: searchRadius)
                    .foregroundStyle(.green.opacity(0.35))
                
                // Places markers in each position found during the search
                ForEach(searchResults, id: \.self) { result in
                    Marker(item: result);
                }
                
            }.frame(height: UIScreen.main.bounds.height*0.65).onChange(of: selectedResult) {
                getDirections() // gets approximate time to location every time a new location is selected
            }
            
            HStack{ // Bottom UI region, specific to location
                
                if(selectedResult == nil){
                    // Default Icon
                    RoundedRectangle(cornerRadius: 15).fill(Color.gray).frame(width: 112, height: 112)
                }else{
                    //Image
                    let storeName = selectedResult?.name
                    let imgUrl = getURLFromName(storeName: storeName ?? "None")
                    
                    AsyncImage(url: URL(string: imgUrl)){ image in image.resizable() } placeholder: { Color.gray } .frame(width: 112, height: 112) .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                VStack(alignment: .leading){
                    Text("\(selectedResult?.name ?? "Location")")
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    if let selectedResult {
                        Text("\(travelTime ?? "Travel Time")")
                    }
                    
                    Spacer()
                    
                }
                .padding([.top, .leading], 5.0)
                .frame(height: 100.0)
                Spacer()
                Button("Directions"){
                    
                    let selLat = selectedResult?.placemark.coordinate.latitude
                    let selLong = selectedResult?.placemark.coordinate.longitude
                    let url = URL(string: "maps://?saddr=&daddr=\(selLat),\(selLong)")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                }
                .padding(.trailing, 10.0)
                    
            }
            .padding([.top, .leading, .trailing], 10.0)
            
        }
    } // body
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: .campus, span: MKCoordinateSpan(latitudeDelta: 0.0035, longitudeDelta: 0.0035))
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    } //search
    
    func getDirections() {
        route = nil
        guard let selectedResult else { return }
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .campus))
        request.destination = selectedResult
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    } //getDirections
    
    func getURLFromName(storeName: String) -> String {
        if(storeName == "Safeway") {
            return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbfbZT7iJFEMkZCHxnZy-8GyzZJDdIBy3nCb8-GrI&s"
        }
        if(storeName == "Whole Foods Market") {
            return "https://www.locationscloud.com/wp-content/uploads/2023/06/5a0c75949642de34b6b65cfc.png"
        }
        if(storeName == "Sprouts Farmers Market") {
            return "https://assets.simpleviewinc.com/simpleview/image/upload/crm/boulder/sprouts-logo-e4e8d80f5056a36_e4e8d8cf-5056-a36a-071fb0c1945e7c79.png"
        }
        if(storeName == "Target") {
            return "https://corporate.target.com/getmedia/0289d38f-1bb0-48f9-b883-cd05e19b8f98/Target_Bullseye-Logo_Red_transparent.png?width=460"
        }
        
        //Catches all the rest
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsQphP7nQfQ2-DSNJlseIsCosU1v5M1HSMO1U9w3Pzlw&s"
    }
    
} //view (outer)

#Preview {
    UserMapView()
}

// campus is essentially acting as the user position right now because Swift cannot get our actual location

extension CLLocationCoordinate2D {
    static var campus = CLLocationCoordinate2D(latitude: 37.34748307563623, longitude: -121.93595919584234)
}
