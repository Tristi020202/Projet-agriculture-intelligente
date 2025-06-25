% Connexion à la base de données
conn = database('connexion', 'root', 'Bancada2025!');

if isopen(conn)
    disp('✅ Connexion ODBC réussie.');
else
    error('❌ Échec de la connexion ODBC : %s', conn.Message);
end

% Connexion à l'automate 

try
    m = modbus('tcpip','10.30.236.8',502,'Timeout',5,'NumRetries',2);
    error = 0;
catch
    try
        delete(m)
        m = modbus('tcpip','10.30.236.8',502,'Timeout',5,'NumRetries',2);
        error = 0;
    catch
        disp("❌ Erreur de connexion au PLC");
        error = 1;
    end
end

% valeur = 42;  % Remplace ceci par la valeur réelle que tu veux insérer
% 
% % Requête SQL d'insertion dans la table "test"
% sqlquery = sprintf("INSERT INTO test (val) VALUES (%d)", valeur);

% while true
%% Lecture des capteurs
    % Bombillas
    estBombilla1 = readBombilla1(m); 
    estBombilla2 = readBombilla2(m);
    estBombilla3 = readBombilla3(m);
    estBombilla4 = readBombilla4(m);

     % Électrovanne
     estQ17 = readQ17(m); 
 
     % Ventilateur
     estCViento = readCViento(m);
 
     % Capteurs de charge
     estSCarga1 = readSCarga1(m);
     estSCarga2 = readSCarga2(m);
     estSCarga3 = readSCarga3(m);
     estSCarga4 = readSCarga4(m);

     
 
%     % Vitesse du vent (anémomètre)
     estSViento = readSViento(m);

     
     % Radiation
     estSRadiacion = readSRadiacion(m);
 
     % Humidité et température
     estSHum1 = readHum1(m);
     estSHum2 = readHum2(m);
     estSTemp1 = readTemp1(m);
     estSTemp2 = readTemp2(m);
 
     % Horodatage
     currentDate = datestr(now, 'yyyy-mm-dd HH:MM:SS');


     sqlquery = sprintf("INSERT INTO medicion (bombilla1, bombilla2, bombilla3, bombilla4, electrovalvula, VoltVentilador, carga1, carga2, carga3, carga4, VelocidadViento, radiacion, humedad1, humedad2, temperatura1, temperatura2, date) VALUES (%d, %d, %d, %d, %d, %2f, %2f, %2f, %2f, %2f, %2f, %d, %2f, %2f, %2f, %2f, '%s')", estBombilla1, estBombilla2, estBombilla3, estBombilla4, estQ17, estCViento, estSCarga1, estSCarga2, estSCarga3, estSCarga4, estSViento, estSRadiacion, estSHum1, estSHum2, estSTemp1, estSTemp2, currentDate);

% Affichage et exécution
disp("🔍 Requête SQL test :")
disp(sqlquery)

try
    exec(conn, sqlquery);
    disp("✅ Requête test insérée avec succès dans la base de données.");
catch e
    warning("⚠️ Erreur lors de l'insertion test : %s", e.message);
end

% Fermeture de la connexion
close(conn);

% disp("⏳ Attente de 5 minutes avant la prochaine insertion...");
%     pause(10)
% end

