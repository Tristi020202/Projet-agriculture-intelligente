function estSCarga1 = readSCarga1(m)
SCarga1_bruto = read(m,'holdingregs',201,1,'uint16');
a=20/65535;
b=10-a*32767;
SCarga1_calibrado = a*SCarga1_bruto+b;
estSCarga1 = (SCarga1_calibrado*1000)/0.024;
end

