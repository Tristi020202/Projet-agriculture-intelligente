function writeQ17(m,u)
%m es el objet modbus y u la acción de control, 1 para encender, 0 para
%apagar
write(m,'coil',122,u);
end

