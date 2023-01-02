# otel-lambda-extension

```Dockerfile
FROM ghcr.io/philo-io/otel-lambda-extension:main AS layer

FROM public.ecr.aws/lambda/dotnet:7

WORKDIR /opt
COPY --from=layer /opt/ .

WORKDIR /var/task
COPY "bin/Release/lambda-publish"  .
```
