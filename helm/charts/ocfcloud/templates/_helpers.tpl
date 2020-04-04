{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ocfcloud.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ocfcloud.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified coap-gateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ocfcloud.coapgateway.fullname" -}}
{{- if .Values.coapgateway.fullnameOverride -}}
{{- .Values.coapgateway.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.coapgateway.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.services.coapgateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Coap gateway labels
*/}}
{{- define "ocfcloud.coapgateway.labels" -}}
helm.sh/chart: {{ include "ocfcloud.chart" . }}
{{ include "ocfcloud.coapgateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Coap gateway name
*/}}
{{- define "ocfcloud.coapgateway.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Coap gateway image
*/}}
{{- define "ocfcloud.coapgateway.image" -}}
    {{- $repositoryName := .Values.general.repository -}}
    {{- $imageName := .Values.services.coapgateway.image -}}
    {{- $tag := .Values.general.tag | toString -}}
    {{- if .Values.services.coapgateway.tag -}}
        {{- $tag = .Values.services.coapgateway.tag | toString -}}
    {{- end -}}
    {{- printf "%s/%s:%s" $repositoryName $imageName $tag -}}
{{- end -}} 

{{/*
Coap gateway selector lagels
*/}}
{{- define "ocfcloud.coapgateway.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.services.coapgateway.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of:  {{ include "ocfcloud.name" . }}
{{- end -}}


{{/*
Authorization server service address
*/}}
{{- define "ocfcloud.authorizationserver.address" -}}
    {{- if .Values.authorizationserver.address -}}
        {{- printf "%s" .Values.authorizationserver.address -}}
    {{- else -}}
        {{- $serviceName := .Values.services.authorizationserver.name -}}
        {{- $namespaceName := .Release.Namespace -}}
        {{- $clusterName := .Values.clusterDomain -}}
        {{- $servicePort := .Values.services.authorizationserver.grpcPort | toString -}}
        {{- printf "%s.%s.svc.%s:%s" $serviceName $namespaceName $clusterName $servicePort -}}
    {{- end -}} 
{{- end -}}

{{/*
Resource directory service address
*/}}
{{- define "ocfcloud.resourcedirectory.address" -}}
    {{- if .Values.resourcedirectory.address -}}
        {{- printf "%s" .Values.resourcedirectory.address -}}
    {{- else -}}
        {{- $serviceName := .Values.services.resourcedirectory.name -}}
        {{- $namespaceName := .Release.Namespace -}}
        {{- $clusterName := .Values.clusterDomain -}}
        {{- $servicePort := .Values.services.resourcedirectory.grpcPort | toString -}}
        {{- printf "%s.%s.svc.%s:%s" $serviceName $namespaceName $clusterName $servicePort -}}
    {{- end -}} 
{{- end -}}

{{/*
Resource aggregate service address
*/}}
{{- define "ocfcloud.resourceaggregate.address" -}}
    {{- if .Values.resourceaggregate.address -}}
        {{- printf "%s" .Values.resourceaggregate.address -}}
    {{- else -}}
        {{- $serviceName := .Values.services.resourceaggregate.name -}}
        {{- $namespaceName := .Release.Namespace -}}
        {{- $clusterName := .Values.clusterDomain -}}
        {{- $servicePort := .Values.services.resourceaggregate.grpcPort | toString -}}
        {{- printf "%s.%s.svc.%s:%s" $serviceName $namespaceName $clusterName $servicePort -}}
    {{- end -}} 
{{- end -}}


{{/*
Mongo db address
*/}}
{{- define "ocfcloud.mongodb.address" -}}
    {{- if .Values.mongodb.address -}}
        {{- printf "%s" .Values.mongodb.address -}}
    {{- else -}}
        {{- $serviceName := .Values.services.mongodb.name -}}
        {{- $namespaceName := .Release.Namespace -}}
        {{- $clusterName := .Values.clusterDomain -}}
        {{- $servicePort := .Values.services.mongodb.port | toString -}}
        {{- printf "mongodb://%s.%s.svc.%s:%s" $serviceName $namespaceName $clusterName $servicePort -}}
    {{- end -}} 
{{- end -}}

{{/*
Nats address
*/}}
{{- define "ocfcloud.nats.address" -}}
    {{- if .Values.nats.address -}}
        {{- printf "nats://%s" .Values.nats.address -}}
    {{- else -}}
        {{- $serviceName := .Values.services.nats.name -}}
        {{- $namespaceName := .Release.Namespace -}}
        {{- $clusterName := .Values.clusterDomain -}}
        {{- $servicePort := .Values.services.nats.port | toString -}}
        {{- printf "nats://%s.%s.svc.%s:%s" $serviceName $namespaceName $clusterName $servicePort -}}
    {{- end -}} 
{{- end -}}