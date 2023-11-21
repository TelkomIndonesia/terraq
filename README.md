# TerraQ

A simple example of using terraform to only Extract data from providers as JSON printed to stdout. This mechanism can be further utilized inside ETL work such as using [kestra](https://kestra.io/plugins/plugin-terraform/tasks/cli/io.kestra.plugin.terraform.cli.terraformcli) or used as a way to backup configuration.

## Run

For example to run the module in `/src/huaweicloud` inside the container, run:

```bash
docker run -it --rm \
    --env-file .env \
    ghcr.io/telkomindonesia/terraq huaweicloud
```

### Adding module

You can mount your terraform module under `/src` directory on the container and then pass the directory name as the first argument.

```bash
docker run -it --rm \
    --env-file .env \
    -v $PWD/example:/src/example \
    ghcr.io/telkomindonesia/terraq example
```
