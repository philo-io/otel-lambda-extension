FROM golang AS build

WORKDIR /context
RUN git clone --recurse-submodules https://github.com/aws-observability/aws-otel-lambda.git

WORKDIR /context/aws-otel-lambda
RUN ./patch-upstream.sh

WORKDIR /context/aws-otel-lambda/opentelemetry-lambda/collector
RUN make build

FROM scratch
WORKDIR /opt
COPY --from=build /context/aws-otel-lambda/opentelemetry-lambda/collector/build .
