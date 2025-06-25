function estSViento = readSViento(m)
estSViento_bruto = read(m,'holdingregs',205,1,'uint16');
estSViento = estSViento_bruto/100;
end

