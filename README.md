Práctica9
------------

Gema de Ruby para representar matrices densas y dispersas.

Diseño
----------
    - Se pensado establecer una jerarquía de tal forma que la clase base será Matriz y sus sublclases serán Matriz_Densa y Matriz_Dispersa.
    - La representación de la matriz dispersa se realizará a través de tres vectores auxiliares:
        elementos[] : vector que almacena los elementos no nulos de la matriz.
        col_elem[] : vector que almacena la columna de cada elemento de la matriz.
        elem_no_nulos[] : vector que almacena el número de elementos no nulos en cada fila.
    - De esta forma, no hace falta tener un vector que almacene la columna de cada elemento, teniendo así un vector más pequeño y ahorrando memoria.
    - Para recorrer la matriz, se va accediendo al vector elementos, se selecciona su columna del vector col_elem y con elem_no_nulos se va comprobando si hay o no más elementos a recorrer en esa fila. Si no, se salta a la siguiente.
    - A la hora de las operaciones, ya se ha implementado la posibilidad de operaciones entre numeros y fracciones, si se diera el caso.


Instalación
------------

    1. Añada esta línea al fichero Gemfile de su aplicación:

        gem 'Practica9'

    2. Y a continuación ejecute:

        $ bundle

    3. O instale manualmente:

        $ gem install Practica9

    
