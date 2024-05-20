##############LIBRERIAS###########################################
require 'csv'
require 'matrix'
############### RECIBIR CSV ######################################
data = []
data = CSV.read("data.csv")
############### FIN CSV ##########################################
################ INICIO NORMALIZACION ############################
def norm_minmax(x,min,max)
  return (x.to_f-min.to_f)/(max.to_f-min.to_f)
end
#Max y Min Edad
edad= []
for i in 0...data.length do
  edad[i] = data[i][1]
end
edadnorm = []
for i in 0...data.length do
  edadnorm[i] = norm_minmax(edad[i],edad.min,edad.max)
end
#Max y Min Altura
altura = []
for i in 0...data.length do
  altura[i] = data[i][2]
end
alturanorm = []
for i in 0...data.length do
  alturanorm[i] = norm_minmax(altura[i],altura.min,altura.max)
end
#Max y Min Peso 
peso= []
for i in 0...data.length do
  peso[i] = data[i][3].to_i
end
pesonorm = []
for i in 0...data.length do
  pesonorm[i] = norm_minmax(peso[i],peso.min,peso.max)
end
#Max y Min FCVC
FCVC = []
for i in 0...data.length do
  FCVC[i] = data[i][6].to_i
end
FCVCnorm = []
for i in 0...data.length do
  FCVCnorm[i] = norm_minmax(FCVC[i],FCVC.min,FCVC.max)
end
#Max y Min NCP
NCP = []
for i in 0...data.length do
  NCP[i] = data[i][7].to_i
end
NCPnorm = []
for i in 0...data.length do
  NCPnorm[i] = norm_minmax(NCP[i],NCP.min,NCP.max)
end
#Max y Min CH2O
CH2O = []
for i in 0...data.length do
  CH2O[i] = data[i][10].to_i
end
CH2Onorm = []
for i in 0...data.length do
  CH2Onorm[i] = norm_minmax(CH2O[i],CH2O.min,CH2O.max)
end
#Max y Min FAF
FAF = []
for i in 0...data.length do
  FAF[i] = data[i][12].to_i
end
FAFnorm = []
for i in 0...data.length do
  FAFnorm[i] = norm_minmax(FAF[i],FAF.min,FAF.max)
  
end 
#Max y Min TUE
TUE = []
for i in 0...data.length do
  TUE[i] = data[i][13].to_i
end
TUEnorm = []
for i in 0...data.length do
  TUEnorm[i] = norm_minmax(TUE[i],TUE.min,TUE.max)
end
#Fin Cuantitativos

#Variables Cualitativas

#Genero
genero = []
for i in 0...data.length do
  if data[i][0] == "Female"
    genero[i] = 1
  elsif data[i][0] == "Male"
    genero[i] = 0
  end
end

#HistoriadeFamiliaconSobrepeso
histfam = []
for i in 0...data.length do
  if data[i][4] == "yes"
    histfam[i] = 1
  else
    histfam[i] = 0
  end
end

#FAVC
FAVC = []
for i in 0...data.length do
  if data[i][5] == "yes"
    FAVC[i] = 1
  elsif data[i][5] == "no"
    FAVC[i] = 0
  end
end

#CAEC
CAEC = []
for i in 0...data.length do
  if data[i][8] == "no"
    CAEC[i] = 0
  elsif data[i][8] == "Sometimes"
    CAEC[i] = 0.33
  elsif data[i][8] == "Frequently"
    CAEC[i] = 0.66
  elsif data[i][8] == "Always"
    CAEC[i] = 1
  
  end
end

#FUMAR
SMOKE = []
for i in 0...data.length do
  if data[i][9] == "yes"
    SMOKE[i] = 1
  elsif data[i][9] == "no"
    SMOKE[i] = 0
  end
end

#SCC
SCC = []
for i in 0...data.length do
  if data[i][11] == "yes"
    SCC[i] = 1
  elsif data[i][11] == "no"
    SCC[i] = 0
  end
end

#CALC
CAlC = []
for i in 0...data.length do
  if data[i][14] == "no"
    CAlC[i] = 0
  elsif data[i][14] == "Sometimes"
    CAlC[i] = 0.33
  elsif data[i][14] == "Frequently"
    CAlC[i] = 0.66
  elsif data[i][14] == "Always"
    CAlC[i] = 1
  
  end
