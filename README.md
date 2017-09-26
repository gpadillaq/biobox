# BioBox - Sistema de impresión de Tickets.

BioBox es una aplicación similar a la de las máquinas recolectoras de botellas de PET dividida en tres partes arduino, script y aplicación web.

El programa de arduino ubicado en arduino/biobox.ino en esta archivo se define el pin donde se conectara en sensor pin 13, ademas define la funcionalidad que tendra el arduino. De manera general la aplicacion una vez que detecte que algo el sensor enviara true a un puerto usb al que esta conectado el arduino.

El script ubicado en bin/biobox encargado de leer la señal enviada por el arduino al puerto USB, luego este le envia la señal a la aplicacion usando RestClient. La aplicaciòn web retorna una imagen del ticket y el scrip lee e imprime el archivo utilizando el comando lp en la [linea 55](https://github.com/gpadillaq/biobox/blob/master/bin/biobox#L53) del archivo.
Nota: esta linea debe ser decomentada para probar el script, se comento para poder relizar pruebas sin necesitad de tener una impresora.

La aplicacion web esta es la encargada de alimentar la base de datos, es utilizada para crear lo ticket que seran impresos por el script.

# Como utilizar BioBox.

1) Realizar el git clone del proyecto:
```
git clone https://github.com/gpadillaq/biobox.git
```

2) Instalar la versión 2.3.3 de ruby, BioBox ha sido desarrollado y probado en esta versiòn. el método de instalaciòn de ruby puede ser el que mejor se ajuste a cada desarrollador, en lo personal yo utilizo [rvm](https://rvm.io/rvm/install) pueden echarle un vistaso.

3) Estando en la raiz del proyecto instalar la gema bundler.
```gem install bundler.```

4) Ejecutar el ```bundle install``` para installar todas las gemas que necesita el proyecto para funcionar correctamente.

5) Para ejecutar el proyecto se configuro foreman de esta forma se hace mas facil correr el servidor y el script a la vez. una vez conectado el arduino a la pc pueden ejecutar lo siguiente:
```$PORT=3000 foreman start```

Nota: BioBox solo ha sido probado en fedora y mac, si encuentran algun inconveniente pueden contactarme estare encantado de apoyarlos. Acepto cualquier tipo de comentario y sugerencia.

## Autor

* **Gerald Padilla** - *Software Developer* - [gpadillaq](https://github.com/gpadillaq)

