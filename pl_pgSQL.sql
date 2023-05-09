-- EJERCICIOS
/*
1 - Escriba un bloque de codigo PL/pgSQL que reciba una nota como parametro
    y notifique en la consola de mensaje las letras A,B,C,D,E o F segun el valor de la nota
*/
DO $$
DECLARE nota char;
declare inp int := 2;
BEGIN
CASE inp
	WHEN 1 THEN
		nota = 'A';
	WHEN 2 THEN
		nota = 'B';
	WHEN 3 THEN
		nota = 'C';
	WHEN 4 THEN
		nota = 'D';
	WHEN 5 THEN
		nota = 'E';
	WHEN 6 THEN
		nota = 'F';
ELSE
	RAISE NOTICE 'Error';
END CASE;
    RAISE NOTICE 'La nota es %, lo que equivale a una letra %', inp, nota;
END $$ LANGUAGE plpgsql;
/*
2 - Escriba un bloque de codigo PL/pgSQL que reciba un numero como parametro
    y muestre la tabla de multiplicar de ese numero.
*/
DO $$
DECLARE numero int:=4;
BEGIN
FOR counter IN 1..10 LOOP
	RAISE NOTICE '% * %: %', numero,counter,counter*numero;
   END LOOP;
END $$ LANGUAGE plpgsql;
/*
3 - Escriba una funcion PL/pgSQL que convierta de dolares a moneda nacional.
    La funcion debe recibir dos parametros, cantidad de dolares y tasa de cambio.
    Al final debe retornar el monto convertido a moneda nacional.
*/
DO $$
DECLARE cantidad_dolar int:=4;
DECLARE tasa_cambio float:=1.15;
BEGIN
RAISE NOTICE '% equivale a: %', cantidad_dolar, cantidad_dolar*tasa_cambio;
END $$ LANGUAGE plpgsql;
/*

4 - Escriba una funcion PL/pgSQL que reciba como parametro el monto de un prestamo,
    su duracion en meses y la tasa de interes, retornando el monto de la cuota a pagar.
    Aplicar el metodo de amortizacion frances.
*/
DO $$
 DECLARE monto_inicial numeric:=4000;
 duracion numeric:=10;
 tasa_interes numeric:=0.03;
 cuota numeric;
 interes_mensual numeric:= tasa_interes/12;
 factor numeric:= (1+ interes_mensual)^duracion;

BEGIN
cuota:= (monto_inicial * interes_mensual * factor) / (factor -1);
RAISE NOTICE 'cantidad mensual: %', cuota;
END $$ LANGUAGE plpgsql;