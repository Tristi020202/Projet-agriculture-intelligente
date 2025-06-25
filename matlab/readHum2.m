function estSHum2 = readHum2(m)
estSHum2_bruto = read(m,'holdingregs',213,1,'uint16');
estSHum2 = 0.25*estSHum2_bruto-50;
end
