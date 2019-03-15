# !! NO agregar "/" al final, ya que se incluye a continuación para facilitar la lectura !!
BACKUP_DIRECTORY="/home/usuario/backups"

# Date stamp (formato YYYYMMDD) # sólo se utiliza en el nombre del archivo
CURRENT_DATE=$(date "+%Y%m%d")

# !!! Importante: el comando pg_dump no exporta tablas de usuarios / grupos
# es necesario mantener un pg_dumpall para la recuperación completa de desastres !!!

# esto verifica si el primer argumento de la línea de comando es nulo
if [ -z "$1" ]
then
# No se especifico base de datos, haga una copia de seguridad completa utilizando pg_dumpall
pg_dumpall | gzip - > $BACKUP_DIRECTORY/everything_$CURRENT_DATE.bak

else
# Base de datos nombrada (argumento de línea de comando) usa pg_dump para el respaldo objetivo
pg_dump -d $1 -Fc -f $BACKUP_DIRECTORY/$1_$CURRENT_DATE.bak

fi
