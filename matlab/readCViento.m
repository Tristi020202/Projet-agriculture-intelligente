function estCViento = readCViento(m)
estCViento_bruto = read(m,'holdingregs',208,1,'uint16');
estCViento = estCViento_bruto/1000;
end

