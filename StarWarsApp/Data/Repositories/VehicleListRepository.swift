//
//  VehicleListRepository.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class VehicleListRepository: VehicleListRepositoryProtocol {
    private let dataSource: APIVehicleListDataSourceProtocol
    private let domainMapper: VehicleDomainMapper
    private let errorMapper: StarWarsDomainErrorMapper
    
    init(dataSource: APIVehicleListDataSourceProtocol, errorMapper: StarWarsDomainErrorMapper, domainMapper: VehicleDomainMapper) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
        self.domainMapper = domainMapper
    }
    
    func getVehicleList() async -> Result<[Vehicle], StarWarsDomainError> {
        let result = await dataSource.getVehicleList()
        
        guard case .success(let vehicleList) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }

        return .success(domainMapper.map(vehicleResponseDTO: vehicleList))
    }
}
