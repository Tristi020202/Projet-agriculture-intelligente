function estSCarga3 = readSCarga3(m)
SCarga3_bruto = read(m,'holdingregs',203,1,'uint16');
a=20/65535;
b=10-a*32767;
SCarga3_calibrado = a*SCarga3_bruto+b;
estSCarga3 = (SCarga3_calibrado*1000)/0.024;
end

