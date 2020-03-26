# Kibana Cookbook

Kibana is an open source tool that allows you to visualise data stored on Elasticsearch. Currently, this cookbook is configured to install Kibana and includes a template file: "kibana.yml". This file provides the basic configuration for running Kibana and to connect to Elasticsearch. If the Kibana instance is provided with a public IP, then you can access it at <PublicIP>:5601.
  
## Unit tests

To run the unit tests for the cookbook, type:

```
chef exec rspec spec
```

## Integration tests

To run the integration tests, type:

```
kitchen test
```

![Kibana logo](https://logodix.com/logo/1938623.png)