end
#MTrans
MTrans = []
for i in 0...data.length do
  if data[i][15] == "Walking"
    MTrans[i] = 0
  elsif data[i][15] == "Bike"
    MTrans[i] = 0.25
  elsif data[i][15] == "Public_Transportation"
    MTrans[i] = 0.5
  elsif data[i][15] == "Motorbike"
    MTrans[i] = 0.75
  elsif data[i][15] == "Automobile"
    MTrans[i] = 1
  end
end
#################### FIN NORMALIZACION #############################

#################### INICIO TRATAMIENTO DATOS #######################

#Declarar matriz que recibirá todos los datos 
data2 = Array.new(data.length){Array.new(16,0)}

for i in 0...data.length do 
  data2[i][0] = genero[i]
  data2[i][1] = edadnorm[i]
  data2[i][2] = alturanorm[i]
  data2[i][3] = pesonorm[i]
  data2[i][4] = histfam[i]
  data2[i][5] = FAVC[i]
  data2[i][6] = FCVCnorm[i]
  data2[i][7] = NCPnorm[i]
  data2[i][8] = CAEC[i]
  data2[i][9] = SMOKE[i]
  data2[i][10] = CH2Onorm[i]
  data2[i][11] = SCC[i]
  data2[i][12] = FAFnorm[i]
  data2[i][13] = TUEnorm[i]
  data2[i][14] = CAlC[i]
  data2[i][15] = MTrans[i]
end
#Recibir clasificacion del csv inicial en el orden dado
#Clasificacion
clasificacion = []
for i in 0...data.length do
  clasificacion[i] = data[i][16]
end
 
################## INICIO INPUT USUARIO ##########################
input = []
user = []
=begin
puts("Ingrese Genero (Male/Female):")
input[0] = gets
puts("Ingrese Edad:")
input[1] = gets
puts("Ingrese Altura (en metros):")
input[2] = gets
puts("Ingrese Peso (en kilos):")
input[3] = gets
puts("Su familia tiene historia de sobrepeso? (yes/no):")
input[4] = gets
puts("¿Consume usted comida con carga alta carga calórica? (yes/no):")
input[5] = gets
puts("Frecuencia en su consumo de vegetales (1 , 2 o 3):")
input[6] = gets
puts("Cuantas comidas consume al día (1 , 2 , 3 o 4):")
input[7] = gets
puts("Con que frecuencia come en medio de sus comidas (no, Sometimes, Frequently, Always) ")
input[8] = gets
puts("¿Fuma? (yes/no)")
input[9] = gets
puts("Cuantifique su consumo de agua al día (1 , 2 o 3)")
input[10] = gets
puts("¿Monitorea su consumo calórico? (yes/no)")
input[11] = gets
puts("Cuantifique su frecuencia de actividad física (0 , 1 , 2 o 3)")
input[12] = gets
puts("Cuantifique su frecuencia de uso de dispositivos electrónicos (0 , 1 o 2)")
input[13] = gets
puts("Con que frecuencia consume alcohol(no, Sometimes, Frequently, Always)")
input[14] = gets
puts("Finalmente. ¿Cuál es su método de transporte usual?(Walking, Bike, 
Public_Transportation, MotorBike, Automobile)")
input[15] = gets
=end
input = ["Male\n", "19\n", "1.80\n", "77\n", "yes\n", "no\n", "3\n", "4\n", "Frequently\n", "no\n", "3\n", "yes\n", "3\n", "2\n", "no\n", "Walking\n"]
#input = ["Male\n", "23\n", "1.76\n", "60\n", "yes\n","no\n", "2\n", "3\n", "no\n", "no\n","3\n","\no","2\n","2\n","Sometimes\n","Walking\n"]

if input[0] == "Female\n"
  user[0] = 1
elsif input[0] == "Male\n"
  user[0] = 0
end

user[1] = norm_minmax(input[1],edad.min,edad.max)
user[2] = norm_minmax(input[2],altura.min,altura.max)
user[3] = norm_minmax(input[3],peso.min,peso.max)

if input[4] == "yes\n"
  user[4] = 1
else
  user[4] = 0
end
  
if input[5] == "yes\n"
  user[5] = 1
elsif input[5] == "no\n"
  user[5] = 0
end

user[6] = norm_minmax(input[6],FCVC.min,FCVC.max)
user[7] = norm_minmax(input[7],NCP.min,NCP.max)

if input[8] == "no\n"
  user[8] = 0
elsif input[8] == "Sometimes\n"
  user[8] = 0.33
elsif input[8] == "Frequently\n"
  user[8] = 0.66
elsif input[8] == "Always\n"
  user[8] = 1  
end

if input[9] == "yes\n"
  user[9] = 1
