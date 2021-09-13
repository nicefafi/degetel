XTC=xtc xtcdrupal xtcfile xtcguzzle xtcelasticsearch xtcsearch
CASA=jwoffre jwfieldgroup jwtools jwmedia jwconfig jwuser
THEMES=jobwaze_theme jobwaze_search jobwaze_content jobwaze_account
OTHER=

init-casa:
	for repo in $(CASA); do (cd ${MODULE_CUSTOM}/; pwd; rm -fr $$repo; git clone git@gitlab.com:cacd2/casa/jobwaze/$$repo.git --branch develop ; echo "----------";); done

init-xtc:
	for repo in $(XTC); do ( \
		cd ${MODULE_CONTRIB}/$$repo; pwd; \
		git remote add gitlab git@gitlab.com:sashainparis/$$repo.git; \
		git fetch --all; \
		git checkout -b master gitlab/master; \
		git checkout -b develop gitlab/develop; \
		echo "----------"; \
	); done

init-theme:
	for repo in $(THEMES); do (cd ${THEME_CUSTOM}/; pwd; rm -fr $$repo; git clone git@gitlab.com:cacd2/casa/jobwaze/$$repo.git --branch develop ; echo "----------";); done

init-dev:
	@echo "*** Utiliser les dépôts GIT ***"
	@echo "... pour les modules Jobwaze"
	make init-casa
	@echo "... pour les themes Jobwaze"
	make init-theme

status-casa:
	for repo in $(CASA); do (cd ${MODULE_CUSTOM}/$$repo; pwd; git status; echo "----------";); done

status-xtc:
	for repo in $(XTC); do (cd ${MODULE_CONTRIB}/$$repo; pwd; git status; echo "----------";); done

status-theme:
	for repo in $(THEMES); do (cd ${THEME_CUSTOM}/$$repo; pwd; git status; echo "----------";); done

status-cms:
	pwd; git status; echo "----------";

status-all:
	make status-casa
	make status-theme
	make status-cms


fetch-casa:
	for repo in $(CASA); do (cd ${MODULE_CUSTOM}/$$repo; pwd; git fetch; echo "----------";); done

fetch-xtc:
	for repo in $(XTC); do (cd ${MODULE_CONTRIB}/$$repo; pwd; git fetch; echo "----------";); done

fetch-theme:
	for repo in $(THEMES); do (cd ${THEME_CUSTOM}/$$repo; pwd; git fetch; echo "----------";); done

fetch-cms:
	for repo in $(OTHER); do (cd ${PROJ_ROOT}/$$repo; pwd; git fetch; echo "----------";); done

fetch-all:
	make fetch-casa
#	make fetch-xtc
	make fetch-theme
	make fetch-cms


pull-casa:
	for repo in $(XTC); do (cd ${MODULE_CUSTOM}/$$repo; pwd; git pull; echo "----------";); done

pull-xtc:
	for repo in $(XTC); do (cd ${MODULE_CONTRIB}/$$repo; pwd; git pull; echo "----------";); done

pull-theme:
	for repo in $(THEMES); do (cd ${THEME_CUSTOM}/$$repo; pwd; git pull; echo "----------";); done

pull-cms:
	for repo in $(OTHER); do (cd ${PROJ_ROOT}/$$repo; pwd; git pull; echo "----------";); done

pull-all:
	make pull-casa
#	make pull-xtc
	make pull-theme
	make pull-cms


branch-casa:
	for repo in $(CASA); do (cd ${MODULE_CUSTOM}/$$repo; pwd; git branch; echo "----------";); done

branch-xtc:
	for repo in $(XTC); do (cd ${MODULE_CONTRIB}/$$repo; pwd; git branch; echo "----------";); done

branch-theme:
	for repo in $(THEMES); do (cd ${THEME_CUSTOM}/$$repo; pwd; git branch; echo "----------";); done

branch-cms:
	for repo in $(OTHER); do (cd ${PROJ_ROOT}/$$repo; pwd; git branch; echo "----------";); done

branch-all:
	make branch-casa
#	make branch-xtc
	make branch-theme
	make branch-cms
