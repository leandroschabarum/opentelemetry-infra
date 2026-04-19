# Opentelemetry Observability Stack
Boilerplate for OpenTelemetry LGTM observability stack.
----

## Getting started:

The first step is to instrument your application code with [OpenTelemetry](https://opentelemetry.io) and send its metrics, traces, and logs to the OpenTelemetry [collector](https://opentelemetry.io/docs/collector).

After your code is instrumented, the next step is to spin up the OpenTelemetry [collector](https://opentelemetry.io/docs/collector) and the LGTM stack ([Loki](https://grafana.com/oss/loki), [Grafana](https://grafana.com/oss/grafana), [Tempo](https://grafana.com/oss/tempo) and [Mimir](https://grafana.com/oss/mimir)).

This setup is already configured for local development, so you can quickly get started by running:

```bash
make all
docker compose up -d
```

All configuration files are available in the `binds/config` folder. Feel free to change them (except the *.base.yaml templates) as needed to match your deployment requirements.

A `.env` file is created automatically from `.env.example` if it does not exist yet. You can update the location of your configuration files in the `.env` file, so you can customize your deployment even further.

All LGTM data is stored in the `binds/data` folder by default. The location can be changed in the `.env` file too. If you keep the defaults, removing it will wipe out all stored data from the LGTM stack.

If desired, you can generate the `.env` or the configuration files separately. The following make recipes only generate the files if they do not exist yet:

```bash
make env
make config
```

If you need further instructions for configuring your deployment, refer to the examples in Grafana’s [intro-to-mltp](https://github.com/grafana/intro-to-mltp) repository or the official [Grafana Labs](https://grafana.com) documentation.

----

## Notice

This package itself is licensed under the [MIT license](./LICENSE).

**Disclaimer:** This project is provided “as is”, without warranty of any kind. The author assumes no responsibility for how this package is used.
