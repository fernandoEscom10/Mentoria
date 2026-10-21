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


# Nombre del patrón
## Problema
quieres crear objetos sin que el código cliente dependa de la clase concreta. El
cliente pide un producto y la fábrica decide cuál entregar .
## Solución
Crear una forma de hacer que no depenadamos de una sola clase para la creacion de un objeto, esto lo podemos ver el mismo problema el cliente piede un producato y la fabrica decide cual entregar, esto lo podemos ver como una forma de entrega, la entrega se puede hacer por avion, por barco, por camion o por bici por decir algo, pero la entrega sale del mismo punto pero lo que cambia es el metodo, pero el resultado de entrega es el mismo.
## Diagrama
NotifierCreator (protocolo)     Notifier (protocolo)
+ makeNotifier() -> Notifier ─────▶ + send(to:)
       ▲                                ▲
┌──────┴───────┐                ┌───────┴────────┐
EmailCreator  PushCreator    EmailNotifier   PushNotifier
## Ejemplo en Swift
(Enlace al archivo en Sources/ y fragmento clave.)
## Cuándo usarlo
No conoces de antemano el tipo exacto de objeto que vas a necesitar: Si los tipos exactos de objetos y sus dependencias se determinan en tiempo de ejecución (por ejemplo, mediante configuración, parámetros del usuario o estado de la aplicación).

Quieres centralizar la lógica de instanciación: Evita duplicar bloques de código con new o inicializadores complejos esparcidos por todo el proyecto. Si la forma de crear un objeto cambia, solo modificas la Factory.

Ssigues el principio de Abierto/Cerrado (SOLID): Puedes introducir nuevos tipos de productos en el sistema sin romper el código existente que los consume.

Deseas reutilizar recursos o gestionar el ciclo de vida: Si crear un objeto requiere una inicialización costosa, configuración previa, o si quieres devolver instancias reutilizadas (como un pool o singleton), la Factory se encarga de esa complejidad sin que el cliente lo note.
## Cuándo evitarlo
Clases simples e inmutables: Si un objeto solo requiere un inicializador directo con pocos argumentos (por ejemplo, new User("Juan")), usar una Factory agrega abstracciones y complejidad innecesarias.

Proyectos pequeños o estáticos: Si no hay probabilidad de que los tipos de objetos o sus reglas de creación cambien, instanciar directamente es suficiente.
## Relación con otros patrones
Abstract Factory
Relación: Los métodos de una Abstract Factory suelen implementarse internamente usando Factory Methods.

Diferencia:

Factory Method se enfoca en crear un solo producto mediante herencia o un método individual.

Abstract Factory se enfoca en crear familias de productos relacionados (ej. un conjunto de controles UI para iOS vs. Android) mediante composición.

SINGLETON
Relación: Las clases Factory a menudo se implementan como Singletons si solo se necesita una única instancia de la fábrica en toda la aplicación para gestionar la creación de objetos.
## Lo que aprendí / errores que cometí
Aprendi la diferencia entre este metodo y el singleton, pude antender como se crea y porque me confundia o me causaba conflicto por que se utilizaba la abstraccion por protocolos y como es que se utilizaban, ahora entiendo que se necestia un punto intermedio donde se define el camino a tomar, ya que la creación del objeto tiene que ser transaparente, y el valor que diferencia el camino a tomar normalmente se difene por un estado o un valor que se obtiene en la ejecución y esto va definiendo que otras acciones tomar, todavia me confunde un poco la abstracción de este patron, tendria que aplicarlo y entender un ejemplo más para entenderlo al 100.
