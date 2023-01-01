FROM golang AS build

WORKDIR /context
RUN git clone --recurse-submodules https://github.com/aws-observability/aws-otel-lambda.git

WORKDIR /context/aws-otel-lambda/opentelemetry-lambda
RUN git apply ../collector.patch

WORKDIR /context/aws-otel-lambda/opentelemetry-lambda/collector
RUN make build

FROM scratch
WORKDIR /opt
COPY --from=build /context/aws-otel-lambda/opentelemetry-lambda/collector/build .
