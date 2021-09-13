ARCH=${PROJ_ROOT}/database
DATE=$(shell date '+%Y%m%d_%H%M%S')
DBLINK=mba_drupal.sql
DBFILE=mba_${DATE}.sql
JWINT=${PROJ_ROOT}/../jobwaze-integration

#sync-db:
#	@echo "*** SYNC DATABASE FROM DUMP ***"

sync-assets:
	rsync -av ${JWINT}/font/* ${THEME_CUSTOM}/jobwaze_theme/font/
	rsync -av ${JWINT}/img/* ${THEME_CUSTOM}/jobwaze_theme/img/
	rsync -av ${JWINT}/pages/* ${THEME_CUSTOM}/jobwaze_theme/html/
	rsync -av ${JWINT}/src/assets/sass/* ${THEME_CUSTOM}/jobwaze_theme/dist/assets/sass/
	rsync -av ${JWINT}/src/assets/css/jquery/* ${THEME_CUSTOM}/jobwaze_theme/dist/assets/css/jquery/
	#rsync -av ${JWINT}/dist/assets/js/drupal/* ${THEME_CUSTOM}/jobwaze_theme/dist/assets/js/

reload-db:
	@echo "*** RELOAD DRUPAL DATABASE FROM DUMP ***"
	@echo "Import de la base de données : ${ARCH}/${DBLINK}"
	${DRUSH} sql:query -y --file=${ARCH}/${DBLINK}

dump-db:
	@echo "*** DRUPAL DATABASE DUMP ***"
	@echo "Création d'un fichier dump horodaté + MAJ du lien symbolique stable."

	${DRUSH} sql:dump --result-file=${ARCH}/${DBFILE}

	@echo "(Re-)construction du lien symbolique ${ARCH}/${DBLINK}..."

	@if [ -h ${ARCH}/${DBLINK} ] ; \
	then \
		rm ${ARCH}/${DBLINK} ; \
		echo "Info : le fichier ${ARCH}/${DBLINK} a été effacé." ; \
	else \
		echo "Info : le fichier ${ARCH}/${DBLINK} n'existe pas." ; \
	fi;

	@cd ${ARCH}; ln -s ${DBFILE} ${DBLINK}
	@echo
	@echo "Fichier créé :"
	@ls -lah ${ARCH}/${DBFILE};
	@echo "Lien re-créé :"
	@ls -lah ${ARCH}/${DBLINK};
