//
//  VehicleDomainMapper.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class VehicleDomainMapper {
    func map(
        vehicleResponseDTO: VehicleResponseDTO
    ) -> [Vehicle] {
        var vehicles : [Vehicle] = []
        vehicleResponseDTO.results
            .forEach{vehicle in
                vehicles
                    .append(
                        Vehicle(
                            name: vehicle.name,
                            model: vehicle.model,
                            manufacturer: vehicle.manufacturer,
                            costInCredits: vehicle.costInCredits,
                            length: vehicle.length,
                            maxAtmospheringSpeed: vehicle.maxAtmospheringSpeed,
                            crew: vehicle.crew,
                            passengers: vehicle.passengers,
                            cargoCapacity: vehicle.cargoCapacity,
                            consumables: vehicle.consumables,
                            vehicleClass: vehicle.vehicleClass,
                            url: vehicle.url
                        )
                    )
            }
        return vehicles
    }
}
