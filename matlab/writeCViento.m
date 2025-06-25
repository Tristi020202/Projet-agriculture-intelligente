function writeCViento(m,u)
%m es el objet modbus y u la acción de control, 1 para encender, 0 para
%apagar
write(m,'holdingregs',207,u)
end

