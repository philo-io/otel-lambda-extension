FROM golang AS build

WORKDIR /context
RUN git clone https://github.com/open-telemetry/opentelemetry-lambda.git

WORKDIR /context/opentelemetry-lambda/collector
RUN make build

FROM scratch
WORKDIR /opt
COPY --from=build /context/opentelemetry-lambda/collector/build .
