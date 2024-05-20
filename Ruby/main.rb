require 'csv'
#Recibir  X y Y
#Sacar distancia entre X,Y y el punto 150 1.73; 0.35,0.7 Almacenar en un array
#Sort Array
#Dividir en 6 "partes"
#0-X1 = Insuficiente
#X1-X2 = Normal
#X2-X3 = Overweight 1
#X3-X4 = Overweight 2
#X4-x5 = Obesity 1
#X5-x6 = Obesity 2
#X6< = Obesity 3
def distancia(x2,y2)
  return Math.sqrt((x2-0.35)**2 + (y2-0.7)**2).to_f
end
#Altura max = 1.98 Altura min = 1.45
#Peso max = 179 Peso min = 39
def normalizaraltura(x)
  return (x-1.45)/(1.98-1.45).to_f
end
def normalizarpeso(y)
  return (y-39)/(179-39).to_f
end
puts(normalizarpeso(40).to_f)
data=[]
i = 0
File.open("Distancia.csv").each do |line|
  data[i] = line.to_f
  i+=1
end
data.sort
puts("Tamaño de secciones: ")

#X1 = 351
#X2 = 702
#X3 = 1053
#X4 = 1404
#X5 = 1755
#X6 = 2106
puts(data[0])
for i in 1...7 do
  puts(data[data.length/6 * i])
end
ingreso = 0
xalt = 0
ypeso = 0
while ingreso != -1 do
  puts("Ingrese su altura:")
  xalt = gets.to_f
  puts("Ingrese su peso:")
  ypeso = gets.to_f
  xnorm = normalizaraltura(xalt).abs
  ynorm = normalizarpeso(ypeso).abs
  dist = distancia(xnorm,ynorm).to_f
  puts(xnorm)
  puts(ynorm)
  puts(dist)
  if dist >= data[351]
    puts("Peso insuficiente")
  elsif dist < data[351] and dist >= data[702]
    puts("Peso normal")
  elsif dist < data[702] and dist >= data[1053]
    puts("Overweigth nivel 1")
  elsif dist < data[1053] and dist >= data[1404]
    puts("Overwight nivel 2")
  elsif dist < data[1404] and dist >= data[1755]
   puts("Obesidad nivel 1")
  elsif dist < data[1755] and dist >= data[2106]
    puts ("Obesidad nivel 2")
  elsif dist < data[2106]
    puts("Obesidad nivel 3")
  else
    puts ("Ingrese un valor mayor")
  end
  puts("Para salir ingrese -1 sino ingrese 0")
  ingreso = gets.to_i
end


