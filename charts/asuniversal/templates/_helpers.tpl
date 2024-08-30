{{/*
Expand the name of the chart.
*/}}
{{- define "asuniversal.name" -}}
{{- .Values.deploymentName | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "asuniversal.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := .Values.deploymentName }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "asuniversal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "asuniversal.labels" -}}
helm.sh/chart: {{ include "asuniversal.chart" . }}
{{ include "asuniversal.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "asuniversal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "asuniversal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "asuniversal.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "asuniversal.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create container extras
*/}}
{{- define "asuniversal.containerExtras" -}}
          image: "{{ .container.image.repository }}:{{ .container.image.tag | default "latest" }}"
          imagePullPolicy: {{ default .container.image.pullPolicy "IfNotPresent" }}
          {{- with .container.env }}
          env:
          {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .container.command }}
          command:
          {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .container.args }}
          args:
          {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .container.ports }}
          ports:
            {{- range . }}
            - name: {{ .name }}
              containerPort: {{ .port }}
              protocol: {{ .protocol }}
            {{- end }}
          {{- end }}
          {{- with .container.volumeMounts }}
          volumeMounts:
          {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .container.livenessProbe }}
          livenessProbe:
          {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .container.readinessProbe }}
          readinessProbe:
          {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- if .defaultSecurityContext }}
          securityContext:
          {{- toYaml .defaultSecurityContext | nindent 12 }}
          {{- else if .container.securityContext }}
          securityContext:
          {{- toYaml .container.securityContext | nindent 12 }}
          {{- end }}
          {{- if .defaultResources }}
          resources:
          {{- toYaml .defaultResources | nindent 12 }}
          {{- else if .container.resources }}
          resources:
          {{- toYaml .container.resources | nindent 12 }}
          {{- end }}
{{- end }}

{{- define "asuniversal.persistenceClaim" -}}
{{- $fullname := include "asuniversal.fullname" . }}
{{- $storageClass := .Values.persistence.storageClass }}
{{- $labels :=  include "asuniversal.labels" . }}
{{- if .Values.persistence.preserve }}
  {{- if not (hasKey .Values.persistence.annotations "helm.sh/resource-policy") }}
  {{- $_ := set .Values.persistence.annotations "helm.sh/resource-policy" "keep" }}
  {{- end }}
{{- end }}
{{- $annotations := .Values.persistence.annotations }}
{{- with .Values.persistence.claims }}
{{- range . }}
{{- if not .existingClaim }}
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: data-{{ printf "%s-%s" $fullname .name | trimSuffix "-"  }}
  labels:
    {{- $labels | nindent 4 }}
  {{- with $annotations }}
  annotations:
    {{- toYaml . | nindent 4}}
  {{- end }}
spec:
  storageClassName: {{ $storageClass }}
  accessModes:
    - {{ .accessMode }}
  resources:
    requests:
      storage: {{ .size }}
{{- end }}
{{- end }}
{{- end }}
{{- end -}}