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
%% lectura de los sensores
slaveID = 1;

% 3. Lire l'humidité du sol (adresse du registre à confirmer dans la doc du capteur)
regAddress = 101 ; % À modifier en fonction du capteur
moisture = read(m, 'holdingregs', regAddress, 1, slaveID); 

% 4. Afficher l'humidité
disp(['Humidité du sol : ', num2str(moisture)]);
%delete m para rehacer todo
delete(m)