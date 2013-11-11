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
class Matriz
	attr_reader :matriz, :filas, :columnas #crea los getters para los atributos
	
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
	def to_s(a)
		i = 0
		while (i < a.length)
			j = 0
			while (j < a.length)
				print " ", a[i][j], " "
				j += 1
			end
			print "\n"
			i += 1
		end
	end
	
# Producto de matrices
	def * (other)
		c = []
		i = 0
		while( i < @filas )
			j = 0
			fila = []
			while( j < @columnas )
				k = 0
				fila[j] = 0
				while( k < @filas)
					fila[j] += (@matriz[i][k] * other.matriz[k][j] )
					k += 1
				end
				j += 1
			end
			c << fila
			i += 1
		end
		#mostrar(c)
		return c
	end
	
# Suma de matrices
	def + (other)
	c = []
		i = 0
		while(i < @filas)
			j = 0
			fila = []
			while(j < @columnas)
				fila[j] = @matriz[i][j] + other.matriz[i][j]				
				j += 1
			end
		c << fila
		i += 1	
		end
		#mostrar(c)
		return c

	end
	
# Resta de matrices
	def - (other)
	c = []
		i = 0
		while(i < @filas)
			j = 0
			fila = []
			while(j < @columnas)
				fila[j] = @matriz[i][j] - other.matriz[i][j]				
				j += 1
			end
		c << fila
		i += 1	
		end
		#mostrar(c)
		return c

	end

	
end


m1 = Matriz.new(3,3)
m2 = Matriz.new(3,3)

print "\n"
puts "Suma de matrices:"
puts (m1 + m2).to_s

print "\n"
puts "Resta de matrices:"
puts (m1 - m2).to_s

print "\n"
puts "Producto de matrices:"
puts (m1 * m2).to_s

