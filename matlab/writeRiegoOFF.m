function writeRiegoOFF(m,u)
%m es el objet modbus y u la acción de control, 1 para encender, 0 para
%apagar
write(m,'coil',131,u);
end

