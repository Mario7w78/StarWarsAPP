//
//  NetworkManager.swift
//  StarWarsApp
//
//  Created by Mario on 29/01/26.
//

import Foundation

enum DomainError: Error {
    case invalidURL(description: String)
    case invalidData(description: String)
    case invalidJSON(description: String)
    case invalidResponse(description: String)
    case networkError(description: String)
    case unableToComplete(description: String)
}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    func execute (with error: Error){
        print(error.localizedDescription)
    }
    
    func getCharacters() async throws -> [Character] {
        
        
        guard let url = URL(string: "https://swapi.dev/api/people/") else {
            throw DomainError.invalidURL(description: "URL invalida")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
            }
            
            let characters = try JSONDecoder().decode(CharacterResponse.self, from: data)
            return characters.results
            
        }
        catch
        {
            throw DomainError.invalidJSON(description: "JSON invalido no se pudo decodificar en Characters - Characters")
        }
        
        
    }
    
    func getFilms() async throws -> FilmResponse{
        
        guard let url = URL(string: "https://swapi.dev/api/films/") else {
            throw DomainError.invalidURL(description: "URL invalida")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
            }
            
            let filmsWrapped = try JSONDecoder().decode(FilmResponse.self, from: data)
            return filmsWrapped
            
        }
        catch
        {
            throw DomainError.invalidJSON(description: "JSON invalido, no se pudo decodificar en Films")
        }
        
    }
    
    func getPlanets() async throws -> [Planet]{
        
        guard let url = URL(string: "https://swapi.dev/api/planets/") else {
            throw DomainError.invalidURL(description: "URL invalida")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
            }
            
            let planetResponse = try JSONDecoder().decode(PlanetResponse.self, from: data)
            
            return planetResponse.results
            
        } catch {
            throw DomainError.invalidJSON(description: "JSON invalido, no se pudo decodificar en Planet - Planets")
        }
        
        
    }
    
    
    func getVehicles() async throws -> [Vehicle]{
        
        guard let url = URL(string: "https://swapi.dev/api/vehicles/") else {
            throw DomainError.invalidURL(description: "URL invalida")
        }
        
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
            }
            
            let vehicleResponse = try JSONDecoder().decode(VehicleResponse.self, from: data)
            return vehicleResponse.results
            
        }
        catch {
            throw DomainError.invalidJSON(description: "JSON invalido, no se pudo decodificar en Vehicles")
        }
    }
    
    
    
    func getCharactersBySpecie(charactersURL: [String]) async throws -> [Character] {
        var characters: [Character] = []
        for character in charactersURL {
            
            guard let urlString = URL(string: character) else {
                throw DomainError.invalidURL(description: "Url invalido: \(character)")
            }
            
            do {
                
                let (data, response) = try await URLSession.shared.data(from: urlString)
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
                }
                
                let char = try JSONDecoder().decode(Character.self, from: data)
                characters.append(char)
                
            }
            catch{
                throw DomainError.invalidJSON(description: "JSON invalido no se pudo decodificar en Character - Characters by specie ")
            }
        }
        
        return characters
        
    }
    
    func getPlanetsByFilm(filmPlanetUrl: [String]) async throws -> [Planet]{
        
        var planets: [Planet] = []
        
        for url in filmPlanetUrl {
            
            guard let urlString = URL(string: url) else {
                throw DomainError.invalidURL(description: "Url invalido: \(url)")
            }
            
            do {
                
                let (data, response) = try await URLSession.shared.data(from: urlString)
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
                }
                
                let planet = try JSONDecoder().decode(Planet.self, from: data)
                planets.append(planet)
                
            }
            catch {
                throw DomainError.invalidJSON(description: "JSON invalido, no se puedo decodificar en Planet - Planets by films")
            }
        }
        
        return planets
    }
    
    func getSpeciesByFilm(filmSpecieUrl: [String]) async throws -> [Specie]{
        var species: [Specie] = []
        var count = 0
        
        for url in filmSpecieUrl {
            
            count += 1
            
            guard let urlString = URL(string: url) else {
                throw DomainError.invalidURL(description: "Url invalido: \(url)")
            }
            
            
            do {
                let (data, response) = try await URLSession.shared.data(from: urlString)
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
                }
                
                let specie = try JSONDecoder().decode(Specie.self, from: data)
                species.append(specie)
                
            }
            catch {
                throw DomainError.invalidJSON(description: "JSON invalido, no se puedo decodificar en Specie - Species by films - Numero de llamadas: \(count)")
            }
        }
        return species
    }
    
    
    
    func getVehiclesByFilm(filmVehicleUrl: [String]) async throws -> [Vehicle]{
        var vehicles: [Vehicle] = []
        
        for url in filmVehicleUrl {
            guard let urlString = URL(string: url) else {
                throw DomainError.invalidURL(description: "Url invalido: \(url)")
            }
            
            do {
                let (data, response) = try await URLSession.shared.data(from: urlString)
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw DomainError.invalidResponse(description: "Respuesta del servidor invalida")
                }
                
                let vehicle = try JSONDecoder().decode(Vehicle.self, from: data)
                vehicles.append(vehicle)
                
            }
            catch
            {
                throw DomainError.invalidJSON(description: "JSON invalido, no se puedo decodificar en Vehicle - Vehicles by films")
            }
        }
        return vehicles
    }
    
    
    
}
