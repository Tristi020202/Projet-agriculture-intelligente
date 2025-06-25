%% lectura de bombillas
estBombilla1 = readBombilla1(m);
estBombilla2 = readBombilla2(m);
estBombilla3 = readBombilla3(m);
estBombilla4 = readBombilla4(m);
%% lectura electrovalvula
estQ17 = readQ17(m);
estEV = readEstEV(m);

%% lectura control del ventilador
estCViento = readCViento(m);

%% lectura sensores de cargas
readSCargaFuncs = {@readSCarga1, @readSCarga2, @readSCarga3, @readSCarga4};

for i = 1:4
    estSCarga{i} = readSCargaFuncs{i}(m);
    disp(estSCarga{i})
end
%% lectura Sensor de viento
estSViento = readSViento(m);

%% lectura Sensor de radiacion
estSRadiacion = readSRadiacion(m);

%% lectura sensores de humedad
estSHum1 = readHum1(m);
estSHum2 = readHum2(m);
estSTemp1 = readTemp1(m);
estSTemp2 = readTemp2(m);
%% lectura de los modos auto
estautoEV = readautoEV(m);
estreadAutoVent = readAutoVent(m);
estAutoLuces = readAutoLuces(m);

%% imprimir lecturas
disp("estBombilla1 =" + estBombilla1)
disp("estBombilla2 =" + estBombilla2)
disp("estBombilla3 =" + estBombilla3)
disp("estBombilla4 =" + estBombilla4)
disp("estCViento =" + estCViento +"V")
disp("estAutoEV =" + estautoEV)
disp("estQ17 =" + estQ17)
if estEV == 0
            disp("La electrovalvula esta cerada")
end
if estEV == 1
            disp("La electrovalvula esta abierta")
end
disp("estSViento =" + estSViento + "km/h")
disp("estSRadiacion =" + estSRadiacion)
disp("estAutoLuces =" + estAutoLuces)
disp("estreadAutoVent =" + estreadAutoVent)
disp("estSHum1 =" + estSHum1)
disp("estSHum2 =" + estSHum2)
disp("estSTemp1 =" + estSTemp1+"ºC")
disp("estSTemp2 =" + estSTemp2+"ºC")