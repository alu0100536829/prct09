=begin
*******************************************************************************************
* Autores: 
       Teno González Dos Santos
       Albano José Yanes Reyes
* Fecha: 23/10/2013 -
* Asignatura: Lenguujes y Paradigmas de Programación
* Tercero de Grado en Ingeniería Informática
* Universidad de la Laguna
*
* Practica 08: Considere el desarrollo de una clase Ruby para representar Matrices. 
1.-) Cree una clase para representar Matrices usando desarrollo dirigido por pruebas 
    (Test Driven Development - TDD) con la herramienta Rspec. 
2.-) Se ha es seguir la metodología de Integración continua (Continuos Integration) 
     usando la herramienta Travis. 
3.-) Además se ha de comprobar el funcionamiento de la aplicación con la herramienta 
    Guard de comprobación continua (Continuous testing) de manera que permita la 
    ejecución de las pruebas definidas con rspec cuando se modifiquen. 
********************************************************************************************
=end
#Clase Matriz

require "./fraccion.rb"

class Matriz
	attr_reader :filas, :columnas #crea los getters para los atributos
	attr_accessor :matriz	#matriz accesible para poder meterle valores fuera del initialize
	
	#Método para crear matriz con valores introducidos por teclado
	def initialize

		#inicializamos las variables
		@matriz = []
		
		#inicializamos la matriz por teclado
		print "Inserte numero de filas (y columnas): "
		while(	(@filas = gets.to_i) < 1)
			print "Error, intentelo de nuevo: "
		end
		
		#mismas columnas que filas al ser matriz cuadrada
		@columnas = @filas
		
		#comprobamos que los datos de entradas sean numericos
		raise unless filas.is_a?(Numeric)
		raise unless columnas.is_a?(Numeric)
		
		puts "Elementos de la matriz: "
		asignar_matriz_teclado(@matriz, @filas)
		mostrar(@matriz)
		
		
	end
	
	#Método para crear matriz con valores predefinidos
	def initialize(fil, col)

		#comprobamos que los datos de entradas sean numericos
		raise unless fil.is_a?(Numeric)
		raise unless col.is_a?(Numeric)
		
		#inicializamos las variables
		@filas, @columnas = fil, col
		@matriz = []
		
		#inicializamos valores fijos de matriz
		valor = 1
		for i in (0..fil-1)
				@matriz[i] = []
				for j in (0..col-1)
						@matriz[i][j] = valor
						valor +=  1
				end
		end
		
		#puts "Elementos de la matriz: "
		#mostrar(@matriz)
		
	end
	
	#Método para crear matriz con valores predefinidos
	def initialize(fil, col, a, b)

		#comprobamos que los datos de entradas sean numericos
		raise unless fil.is_a?(Numeric)
		raise unless col.is_a?(Numeric)
		
		#inicializamos las variables
		@filas, @columnas = fil, col
		@matriz = []
		
		#inicializamos valores fijos de matriz
		
		for i in (0..fil-1)
				@matriz[i] = []
				for j in (0..col-1)
						@matriz[i][j] = Fraccion.new(a,b)
						a += 1
						b += 1
				end
		end
		
		#puts "Elementos de la matriz: "
		#mostrar(@matriz)
		
	end
	
	
# Método para introducir los valores de la matriz por teclado
	def asignar_matriz_teclado(a,filas)
		i = 0
		while( i < filas ) 
			j = 0
			fila = []
			while(j < filas)
				print "Inserte elemento ", i,",", j, ": "
				fila << gets.to_f
				j += 1
			end
			a << fila
			i += 1
		end
	end


# Método que muestra la matriz
	def mostrar
		i = 0
		while (i < @filas)
			j = 0
			while (j < @columnas)
				print " ", @matriz[i][j], " "
				j += 1
			end
			print "\n"
			i += 1
		end
	end
	
# Producto de matrices
	def * (other)
		c = Matriz.new(@filas,@filas,1,1)
		i = 0
		while( i < @filas )
			j = 0
			while( j < @columnas )
				k = 0
				c.matriz[i][j] = Fraccion.new(0,1)
				while( k < @filas)
					c.matriz[i][j] += (@matriz[i][k] * other.matriz[k][j] )
					k += 1
				end
				j += 1
			end
			i += 1
		end
		#mostrar(c)
		return c
	end
	
# Suma de matrices
	def + (other)
	    c = Matriz.new(@filas,@columnas,1,1)
	    i = 0
	    while(i < @filas)
		    j = 0
		    while(j < @columnas)
			    c.matriz[i][j] = @matriz[i][j] + other.matriz[i][j]				
			    j += 1
		    end
	    i += 1	
	    end
	    #mostrar(c)
	    return c

	end
	
# Resta de matrices
	def - (other)
	    c = Matriz.new(@filas,@columnas,1,1)
		i = 0
		while(i < @filas)
			j = 0
			while(j < @columnas)
				c.matriz[i][j] = @matriz[i][j] - other.matriz[i][j]				
				j += 1
			end
		i += 1	
		end
		#mostrar(c)
		return c

	end

	
end


m1 = Matriz.new(3,3,1,1)
m2 = Matriz.new(3,3,1,1)

print "\n"
m1.mostrar
print "\n"
m2.mostrar

print "\n"

(m1 + m2).mostrar
print "\n"

(m1 - m2).mostrar
print "\n"
(m1 * m2).mostrar
print "\n"
