# Laboratorio 2  - ED1

Sistema digital para banco de baterías con indicadores de carga. Implementado en Cyclone  FPGA en Verilog para la asignatura **electrónica digital I** de la Universidad Nacional de Colombia. 2024-ii

**Autores:** 
- Jonathan Jimenes 
- Andrés Morales Martínez
- Ronaldo Lopez 

## Especificaciones 
- Banco de dos baterías. Medición de carga ADC de 4 bits. 
- Indicador de tres niveles de carga 
	- **Completa:** Carga total entre ambas baterías 
	- **Aceptable:** Carga al 70% de las baterías  
	- **Regular:** Carga al 30% de las baterias  
	- **Crítica:** Carga Menos al 10% de las baterías 
- Indicador de descarga completa por unidad de batería 

## Propuesta de solución 
El problema se divide en 3 modulos. 
1. **Suma de carga:** Entrega la carga total leída en el banco de baterías. 
2. **Comparador de carga:** 
3. Crítica

## Suma
### Sumador de 1 bit 
Sumador completo de 1 bit, que devuelve la suma binaria de 1 bit, y un 1 bit de acarreo para un sumador en cascada. Implementado en `src/adder/1bit_adder.v`
**Entrada:** A, B, Ci
**Salida:** S, Co


### Sumador de n bits. 
Se implementa un ciclo for para la generación de instancias de sumadores de 1bit. Se interconecta en cascada para que el acarreo de entrada ($C_{i}$) de la i-esima instancia, sea el acarreo de salida de instancia anterior. 

**Consideración:** El sumador completo de 1bit para el LSB, tiene $C_i$ 0.

Se optó por generalizar el sumador, para que pueda ser usado con **ADC** de diferentes alcances, con la facilidad de modificar el parámetro de adición. 

## Casos de carga (Teclado matricial)


## Escalabilidad 

- El sumador de 1bit es escalable para sumar a n-bits definiendo definidas por un parámetro de generación al importar `nbit_adder`
- El comparador permite inidicar estados de carga definiendo los umbrales de manera parámetrica. 
- 

## Validación y pruebas 

La implementación se realiza en la Cyclone IV, usando un dipswitch de 8-entradas para emular el banco de dos baterias (4bits por bateria). El desarrollo modular permite realizar Testbenchs (TB) independientes en diferentes etapas de diseño. En particular, realizar tests por unidad, para validar el comportamiento deseado en diferentes niveles de diseño (top-down)

Todas las pruebas están contenidas en `/test`. 

* `test/1bit_adder_TB.v`
* `test/nbit_adder_TB.v`

Cada TB compila en `/build` la simulación en formato **.vcd** para ser leído por **gtkwave**. A continuación se muestran las simulaciones realizadas. 

1. **Sumador de 1 bit:**
2. **Sumador de n bit (n = 4):**
3. **Comparación de descarga completa**
4. **Estados de carga:** 

Se articulan todos los modulos en un sistema único, y se valida su comportamiento: 


### Implementación en FPGA



## Conclusiones 









