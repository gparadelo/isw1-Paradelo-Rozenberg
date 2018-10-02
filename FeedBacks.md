

00 - Peano:
- Que corran los tests.
- Los mensajes deben estar categorizados.
- No debe haber código comentado en los métodos
    - Para eso está el versionado: botón 'versions', ver todas las implementaciones de.

-  Usar nombre de colaboradores de mensajes mas declarativos
      - Ej:Usar unNumeroDePeano para los mensajes de operaciones aritmeticas y de comparacion en vez de unMultiplicador o unSumando.
- Sacar IFs



01 - CodigoRepetido:
- Les faltó incorporar el timeLimit a su abstracción para medir el tiempo de ejecución de un bloque. Luego tampoco hacia falta colocar la palabra "milliseconds" en el mensaje, pues se envía a la cantidad junto a la unidad como colaborador y la abstracción creada es más útil y generica.
- Con respecto al código repetido de los tests 03, 04, 07, 08, lamentablemente no reificaron la parte más importante para darle significado a la nueva abstracción, que era incorporar al self fail a la misma. Para nosotros, el código repetido sigue existiendo.
- En smalltalk siempre escribimos los mensajes comenzando en minúscula.
- Les faltó categorizar los mensajes. Por ej. en CustomerTests podrían tener categorías "Assertions" para las nuevas abstracciones, y uno de "Setup" para el setUp...
- La categoría 'auxiliary' nunca va a ser un buen nombre en el contexto de la materia...
- Encontraron y utilizaron correctamente el mensaje setUp de TestCase...
- Se quedaron en la mitad en la reificación del código repetido del removeCustomer... La solución no les quedó clara, es más bien operacional a declarativa. Les faltó darse cuenta que podían enviar un closure para los casos en los que no se encontraba nada para eliminar. Como ese trabajo les quedó por la mitad, despues no vieron que tambien podían quitar el if en el suspend...


02 - Entero:
