clear all;
clc
%% crear objeto modbus
try
    m = modbus('tcpip','10.30.236.8',502,'Timeout',5,'NumRetries',2);
    error = 0;
catch except
    try
        delete(m)
        m = modbus('tcpip','10.30.236.8',502,'Timeout',5,'NumRetries',2);
        error = 0;
    catch exception
        disp("Error al conectar el plc")
        error = 1;
    end
end
%% variables de control
u_Bomb1 = 0;
u_Bomb2 = 0;
u_Bomb3 = 0;
u_Bomb4 = 0;
u_Viento = 0; % Voltage controlador (V) = Uviento/1000
u_AutoEV = 0;
u_AutoLuces = 1;
u_AutoViento = 0;
%% proceso de control
if u_Viento>4950
    u_Viento= 4950;
end
%% lectura de registros del PLC
disp("Estado inicial:")
read_PLC
%% escritura de registros del PLC
writeBombilla1(m,u_Bomb1)
writeBombilla2(m,u_Bomb2)
writeBombilla3(m,u_Bomb3)
writeBombilla4(m,u_Bomb4)
writeCViento(m,u_Viento)
writeAutoEV(m,u_AutoEV)
writeAutoLuces(m,u_AutoLuces)
writeAutoVent(m,u_AutoViento)
%% Pulsos para apertura y cerada de la electrovalvula
writeQ17(m,1)
pause(0.05)
writeQ17(m,0)
read_PLC
pause(5) %% temps en seconde
writeRiegoOFF(m,1)
pause(0.05)
writeRiegoOFF(m,0)

%volver a leer los datos
disp("Estado final:")
read_PLC
delete(m)