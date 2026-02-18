//
//  GetVehiclesByFilmListUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class GetVehicleByFilmListUseCase: GetVehicleByFilmUseCaseProtocol {
    private let repository: VehicleListRepositoryProtocol
    
    init(repository: VehicleListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(filmVehicleUrl: [String]) async -> Result<[Vehicle], StarWarsDomainError> {
        
        let result = await repository.getVehicleList()
        
        guard let vehicleList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        let filmVehicleUrl = vehicleList.filter{ filmVehicleUrl.contains($0.url)}
        
        return .success(filmVehicleUrl)
    }
}
