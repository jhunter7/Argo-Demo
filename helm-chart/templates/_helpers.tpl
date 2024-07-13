{{/*
Expand fullname to include the release name and chart name, truncated to 63 characters to avoid exceeding the DNS name length limit.
*/}}
{{- define "fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the chart name.
*/}}
{{- define "chartName" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Return the chart version.
*/}}
{{- define "chartVersion" -}}
{{- .Chart.Version -}}
{{- end -}}

{{/*
Return the release name.
*/}}
{{- define "releaseName" -}}
{{- .Release.Name -}}
{{- end -}}

{{/*
Common labels.
*/}}
{{- define "commonLabels" -}}
app.kubernetes.io/name: {{ include "chartName" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ include "chartVersion" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels.
*/}}
{{- define "selectorLabels" -}}
app: {{ include "chartName" . }}
release: {{ .Release.Name }}
{{- end -}}

{{/*
Return the service account name.
*/}}
{{- define "serviceAccountName" -}}
{{- printf "%s-%s" .Release.Name "sa" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
