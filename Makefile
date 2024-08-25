.PHONY: create-network 
create-network:
	@docker network create micro-service-network

.PHONY: run
run:
	@$(MAKE) -j  run-database run-monitoring run-apisix run-keycloak run-network run-dashboard

.PHONY: run-database
run-database:
	@docker-compose -f "./database/docker-compose.yml" -p database up -d

.PHONY: run-monitoring
run-monitoring:
	@docker-compose -f "./monitoring/docker-compose.yml" -p monitoring up -d

.PHONY: run-apisix
run-apisix:
	@docker-compose -f "./apisix/docker-compose.yml" -p apisix up -d

.PHONY: run-keycloak
run-keycloak:
	@docker-compose -f "./keycloak/docker-compose.yml" -p keycloak up -d

.PHONY: run-network
run-network:
	@docker-compose -f "./network/docker-compose.yml" -p network up -d

.PHONY: run-dashboard
run-dashboard:
	@docker-compose -f "./dashboard/docker-compose.yml" -p dashboard up -d