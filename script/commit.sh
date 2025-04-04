#!/bin/bash
echo -e "
\033[34mFEAT\033[0m: cuando se añade una nueva funcionalidad.
\033[31mFIX\033[0m: cuando se arregla un error.
\033[32mCHORE\033[0m: tareas rutinarias que no sean específicas .gitignore o instalar una dependencia.
\033[33mTEST\033[0m: si añadimos o arreglamos tests.
\033[35mDOCS\033[0m: cuando solo se modifica documentación.
\033[38mBUILD\033[0m: cuando el cambio afecta al compilado del proyecto.
\033[36mCI\033[0m: el cambio afecta a ficheros de configuración y scripts relacionados con la integración continua.
\033[42mSTYLE\033[0m: cambios de legibilidad o formateo de código que no afecta a funcionalidad.
\033[41mREFACTOR\033[0m: cambio de código que no corrige errores ni añade funcionalidad, pero mejora el código.
\033[34mPERF\033[0m: usado para mejoras de rendimiento.
\033[45mREVERT\033[0m: si el commit revierte un commit anterior. Debería indicarse el hash del commit que se revierte. 
"
sleep 10
