

```git clone https://github.com/hasura/super_supergraph```

Start the containers:
```HASURA_DDN_PAT=$(ddn auth print-pat) docker compose -f docker-compose.hasura.yaml watch```

Navigate to: https://console.hasura.io/local/graphql

Tear down the containers:
```docker-compose -f docker-compose.hasura.yaml down && docker volume rm super_supergraph_pgdata && docker volume rm super_supergraph_mongodata && docker volume rm super_supergraph_qdrant_data```