elsif input[9] == "no\n"
  user[9] = 0
end  
user[10] = norm_minmax(input[10],CH2O.min,CH2O.max)

if input[11] == "yes\n"
  user[11] = 1
elsif input[11] == "no\n"
  user[11] = 0
end
user[12] = norm_minmax(input[12],FAF.min,FAF.max)
user[13] = norm_minmax(input[13],TUE.min,TUE.max)

if input[14] == "no\n"
  user[14] = 0
elsif input[14] == "Sometimes\n"
  user[14] = 0.33
elsif  input[14] == "Frequently\n"
  user[14] = 0.66
elsif input[14] == "Always\n"
  user[14] = 1
end

if input[15] == "Walking\n"
  user[15] = 0
elsif input[15] == "Bike\n"
  user[15] = 0.25
elsif input[15] == "Public_Transportation\n"
  user[15] = 0.5
elsif input[15] == "Motorbike\n"
  user[15] = 0.75
elsif input[15] == "Automobile\n"
  user[15] = 1
end

test = user
#################### FIN INPUT USUARIO #####################
#Distancia euclidiana del usuario y data de entrenamiento


def eucli (data,test,pos)
  sum = 0
  cuadrado = 0
  for i in 0...16 do
    cuadrado = (data[pos][i] - test[i].to_f)**2
    sum +=cuadrado
  end
  return sum
end
#Ordenar data
data2orden = data2
#Creación de dataset con posiciones, clasificaciones y distancias euclidianas
def dataset(ordenCal,clasificacion,data2orden,test)
  for i in 0...data2orden.length do
    ordenCal[i][0] = i
    ordenCal[i][1] = clasificacion[i]
    ordenCal[i][2] = eucli(data2orden,test,i)
  end 
  return ordenCal
end
#Búsqueda de la distancia mínima entre el data set y el input de usuario
def minvalor(data)
  minval = 1000.000
  pos = 1000000.00
  for i in 0...data.length do
    if data[i][2] < minval
      minval = data[i][2]
      pos = i
    end
  end
#Retornar posicion en el arrglo: Ej. Pos = 1; Pos = 320
  return pos
end

#KNN recibe la posicion recibida por minvalor. Y retorna el valor de clasificacion
#que se encuentra en esa posicion
def knn(clasificacion,data2orden,test,k)
  res = []
  distancia = Array.new(data2orden.length){Array.new(3,0)}
  distancia = dataset(distancia,clasificacion,data2orden,test)
  for i in 0...k do
    mindis = minvalor(distancia)
    puts(mindis)
    res[i] = distancia[mindis][1]
    puts(res[i])
    distancia[mindis][2] = 10000
  end
  puts(clasificadoK(res))
  return res
end

def clasificadoK (res)
  val = res
  cont = Array.new(7,0)
  sum = Array.new(7,0)
  for i in 0...res.length do
    if res[i] == "Insufficient_Weight"
      cont[0]+=1
      sum[0]+=i
    elsif res[i] == "Normal_Weight"
      cont[1]+=1
      sum[1]+=i
    elsif res[i] == "Overweight_Level_I"
      cont[2]+=1
      sum[2]+=i
    elsif res[i] == "Overweight_Level_II"
      cont[3]+=1
      sum[3]+=i
    elsif res[i] == "Obesity_Type_I"
      cont[4]+=1
      sum[4]+=i
    elsif res[i] == "Obesity_Type_II"
      cont[5]+=1
      sum[5]+=i
    elsif res[i] == "Obesity_Type_III"
      cont[6]+=1
      sum[6]+=i
    end  
  end
  maxc = 0
  for i in 0...cont.length do
    if maxc < cont[i] 
      maxc = cont[i]
    end
  end
  minc = 10000000
  pos = -1
  for i in 0...cont.length do
    if cont[i] == maxc
      if minc > sum[i]
        minc = sum[i]
        pos = i
      end
    end
  end
  clas = ""
  if pos == 0
    clas = "Insufficient_Weight"
  elsif pos == 1
    clas = "Normal_Weight"
  elsif pos == 2
    clas = "Overweight_Level_I"
  elsif pos == 3
    clas = "Overweight_Level_II"
  elsif pos == 4
    clas = "Obesity_Type_I"
  elsif pos == 5
    clas = "Obesity_Type_II"
  elsif pos == 6
    clas = "Obesity_Type_III"
  end
  return clas
end    
############FIN TRATAMIENTO##############################
#Prueba
res = knn(clasificacion,data2orden,test,7)