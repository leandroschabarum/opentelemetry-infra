# -*- MakeFile -*-
CONFIGS=binds/config/loki binds/config/tempo binds/config/mimir binds/config/collector binds/config/fluent-bit
ENV_FILE=.env

.PHONY: env

# Default targets
all: env config

# Generate environment file if it doesn't exist
env: $(ENV_FILE)

# Generate all configuration files
config: $(CONFIGS:=.yaml)

$(ENV_FILE):
	@cp -a .env.example $(ENV_FILE)
	@echo "Environment file $(ENV_FILE) created"

# Generate <config>.yaml from <config>.base.yaml parsing environment variables
%.yaml: %.base.yaml
	@sh -c "set -a; [ -r ./$(ENV_FILE) ] && . ./$(ENV_FILE); set +a; envsubst < $< > $@"
	@echo "Generated $@ config from $<"

# Remove all generated files
clean:
	@rm -rf $(CONFIGS:=.yaml) $(ENV_FILE)

# Remove all data files
reset: clean
	@rm -rf binds/data/**/*
