function estSHum1 = readHum1(m)
estSHum1_bruto = read(m,'holdingregs',211,1,'uint16');
estSHum1 = 0.25*estSHum1_bruto-50;
end

