function estSCarga2 = readSCarga2(m)
SCarga2_bruto = read(m,'holdingregs',202,1,'uint16');
a=20/65535;
b=10-a*32767;
SCarga2_calibrado = a*SCarga2_bruto+b;
estSCarga2 = (SCarga2_calibrado*1000)/0.024;
end

