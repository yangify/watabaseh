# Commands
```
mvn liquibase:update 
```
```
mvn liquibase:generateChangeLog -Dliquibase.outputChangeLogFile=src/main/resources/changelog/generated.mysql.sql
```

# Considerations
* when to use XML
* when to use sql
* changelog file naming convention
* changeset id naming convention