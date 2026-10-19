//
//  README.md
//  
//
//  Created by Fernando Negrete Pimentel on 19/10/26.
//

# SinGleton
## Problema
Garantizar que solo exista una sola instancia de una clase y darle un punto de acceso global
## Solución
Crear una clase donde se maneje el acceso de una instancia a un archivo o recurso(configuracion, cache, etc) para que se mantenga la consistencia y no existan duplicidades
## Diagrama
┌──────────────────────────────┐
│ Logger │
├──────────────────────────────┤
│ + static let shared: Logger │ <- única instancia
│ - init() │ <- constructor privado
├──────────────────────────────┤
│ + log(
_
message: String) │
└──────────────────────────────┘
## Cuándo usarlo
cuando necesitas garantizar que una clase tenga una única instancia en toda la aplicación y proporcionar un punto de acceso global a ella
## Cuándo evitarlo
- cuando actúe como una variable global disfrazada o comprometa la calidad del código
- Interfaces gráficas, usar Singletons para comunicar pantallas genera dependencias invisibles y difíciles de mantener.
## Relación con otros patrones
## Lo que aprendí / errores que cometí
Que es un patron muy usado, pero esto aumenta complejidad a los test porque genera un acoplamiento oculto y un estado general compartido, esto puede impedir el aislamiento de componentes o difulcar crear mocks para la creacion de los test.
Cometi el error de generar una función en vez de una clase para la parte final del ejercicio lo cual no hacia el correcto funcionamiento del singleton, al darme cuenta lo solucione y puede correr los test, al igual al crear el proyecto me falto crear la carpeta de Test o lo quite y me toco crearlo a mano y agregarlo al package.
