function estSTemp2 = readTemp2(m)
estSTemp2_bruto = read(m,'holdingregs',214,1,'uint16');
estSTemp2 = estSTemp2_bruto*0.1;
end

