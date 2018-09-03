[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html) [![License](https://img.shields.io/badge/license-proprietary-AF4C64.svg)](https://github.com/LREN-CHUV/DATASET-data-db-setup/blob/master/LICENSE)
[![build status](https://gitlab.com/hbpmip/DATASET-data-db-setup/badges/master/build.svg)](https://gitlab.com/hbpmip/DATASET-data-db-setup/commits/master)

# DATASET_LABEL meta database setup

This Docker image manages the database migration scripts for the DATASET_LABEL dataset.

DATASET_LABEL dataset is split into table mip_cde_features for the CDE features and DATASET_features for the DATASET_LABEL specific features.

The view mip_local_features contains the variables from both MIP CDE and DATASET_LABEL.

## Introduction

This project uses Flyway to manage the database migration scripts for the 'meta-db' database used by MIP.

This database contains the metadata used for reference, including:

* the list of variables and groups for the Common Data Elements (CDE) defined by MIP.
* the list of variables and groups for DATASET_LABEL

## Usage

Run:

```console
$ docker run -i -t --rm -e FLYWAY_HOST=`hostname` registry.gitlab.com/hbpmip_private/DATASET-meta-db-setup:0.0.1 migrate
```

where the environment variables are:

* FLYWAY_HOST: database host, default to 'db'.
* FLYWAY_PORT: database port, default to 5432.
* FLYWAY_DATABASE_NAME: name of the database or schema, default to 'meta'
* FLYWAY_URL: JDBC url to the database, constructed by default from FLYWAY_DBMS, FLYWAY_HOST, FLYWAY_PORT and FLYWAY_DATABASE_NAME
* FLYWAY_DRIVER: Fully qualified classname of the jdbc driver (autodetected by default based on flyway.url)
* FLYWAY_USER: database user, default to 'meta'.
* FLYWAY_PASSWORD: database password, default to 'meta'.
* FLYWAY_SCHEMAS: Optional, comma-separated list of schemas managed by Flyway
* FLYWAY_TABLE: Optional, name of Flyway's metadata table (default: schema_version)

## Development

Regenerate the Json patch using the command:

```console
  rm mip.patch.json
  ../meta-db-setup/create-patch.amm variables.json mip.patch.json
  pre-commit run --all-files
```

Regenerate the variables hierarchy json using the command:

```console
  rm variables.json
  ../meta-db-setup/apply-patch.amm variables.json mip.patch.json
  pre-commit run --all-files
```

## Build the Docker image

Run: `./build.sh`

## Publish on Docker Hub

Run: `./publish.sh`

## License

### DATASET-meta-db-setup

(this project)

Copyright (C) 2018 IRCCS DATASET_LABEL and LREN CHUV

Contains proprietary data.

DO NOT REDISTRIBUTE.


### Flyway

Copyright (C) 2016-2017 [Boxfuse GmbH](https://boxfuse.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

## Trademark
Flyway is a registered trademark of [Boxfuse GmbH](https://boxfuse.com).

# Acknowledgements

This work has been funded by the European Union Seventh Framework Program (FP7/2007­2013) under grant agreement no. 604102 (HBP)

This work is part of SP8 of the Human Brain Project (SGA2).
