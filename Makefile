# Project directory
DIR = /home/kyle/repos/side-projects/personal-project/congenial-disco/apps

# Executables (local)
NODE_PKG_MANAGER = yarn

# Apps directories
FRONTEND_DIR = $(DIR)/front

# Misc
.DEFAULT_GOAL = help
.PHONY        : help style-frontend frontend

## Outputs this help screen
help:
	@grep -E '(^[a-zA-Z0-9\./_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

## —— Frontend Style ——————————————————————————————————
style-frontend: ## Execute prettier and eslint in frontend
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) run style
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) tsc --noEmit

## —— Start Development Server ——————————————————————————————————
frontend: ## Start frontend development server
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) run dev