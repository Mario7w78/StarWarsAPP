//
//  CharacterDomainMapper.swift
//  StarWarsApp
//
//  Created by Mario on 18/02/26.
//


class CharacterDomainMapper {
    func map(
        characterResponseDTO: CharacterResponseDTO
    ) -> [Character] {
        var characters : [Character] = []
        characterResponseDTO.results
            .forEach{character in
                characters.append(
                        Character(
                            name: character.name,
                            height: character.height,
                            mass: character.mass,
                            hairColor: character.hairColor,
                            skinColor: character.skinColor,
                            eyeColor: character.eyeColor,
                            birthYear: character.birthYear,
                            gender: character.gender,
                            url: character.url
                        )
            )
        }
        return characters
    }
}


