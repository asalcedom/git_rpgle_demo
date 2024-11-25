**free
ctl-opt dftactgrp(*no) option(*nodebugio:*srcstmt:*nounref);

dcl-f calcudspf workstn indds(indicadores);

dcl-ds indicadores;
    salir ind pos(03);
end-ds;

dcl-s result packed(6);

write cabecera;
write fkeys;
exfmt entrada;

dow not salir;
  select op;
    when-is '+';
      suma(op1:op2:result);
    when-is '-';
      result = resta(op1:op2);
  endsl;

  resulta = %char(op1) + ' ' + op + ' ' + %char(op2) + ' = ' + %char(result);
  write resultado;
  exfmt entrada;
enddo;

*inlr = *on;

dcl-proc suma export;
  dcl-pi *n;
    n1     packed(5);
    n2     packed(5);
    result packed(6);
  end-pi;

  result = n1 + n2;
end-proc;

dcl-proc resta export;
  dcl-pi *n packed(6);
    n1 packed(5);
    n2 packed(5);
  end-pi;

  return n1 - n2;
end-proc; 