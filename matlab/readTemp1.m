function estSTemp1 = readTemp1(m)
estSTemp1_bruto = read(m,'holdingregs',212,1,'uint16');
estSTemp1 = estSTemp1_bruto*0.1;
end

