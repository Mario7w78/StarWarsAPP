//
//  GetVehiclesListUseCase.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class GetVehicleListUseCase: GetVehicleListUseCaseProtocol {
    private let repository: VehicleListRepositoryProtocol
    
    init(repository: VehicleListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Vehicle], StarWarsDomainError> {
        
        let result = await repository.getVehicleList()
        
        guard let vehicleList = try? result.get() else {
            guard case .failure(let error ) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        return .success(vehicleList)
    }
}
