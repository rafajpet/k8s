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
Create a default fully qualified resource-aggregate name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ocfcloud.resourceaggregate.fullname" -}}
{{- if .Values.resourceaggregate.fullnameOverride -}}
{{- .Values.resourceaggregate.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.resourceaggregate.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.services.resourceaggregate.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified resource-directory name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ocfcloud.resourcedirectory.fullname" -}}
{{- if .Values.resourcedirectory.fullnameOverride -}}
{{- .Values.resourcedirectory.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.resourcedirectory.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.services.resourcedirectory.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified grpc gateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ocfcloud.grpcgateway.fullname" -}}
{{- if .Values.grpcgateway.fullnameOverride -}}
{{- .Values.grpcgateway.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.grpcgateway.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.services.grpcgateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified auhorization server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ocfcloud.authorizationserver.fullname" -}}
{{- if .Values.authorizationserver.fullnameOverride -}}
{{- .Values.authorizationserver.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.authorizationserver.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.services.authorizationserver.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Coap gateway labels
*/}}
{{- define "ocfcloud.coapgateway.labels" -}}
app: {{ template "ocfcloud.name" . }}
chart: {{ include "ocfcloud.chart" . }}
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
helm.sh/chart: {{ include "ocfcloud.chart" . }}
{{ include "ocfcloud.coapgateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.services.coapgateway.extraLabels }}
{{ toYaml .Values.services.coapgateway.extraLabels | indent 4 }}
{{- end }}
{{- end -}}

{{/*
Resource aggregate labels
*/}}
{{- define "ocfcloud.resourceaggregate.labels" -}}
app: {{ template "ocfcloud.name" . }}
chart: {{ include "ocfcloud.chart" . }}
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
helm.sh/chart: {{ include "ocfcloud.chart" . }}
{{ include "ocfcloud.resourceaggregate.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.services.resourceaggregate.extraLabels }}
{{ toYaml .Values.services.resourceaggregate.extraLabels | indent 4 }}
{{- end }}
{{- end -}}

{{/*
Resource aggregate labels
*/}}
{{- define "ocfcloud.resourcedirectory.labels" -}}
app: {{ template "ocfcloud.name" . }}
chart: {{ include "ocfcloud.chart" . }}
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
helm.sh/chart: {{ include "ocfcloud.chart" . }}
{{ include "ocfcloud.resourcedirectory.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.services.resourcedirectory.extraLabels }}
{{ toYaml .Values.services.resourcedirectory.extraLabels | indent 4 }}
{{- end }}
{{- end -}}

{{/*
Grpc gateway labels
*/}}
{{- define "ocfcloud.grpcgateway.labels" -}}
app: {{ template "ocfcloud.name" . }}
chart: {{ include "ocfcloud.chart" . }}
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
helm.sh/chart: {{ include "ocfcloud.chart" . }}
{{ include "ocfcloud.grpcgateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.services.grpcgateway.extraLabels }}
{{ toYaml .Values.services.grpcgateway.extraLabels | indent 4 }}
{{- end }}
{{- end -}}

{{/*
Authorization server labels
*/}}
{{- define "ocfcloud.authorizationserver.labels" -}}
app: {{ template "ocfcloud.name" . }}
chart: {{ include "ocfcloud.chart" . }}
release: "{{ .Release.Name }}"
heritage: "{{ .Release.Service }}"
helm.sh/chart: {{ include "ocfcloud.chart" . }}
{{ include "ocfcloud.authorizationserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.services.authorizationserver.extraLabels }}
{{ toYaml .Values.services.authorizationserver.extraLabels | indent 4 }}
{{- end }}
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
Resource aggregate image
*/}}
{{- define "ocfcloud.resourceaggregate.image" -}}
    {{- $repositoryName := .Values.general.repository -}}
    {{- $imageName := .Values.services.resourceaggregate.image -}}
    {{- $tag := .Values.general.tag | toString -}}
    {{- if .Values.services.resourceaggregate.tag -}}
        {{- $tag = .Values.services.resourceaggregate.tag | toString -}}
    {{- end -}}
    {{- printf "%s/%s:%s" $repositoryName $imageName $tag -}}
{{- end -}} 

{{/*
Resource aggregate image
*/}}
{{- define "ocfcloud.resourcedirectory.image" -}}
    {{- $repositoryName := .Values.general.repository -}}
    {{- $imageName := .Values.services.resourcedirectory.image -}}
    {{- $tag := .Values.general.tag | toString -}}
    {{- if .Values.services.resourcedirectory.tag -}}
        {{- $tag = .Values.services.resourcedirectory.tag | toString -}}
    {{- end -}}
    {{- printf "%s/%s:%s" $repositoryName $imageName $tag -}}
{{- end -}} 

{{/*
Grpc gateway image
*/}}
{{- define "ocfcloud.grpcgateway.image" -}}
    {{- $repositoryName := .Values.general.repository -}}
    {{- $imageName := .Values.services.grpcgateway.image -}}
    {{- $tag := .Values.general.tag | toString -}}
    {{- if .Values.services.grpcgateway.tag -}}
        {{- $tag = .Values.services.grpcgateway.tag | toString -}}
    {{- end -}}
    {{- printf "%s/%s:%s" $repositoryName $imageName $tag -}}
{{- end -}} 

{{/*
Authorization server image
*/}}
{{- define "ocfcloud.authorizationserver.image" -}}
    {{- $repositoryName := .Values.general.repository -}}
    {{- $imageName := .Values.services.authorizationserver.image -}}
    {{- $tag := .Values.general.tag | toString -}}
    {{- if .Values.services.authorizationserver.tag -}}
        {{- $tag = .Values.services.authorizationserver.tag | toString -}}
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
Resource aggregate selector lagels
*/}}
{{- define "ocfcloud.resourceaggregate.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.services.resourceaggregate.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of:  {{ include "ocfcloud.name" . }}
{{- end -}}

{{/*
Resource aggregate selector lagels
*/}}
{{- define "ocfcloud.resourcedirectory.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.services.resourcedirectory.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of:  {{ include "ocfcloud.name" . }}
{{- end -}}

{{/*
Resource aggregate selector lagels
*/}}
{{- define "ocfcloud.grpcgateway.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.services.grpcgateway.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of:  {{ include "ocfcloud.name" . }}
{{- end -}}

{{/*
Authorization server selector lagels
*/}}
{{- define "ocfcloud.authorizationserver.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.services.authorizationserver.name }}
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
        {{- printf "%s.%s:%s" $serviceName $namespaceName  $servicePort -}}
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
        {{- printf "%s.%s:%s" $serviceName $namespaceName $servicePort -}}
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
        {{- printf "%s.%s:%s" $serviceName $namespaceName $servicePort -}}
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
        {{- printf "mongodb://%s.%s:%s" $serviceName $namespaceName $servicePort -}}
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
        {{- printf "nats://%s.%s:%s" $serviceName $namespaceName $servicePort -}}
    {{- end -}} 
{{- end -}}