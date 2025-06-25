function estSCarga4 = readSCarga4(m)
SCarga4_bruto = read(m,'holdingregs',204,1,'uint16');
a=20/65535;
b=10-a*32767;
SCarga4_calibrado = a*SCarga4_bruto+b;
estSCarga4 = (SCarga4_calibrado*1000)/0.024;
end

