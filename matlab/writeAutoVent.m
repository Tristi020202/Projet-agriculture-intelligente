function writeAutoVent(m,u)
%m es el objet modbus y u la acción de control,ponemos una valor para
%selectionar la velocidad que queremos
write(m,'coil',127,u);
end

